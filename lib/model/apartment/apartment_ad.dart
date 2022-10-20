class ApartmentAdModel {
  final List<String> imagesUrl;
  final String name;
  final String location;
  final String priceRange;
  final int unOccupied;
  ApartmentAdModel(
      {required this.unOccupied,
      required this.priceRange,
      required this.imagesUrl,
      required this.name,
      required this.location});
}
