import 'package:cuisine_detail/src/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

class SearchLayout extends StatefulWidget {
  final List<Restaurant> restaurants;
  const SearchLayout(this.restaurants, {super.key});

  @override
  State createState() => SearchLayoutState();
}

class SearchLayoutState extends State<SearchLayout> {
  final detailController = Get.find<Controller>();
  TextEditingController controller = TextEditingController();
  final _focusNode = FocusNode();

  String? filter;

  @override
  void initState() {
    super.initState();
    //fill countries with objects
    controller.addListener(() {
      setState(() {
        filter = controller.text;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: Get.width * 0.85,
        height: Get.height * 0.45,
        decoration: BoxDecoration(
            color: Get.theme.colorScheme.background,
            borderRadius: BorderRadius.circular(12.0)),
        child: Material(
            color: Get.theme.colorScheme.primaryContainer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, left: 16.0, right: 16.0),
                    child: TextField(
                      style: Get.textTheme.bodySmall?.copyWith(),
                      focusNode: _focusNode,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: _focusNode.hasFocus
                              ? Get.theme.colorScheme.primary
                              : Get.theme.colorScheme.onBackground,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.close,
                            color: _focusNode.hasFocus
                                ? Get.theme.colorScheme.primary
                                : Get.theme.colorScheme.onBackground,
                          ),
                          onPressed: () {
                            controller.clear();
                            FocusScope.of(context).requestFocus(FocusNode());
                          },
                        ),
                        hintText: "Search...",
                      ),
                      controller: controller,
                    )),
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: _buildListView()),
                )
              ],
            )),
      ),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
        itemCount: widget.restaurants.length,
        itemBuilder: (BuildContext context, int index) {
          if (filter == null || filter == "") {
            return _buildRow(widget.restaurants[index]);
          } else {
            if (widget.restaurants[index].name
                    .toLowerCase()
                    .contains(filter!.toLowerCase()) ||
                widget.restaurants[index].locationName
                    .toLowerCase()
                    .contains(filter!.toLowerCase())) {
              return _buildRow(widget.restaurants[index]);
            } else {
              return Container();
            }
          }
        });
  }

  Widget _buildRow(Restaurant restaurant) {
    return InkWell(
      onTap: () {
        detailController.changeStore(restaurant.name);
        Get.back();
      },
      child: ListTile(
          title: Text(
            restaurant.name,
            style: Get.textTheme.bodyMedium,
          ),
          subtitle: Text(
            restaurant.locationName,
            style: Get.textTheme.bodySmall,
          )),
    );
  }
}
