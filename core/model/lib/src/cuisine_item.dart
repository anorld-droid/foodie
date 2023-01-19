/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 19.01.2023.

abstract class NamedEnum extends Enum {
  String get name;
}

enum Tags implements NamedEnum {
  basic,
  diamond,
  platinum,
  gold;

  @override
  String get name {
    switch (this) {
      case Tags.basic:
        return 'Basic';
      case Tags.diamond:
        return 'Diamond';
      case Tags.platinum:
        return 'Platinum';
      case Tags.gold:
        return 'Gold';
    }
  }
}

class CuisineItem {
  final String name;
  final Tags tag;
  final double price;
  final String detail;
  final List<String> ingridients;
  final String photoUrl;

  CuisineItem(
      {required this.name,
      required this.tag,
      required this.price,
      required this.detail,
      required this.ingridients,
      required this.photoUrl});
}
