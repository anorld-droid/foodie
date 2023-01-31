import 'package:cart/src/widgets/dialog_layout.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  late final PaymentOptionsUseCase _paymentOptionsUseCase;
  late final SendMessageUseCase _sendMessageUseCase;

  final Rx<Destinations> destinations =
      Rx(const Destinations(destinations: []));
  final Rx<String> destinationTown = Rx('');
  final Rx<String> destinationArea = Rx('');

  final Rx<ShippingStatus> shippingStatus = Rx(ShippingStatus.none);
  final Rx<ShippingInfo?> _shippingInfo = Rx(null);
  final Rx<String> shippingAddress = Rx('');

  final Rx<bool> loading = false.obs;

  final Rx<double> subTotal = 0.0.obs;
  final Rx<double> total = 0.0.obs;
  final Rx<double> shippingFee = 0.0.obs;

  final Rx<int> itemLength = 0.obs;

  @override
  void onInit() async {
    super.onInit();
    initialize();

    await loadData();
  }

  void initialize() {
    _authenticateUser = Get.find();
    _userModelUseCase = UserModelUseCase();
    _shippingUseCase = ShippingUseCase();
    _cartItemsUseCase = CartItemsUseCase();
    _paymentOptionsUseCase = PaymentOptionsUseCase();
    _sendMessageUseCase = SendMessageUseCase();

    nameController = TextEditingController();
    phoneController = TextEditingController();
    buildingController = TextEditingController();
    floorController = TextEditingController();
    roomController = TextEditingController();
    landmarkController = TextEditingController();

    itemLength.value = items.value.length;
    calculateTotal();
  }

  Future<void> loadData() async {
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
    var user =
        await _userModelUseCase.getShippingInfo(_authenticateUser.getUserId()!);
    user.listen((event) {
      User user = event.data()!;
      _shippingInfo.value = user.shippingInfo;
      getShippingInfo();
    });
    destinationTown.value = destinations.value.destinations.first.town;
    destinationArea.value = destinations.value.destinations.first.area;

    shippingStatus.value = ShippingStatus.none;
    loading.value = false;
  }

  String getTown(String destination) {
    var dest = destination.split(',').first;
    return dest;
  }

  void getShippingInfo() {
    if (_shippingInfo.value?.name == null) {
      shippingAddress.value = 'No shipping destination, yet!';
    } else {
      shippingAddress.value =
          'Shipping to:\n  ${_shippingInfo.value?.name}, ${_shippingInfo.value?.phoneNumber},\n  ${_shippingInfo.value?.destination?.town}, ${_shippingInfo.value?.destination?.area},\n  ${_shippingInfo.value?.destination?.building}, ${_shippingInfo.value?.destination?.floorNo}, ${_shippingInfo.value?.destination?.roomNo},\n  ${_shippingInfo.value?.destination?.landmark}.';
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
    subTotal.refresh();
    shippingFee.refresh();
  }

  void calculateTotal() {
    _calculateSubTotal();
    total.value = subTotal.value + shippingFee.value;
    total.refresh();
  }

  Future<void> shippingDialog() async {
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

  void checkout() async {
    if (_shippingInfo.value?.name == null) {
      shippingDialog();
    } else if (items.value.isEmpty) {
      longToast('Add items to cart to proceed.');
    } else {
      await _transact();
      sendMessage();
    }
  }

  Future<void> _transact() async {
    final status = await _paymentOptionsUseCase.withMPesa(
        _authenticateUser.getUserId()!,
        total.value.toStringAsFixed(0),
        _authenticateUser.getPhoneNumber()!,
        'food items');
    if (status != null) {
      ShippingModel shippingModel = ShippingModel(
        uid: _authenticateUser.getUserId()!,
        items: items.value,
        orderNo: status,
        status: ShippingStatus.none.name,
      );
      await _shippingUseCase.upload(
        userId: _authenticateUser.getUserId()!,
        shippingModel: shippingModel,
      );
      for (var element in items.value) {
        deleteItem(element);
      }
      shortToast('Checkout successful');
    } else {
      longToast('Payment operation failed.');
    }
  }

  void sendMessage() {
    String text = 'Your order has been received and is being processed.';
    MessageBird sms =
        MessageBird(to: _authenticateUser.getPhoneNumber()!, text: text);
    _sendMessageUseCase.invoke(messageBird: sms);
  }

  void deleteItem(CartItem item) {
    _cartItemsUseCase.delete(
      userId: _authenticateUser.getUserId()!,
      docId: item.id!,
    );
    items.value.removeWhere((element) => element.id == item.id);
    itemLength.value = items.value.length;
    items.refresh();
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
    String phoneNumber = phoneController.text;
    String town = destinationTown.value;
    String area = destinationArea.value;
    String building = buildingController.text;
    String floorNo = floorController.text;
    String roomNo = roomController.text;
    String landmark = landmarkController.text;
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
