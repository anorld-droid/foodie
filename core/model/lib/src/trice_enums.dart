/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 23.01.2023.

abstract class NamedEnum extends Enum {
  String get name;
}

enum StockTags implements NamedEnum {
  inStock,
  outStock;

  @override
  String get name {
    switch (this) {
      case StockTags.inStock:
        return 'In stock';
      case StockTags.outStock:
        return 'Out stock';
    }
  }
}

enum Chips implements NamedEnum {
  dairy,
  beverage,
  fruits,
  vegetables,
  meat,
  grocery,
  legumes,
  grains,
  combo,
  reset;

  @override
  String get name {
    switch (this) {
      case Chips.dairy:
        return 'Dairy';
      case Chips.beverage:
        return 'Beverage';
      case Chips.fruits:
        return 'Fruits';
      case Chips.vegetables:
        return 'Vegetables';
      case Chips.meat:
        return 'Meat';
      case Chips.grocery:
        return 'Grocery';
      case Chips.legumes:
        return 'Legumes';
      case Chips.grains:
        return 'Grains';
      case Chips.combo:
        return 'Combo';
      case Chips.reset:
        return '#Reset';
    }
  }
}

enum ShippingStatus implements NamedEnum {
  none,
  received,
  packed,
  transit,
  delivered;

  @override
  String get name {
    switch (this) {
      case ShippingStatus.received:
        return 'Your order have been received.';
      case ShippingStatus.packed:
        return 'Your items have been packed, ready for transit.';
      case ShippingStatus.transit:
        return 'Your items are in transit, expect delivery soon.';
      case ShippingStatus.delivered:
        return 'Your order has been delivered, thank you for choosing Cuisine 2.0 .';
      case ShippingStatus.none:
        return 'No order, yet!.';
    }
  }
}
