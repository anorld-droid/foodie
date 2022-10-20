import 'package:trice/model/news/news_post.dart';

class ApartmentModel {
  final String name;
  final PostAuthor careTaker;
  final String rent;
  final String balance;
  final String due;

  ApartmentModel(
      {required this.rent,
      required this.balance,
      required this.due,
      required this.name,
      required this.careTaker});
}
