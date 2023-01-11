class ApartmentAdModel {
  final List<String> imagesUrl;
  final String name;
  final String location;
  final String priceRange;
  final int unOccupied;
  final int contact;
  ApartmentAdModel(
      {required this.unOccupied,
      required this.priceRange,
      required this.imagesUrl,
      required this.name,
      this.contact = 757913481,
      required this.location});
}
