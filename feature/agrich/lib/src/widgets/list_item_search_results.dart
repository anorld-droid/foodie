import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

class ListItemSearchResult extends StatelessWidget {
  final void Function() onTap;
  final CuisineModel cuisineModel;
  const ListItemSearchResult(
      {super.key, required this.cuisineModel, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          cuisineModel.cuisineItems.length,
          (index) => _cardView(
            cuisineModel.cuisineItems[index],
          ),
        ),
      ),
    );
  }

  Widget _cardView(CuisineItem cuisineItem) {
    return SizedBox(
      height: 100,
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: AlignmentDirectional.centerStart,
          margin: const EdgeInsets.only(right: 16, top: 16, bottom: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              gradient: ThemeService(isDarkMode: Get.isDarkMode).stroke,
              boxShadow: [
                BoxShadow(
                  color: Get.theme.primaryColorDark.withOpacity(0.30),
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: const Offset(0, 4), // changes position of shadow
                ),
              ]),
          child: Row(
            children: [
              Flexible(
                flex: 2,
                child: Text(cuisineItem.name),
              ),
              Flexible(
                child: CircleAvatar(
                  radius: 64,
                  backgroundImage: NetworkImage(
                    cuisineItem.photoUrl,
                  ),
                  backgroundColor: Get.theme.primaryColorDark.withOpacity(.12),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
