import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trice/model/news/news_post.dart';

class ParagraphCard extends StatelessWidget {
  final Paragraph paragraph;
  const ParagraphCard({Key? key, required this.paragraph}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ParagraphStyling styling = paragraph.type.getTextAndParagraphStyle();
    return Column(
      children: const [],
    );
  }
}

extension on ParagraphType {
  ParagraphStyling getTextAndParagraphStyle() {
    TextStyle textStyle = Get.textTheme.bodyMedium ?? TextStyle();
    ParagraphStyle paragraphStyle = ParagraphStyle(textIndent: 10);
    var trailingPadding = 24;
    switch (this) {
      case ParagraphType.caption:
        textStyle = Get.textTheme.labelMedium!;
        break;
      case ParagraphType.title:
        textStyle = Get.textTheme.headlineLarge!;
        break;
      case ParagraphType.subHead:
        textStyle = Get.textTheme.headlineSmall!;
        trailingPadding = 16;
        break;
      case ParagraphType.text:
        textStyle = Get.textTheme.bodyLarge!.copyWith(height: 28);
        break;
      case ParagraphType.header:
        textStyle = Get.textTheme.headlineMedium!;
        trailingPadding = 16;
        break;

      case ParagraphType.codeBlock:
        textStyle = Get.textTheme.displayMedium!;
        break;
      case ParagraphType.quote:
        textStyle = Get.textTheme.bodyLarge!;
        break;
      case ParagraphType.bullet:
        paragraphStyle = ParagraphStyle(textIndent: 8);
        break;
      default:
    }

    return ParagraphStyling(
      textStyle: textStyle,
      paragraphStyle: paragraphStyle,
      trailingPadding: trailingPadding,
    );
  }
}
