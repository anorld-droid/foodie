/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 23.01.2023.

class DestinationModel {
  final String town;
  final String area;
  final String? building;
  final String? floorNo;
  final String? roomNo;
  final String? landmark;

  const DestinationModel({
    this.building,
    this.floorNo,
    this.roomNo,
    this.landmark,
    required this.town,
    required this.area,
  });
}

class Destinations {
  final List<DestinationModel> destinations;

  const Destinations({required this.destinations});
}
