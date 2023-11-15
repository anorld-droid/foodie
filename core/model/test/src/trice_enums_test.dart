import 'package:flutter_test/flutter_test.dart';
import 'package:model/src/trice_enums.dart';

void main() {
  test('enum values of [StockTag] should be correct', () {
    //Arrange
    NamedEnum inStock = StockTags.inStock;
    NamedEnum outStock = StockTags.outStock;

    //Assert
    expect(inStock, StockTags.inStock);
    expect(outStock, StockTags.outStock);

    //Check for equality
    expect(inStock == StockTags.inStock, true);
    expect(outStock == StockTags.outStock, true);
  });
  test('enum values of [Chips] should be correct', () {
    //Arrange
    NamedEnum dairy = Chips.dairy;
    NamedEnum beverage = Chips.beverage;
    NamedEnum fruits = Chips.fruits;
    NamedEnum vegetables = Chips.vegetables;
    NamedEnum meat = Chips.meat;
    NamedEnum grocery = Chips.grocery;
    NamedEnum legumes = Chips.legumes;
    NamedEnum grains = Chips.grains;
    NamedEnum combo = Chips.combo;
    NamedEnum reset = Chips.reset;

    //Assert
    expect(dairy, Chips.dairy);
    expect(beverage, Chips.beverage);
    expect(fruits, Chips.fruits);
    expect(vegetables, Chips.vegetables);
    expect(meat, Chips.meat);
    expect(grocery, Chips.grocery);
    expect(legumes, Chips.legumes);
    expect(grains, Chips.grains);
    expect(combo, Chips.combo);
    expect(reset, Chips.reset);

    //Check for equality
    expect(dairy == Chips.dairy, true);
    expect(beverage == Chips.beverage, true);
    expect(fruits == Chips.fruits, true);
    expect(vegetables == Chips.vegetables, true);
    expect(meat == Chips.meat, true);
    expect(grocery == Chips.grocery, true);
    expect(legumes == Chips.legumes, true);
    expect(grains == Chips.grains, true);
    expect(combo == Chips.combo, true);
    expect(reset == Chips.reset, true);
  });
}
