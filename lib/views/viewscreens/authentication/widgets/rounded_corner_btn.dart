import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class IconBtn extends StatelessWidget {
  final name;
  final icon;
  const IconBtn({Key? key, required this.name, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          width: 10,
        ),
        Container(
          width: Get.width - 220,
          alignment: Alignment.center,
          padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 10),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              border: Border(
                  top: BorderSide(
                    color: Colors.black,
                  ),
                  bottom: BorderSide(
                    color: Colors.black,
                  ),
                  right: BorderSide(
                    color: Colors.black,
                  ),
                  left: BorderSide(
                    color: Colors.black,
                  ))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                name,
                style: GoogleFonts.inter(
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600),
              ),
              Icon(
                icon,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
