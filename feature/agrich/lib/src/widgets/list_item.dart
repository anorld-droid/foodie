// BackdropFilter(
//                 filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
//                 child: new Container(
//                   width: 200.0,
//                   height: 200.0,
//                   decoration: new BoxDecoration(
//                     color: Colors.grey.shade200.withOpacity(0.5)
//                   ),
//                   child: new Center(
//                     child: new Text(
//                       'Frosted',
//                       style: Theme.of(context).textTheme.display3
//                     ),
//                   ),
//                 ),

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlassRectangle extends StatelessWidget {
  const GlassRectangle({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: RightConcaveClipper(),
          child: Container(
            width: 160,
            height: 220,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(6)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 5,
                  spreadRadius: 1,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 12,
          right: 0,
          child: Container(
              decoration: BoxDecoration(
                  color: Get.theme.primaryColor,
                  borderRadius: BorderRadius.circular(30)),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_basket_outlined,
                  color: Get.theme.colorScheme.background,
                ),
                color: Get.theme.primaryColor,
              )),
        ),
      ],
    );
  }
}

class RightConcaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..cubicTo(size.width, size.height - 8, size.width, size.height - 8,
          size.width - 30, size.height - 8)
      ..cubicTo(size.width - 65, size.height - 8, size.width - 65,
          size.height - 65, size.width - 30, size.height - 65)
      ..cubicTo(size.width, size.height - 65, size.width, size.height - 80,
          size.width, size.height - 80)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0);
  }

  @override
  bool shouldReclip(CustomClipper old) {
    return old != this;
  }
}
