import 'package:cart/src/widgets/dialog_layout.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:model/model.dart';
import 'package:domain/domain.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 23.01.2023.
class Controller extends GetxController {
  final Rx<List<CartItem>> items;
  Controller({required this.items}) : super();
  late final TextEditingController nameController;
  late final TextEditingController phoneController;
  late final TextEditingController buildingController;
  late final TextEditingController floorController;
  late final TextEditingController roomController;
  late final TextEditingController landmarkController;

  late final AuthenticateUser _authenticateUser;
  late final UserModelUseCase _userModelUseCase;
  late final ShippingUseCase _shippingUseCase;
  late final CartItemsUseCase _cartItemsUseCase;

  final Rx<Destinations> destinations =
      Rx(const Destinations(destinations: []));
  final Rx<String> destinationTown = Rx('');
  final Rx<String> destinationArea = Rx('');

  final Rx<ShippingStatus> shippingStatus = Rx(ShippingStatus.none);
  final Rx<ShippingInfo?> _shippingInfo = Rx(null);

  final Rx<bool> loading = false.obs;

  final Rx<double> subTotal = 0.0.obs;
  final Rx<double> total = 0.0.obs;
  final Rx<double> shippingFee = 0.0.obs;

  final Rx<int> itemLength = 0.obs;

  @override
  void onInit() {
    super.onInit();
    initializeVar();
    loadData();
  }

  void initializeVar() {
    _authenticateUser = Get.find();
    _userModelUseCase = UserModelUseCase();
    _shippingUseCase = ShippingUseCase();
    _cartItemsUseCase = CartItemsUseCase();

    nameController = TextEditingController();
    phoneController = TextEditingController();
    buildingController = TextEditingController();
    floorController = TextEditingController();
    roomController = TextEditingController();
    landmarkController = TextEditingController();

    itemLength.value = items.value.length;
    calculateTotal();
  }

  void loadData() async {
    loading.value = true;
    destinations.value = const Destinations(
      destinations: [
        DestinationModel(town: 'Kisumu', area: 'Milimani'),
        DestinationModel(town: 'Kisumu', area: 'Nyalenda A'),
        DestinationModel(town: 'Kisumu', area: 'Nyalenda B'),
        DestinationModel(town: 'CBD', area: ''),
        DestinationModel(town: 'Kisumu', area: 'Manyatta B'),
        DestinationModel(town: 'Kisumu', area: 'Obunga'),
        DestinationModel(town: 'Kisumu', area: 'Kondele'),
      ],
    );
    _shippingInfo.value =
        await _userModelUseCase.getShippingInfo(_authenticateUser.getUserId()!);
    destinationTown.value = destinations.value.destinations.first.town;
    destinationArea.value = destinations.value.destinations.first.area;

    shippingStatus.value = ShippingStatus.none;
    loading.value = false;
  }

  String getTown(String destination) {
    var dest = destination.split(',').first;
    return dest;
  }

  String getShippingInfo() {
    if (_shippingInfo.value?.name != null) {
      return 'Shipping to:\n  ${_shippingInfo.value?.name}, ${_shippingInfo.value?.phoneNumber},\n  ${_shippingInfo.value?.destination?.town}, ${_shippingInfo.value?.destination?.area},\n  ${_shippingInfo.value?.destination?.building}, ${_shippingInfo.value?.destination?.floorNo}, ${_shippingInfo.value?.destination?.roomNo},\n  ${_shippingInfo.value?.destination?.landmark}.';
    } else {
      return 'No shipping destination, yet!';
    }
  }

  String getArea(String destination) => destination.split(',').last;
  String getDestination(String town, String area) {
    var destinationValue = '';
    if (town == area || area.isEmpty) {
      destinationValue = town;
    } else {
      destinationValue = '$town, $area';
    }
    return destinationValue;
  }

  void _calculateSubTotal() {
    var sum = 0.0;
    for (var item in items.value) {
      sum += item.sellingPrice.value;
    }
    subTotal.value = sum;
    shippingFee.value = sum * 0.2;
  }

  void calculateTotal() {
    _calculateSubTotal();
    total.value = subTotal.value + shippingFee.value;
  }

  void checkout() async {
    if (_shippingInfo.value != null) {
      ShippingModel shippingModel = ShippingModel(
        uid: _authenticateUser.getUserId()!,
        items: items.value,
        orderNo: 1,
        status: ShippingStatus.none.name,
      );
      await _shippingUseCase.upload(
        userId: _authenticateUser.getUserId()!,
        shippingModel: shippingModel,
      );
      shortToast('Checkout successful');
    } else {
      await showDialog<Widget>(
          context: Get.context!,
          barrierDismissible: false,
          barrierLabel:
              MaterialLocalizations.of(Get.context!).modalBarrierDismissLabel,
          barrierColor: Get.theme.primaryColorDark.withOpacity(.87),
          builder: (BuildContext buildContext) {
            return const DialogLayout();
          });
    }
  }

  void deleteItem(CartItem item) {
    _cartItemsUseCase.delete(
      userId: _authenticateUser.getUserId()!,
      docId: item.id!,
    );
    calculateTotal();
  }

  void incrementQty(CartItem cartItem) {
    var qty = ++cartItem.quantity.value;
    cartItem.sellingPrice.value = cartItem.basicPrice * qty;
    calculateTotal();
  }

  void decrementQty(CartItem cartItem) {
    if (cartItem.quantity > 1.0) {
      var qty = --cartItem.quantity.value;
      cartItem.sellingPrice.value = cartItem.basicPrice * qty;
      calculateTotal();
    }
  }

  Future<void> saveShippingInfo() async {
    String name = nameController.text;
    String phoneNumber = nameController.text;
    String town = nameController.text;
    String area = nameController.text;
    String building = nameController.text;
    String floorNo = nameController.text;
    String roomNo = nameController.text;
    String landmark = nameController.text;
    if (validateInput(
        name, phoneNumber, town, area, building, floorNo, roomNo, landmark)) {
      ShippingInfo shippingInfo = ShippingInfo(
        name: name,
        phoneNumber: phoneNumber,
        destination: DestinationModel(
            town: town,
            area: area,
            building: building,
            floorNo: floorNo,
            roomNo: roomNo,
            landmark: landmark),
      );
      await _userModelUseCase.updateShippingInfo(
        userId: _authenticateUser.getUserId()!,
        shippingInfo: shippingInfo,
      );
      shortToast('Shipping info saved.');
    }
  }

  bool validateInput(String name, String phoneNumber, String town, String area,
      String building, String floorNo, String roomNo, String landmark) {
    if (name.isNotEmpty &&
        phoneNumber.isNotEmpty &&
        town.isNotEmpty &&
        area.isNotEmpty &&
        building.isNotEmpty &&
        floorNo.isNotEmpty &&
        roomNo.isNotEmpty &&
        landmark.isNotEmpty) {
      return true;
    } else {
      shortToast('Please, fill all the details');
      return false;
    }
  }
}
