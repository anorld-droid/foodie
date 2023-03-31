import 'dart:ui';

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
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: Container(
                width: 160,
                height: 220,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Get.theme.colorScheme.onBackground.withOpacity(0.4),
                      Get.theme.colorScheme.onBackground.withOpacity(0.2),
                    ],
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                  ),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(6)),
                  border: Border.all(
                    width: 1.5,
                    color: Get.theme.colorScheme.onBackground.withOpacity(0.2),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 12,
          right: 0,
          child: Container(
              decoration: BoxDecoration(
                  color: Get.theme.colorScheme.onBackground,
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
  bool shouldReclip(CustomClipper<dynamic> oldClipper) {
    return oldClipper != this;
  }
}

// ClipRect(
//               child: new BackdropFilter(
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
//               ),)