import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 20.01.2023.
class ListItemSearchResult extends StatelessWidget {
  final void Function(CuisineItem) onTap;
  final List<CuisineItem> cuisineItems;
  const ListItemSearchResult(
      {super.key, required this.cuisineItems, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        spacing: 16,
        runAlignment: WrapAlignment.center,
        children: _children(),
      ),
    );
  }

  Widget _cardView(CuisineItem cuisineItem) {
    return Container(
      height: 125,
      width: 180,
      margin: const EdgeInsets.only(
        bottom: 16,
      ),
      alignment: AlignmentDirectional.centerStart,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          gradient: ThemeService(isDarkMode: Get.isDarkMode).stroke,
          boxShadow: !Get.isDarkMode
              ? []
              : [
                  BoxShadow(
                    color: Get.theme.primaryColorDark.withOpacity(0.30),
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: const Offset(0, 4), // changes position of shadow
                  ),
                ]),
      child: InkWell(
        onTap: () => onTap(cuisineItem),
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 4),
              child: Text(
                cuisineItem.name,
                softWrap: true,
                style: Get.textTheme.bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(16)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    cuisineItem.photoUrl,
                  ),
                ),
                shape: BoxShape.rectangle,
              ),
              height: 180,
              width: 80,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _children() {
    List<Widget> children = [];
    for (var item in cuisineItems) {
      children.add(_cardView(item));
    }
    return children;
  }
}
