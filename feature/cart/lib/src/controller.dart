import 'package:cart/src/utils/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 23.01.2023.
class Controller extends GetxController {
  late final TextEditingController buildingController;
  late final TextEditingController floorController;
  late final TextEditingController roomController;
  late final TextEditingController landmarkController;

  final Rx<Destinations> destinations =
      Rx(const Destinations(destinations: []));
  final Rx<String> destinationTown = Rx('');
  final Rx<String> destinationArea = Rx('');
  final Rx<List<CartItem>> cartItems = Rx([]);
  final Rx<ShippingStatus> shippingStatus = Rx(ShippingStatus.none);

  @override
  void onInit() {
    super.onInit();
    initializeVar();
    loadData();
  }

  void initializeVar() {
    buildingController = TextEditingController();
    floorController = TextEditingController();
    roomController = TextEditingController();
    landmarkController = TextEditingController();
  }

  void loadData() {
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
    destinationTown.value = destinations.value.destinations.first.town;
    destinationArea.value = destinations.value.destinations.first.area;
    cartItems.value = [
      CartItem(
        photoUrl: Strings.milkUrl,
        name: 'Fresh Milk',
        stockTag: StockTags.inStock,
        price: 56.98,
        quantity: 2,
      ),
      CartItem(
        photoUrl: Strings.milkUrl,
        name: 'Fresh Milk',
        stockTag: StockTags.inStock,
        price: 56.98,
        quantity: 2,
      ),
      CartItem(
        photoUrl: Strings.milkUrl,
        name: 'Fresh Milk',
        stockTag: StockTags.inStock,
        price: 56.98,
        quantity: 2,
      ),
    ];
    shippingStatus.value = ShippingStatus.none;
  }

  String getTown(String destination) => destination.split(',').first;
  String getArea(String destination) => destination.split(',').last;
  String getDestination(String town, String area) {
    var destinationValue = '';
    if (area.isEmpty) {
      destinationValue = town;
    } else {
      destinationValue = '$town, $area';
    }
    return destinationValue;
  }

  double subTotal() {
    var sum = 0.0;
    for (var item in cartItems.value) {
      sum += item.price;
    }
    return sum;
  }

  double shippingFee() {
    return subTotal() * 0.2;
  }

  double total() {
    return subTotal() + shippingFee();
  }

  void checkout() {
    ShippingModel shippingModel = ShippingModel(
      phoneNumber: '+254785142970',
      items: cartItems.value,
      orderNo: 1,
      status: ShippingStatus.none,
      destination: DestinationModel(
        town: destinationTown.value,
        area: destinationArea.value,
        building: buildingController.text,
        floorNo: buildingController.text,
        roomNo: buildingController.text,
        landmark: buildingController.text,
      ),
    );

    //ignore: todo
    //TODO: Get phone number from firebase , verify inputs, then Post to firebase
  }

  void deleteItem() {
    //ignore: todo
    //TODO FUnctionality
  }

  void incrementQty() {
    //ignore: todo
    //TODO FUnctionality
  }

  void decrementQty() {
    //ignore: todo
    //TODO FUnctionality
  }
}
