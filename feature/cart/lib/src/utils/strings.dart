import 'package:model/model.dart';

enum KisumuDestinations implements NamedEnum {
  milimani,
  nyalendaA,
  nyalendaB,
  cbd,
  manyattaB,
  obunga,
  kondele;

  @override
  String get name {
    switch (this) {
      case KisumuDestinations.milimani:
        return 'Milimani';
      case KisumuDestinations.nyalendaA:
        return 'Nyalenda A';
      case KisumuDestinations.nyalendaB:
        return 'Nyalenda B';
      case KisumuDestinations.cbd:
        return 'CBD';
      case KisumuDestinations.manyattaB:
        return 'ManyattaB';
      case KisumuDestinations.obunga:
        return 'Obunga';
      case KisumuDestinations.kondele:
        return 'Kondele';
    }
  }
}

class Strings {
  static String deliveryTo = 'Delivery to';
  static String milkUrl =
      'https://media.istockphoto.com/id/1081054172/photo/milk-bottle-and-glass-isolated-on-white-background.jpg?b=1&s=170667a&w=0&k=20&c=K_kHYGZgxzllfSk9kokaQZ6Tc8xE_Nu0s0Tv33sx6Bk=';
}
