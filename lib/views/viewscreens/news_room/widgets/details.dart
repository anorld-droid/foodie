import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trice/controller/news_details_controller.dart';
import 'package:trice/model/news/news_post.dart';

class DetailsTopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? profilePhoto;
  const DetailsTopBar(
      {Key? key, required this.title, required this.profilePhoto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: Row(
        children: [
          SizedBox(
            height: 32,
            width: 32,
            child: IconButton(
              onPressed: () => Get.back(),
              padding: const EdgeInsets.only(left: 8),
              icon: Icon(
                Icons.arrow_back_outlined,
                color: Get.theme.primaryColorDark,
                size: 24,
              ),
              iconSize: 24,
            ),
          ),
          const SizedBox(width: 8),
          profilePhoto == null
              ? Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Get.theme.primaryColorDark.withOpacity(.15),
                      borderRadius: BorderRadius.circular(100)),
                  alignment: AlignmentDirectional.centerStart,
                  padding: const EdgeInsets.only(left: 8),
                )
              : CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(profilePhoto!),
                ),
        ],
      ),
      leadingWidth: 88,
      title: Text(title, style: Get.textTheme.displaySmall),
      backgroundColor: Get.theme.backgroundColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class ParagraphCard extends StatelessWidget {
  final Paragraph paragraph;
  const ParagraphCard({Key? key, required this.paragraph}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return paragraphLayout(paragraph);
  }
}

Widget paragraphLayout(Paragraph paragraph) {
  ParagraphStyling styling = paragraph.type.getTextAndParagraphStyle();
  RichTextString richTextString = paragraphToTextSpan(paragraph);
  Widget child;
  switch (paragraph.type) {
    case ParagraphType.bullet:
      child = BulletParagraph(
          richTextString: richTextString,
          paragraphindent: styling.paragraphStyle.textIndent,
          paragraphStyle: styling.textStyle);
      break;
    case ParagraphType.codeBlock:
      child = CodeBlockParagraph(
          richTextString: richTextString,
          paragraphindent: styling.paragraphStyle.textIndent,
          paragraphStyle: styling.textStyle);
      break;
    case ParagraphType.header:
      child = HeaderParagraph(
          richTextString: richTextString,
          paragraphindent: styling.paragraphStyle.textIndent,
          paragraphStyle: styling.textStyle);
      break;

    default:
      child = Container(
        alignment: AlignmentDirectional.centerStart,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: richTextString.textSpans.isNotEmpty
            ? RichText(
                text: TextSpan(
                    text: richTextString.text,
                    style: styling.textStyle,
                    children: richTextString.textSpans))
            : RichText(
                text: TextSpan(
                  text: richTextString.text,
                  style: styling.textStyle,
                ),
              ),
      );
  }
  return Column(
    children: [
      child,
      SizedBox(
        height: styling.trailingPadding,
      )
    ],
  );
}

extension on ParagraphType {
  ParagraphStyling getTextAndParagraphStyle() {
    TextStyle textStyle = Get.textTheme.bodyLarge!;
    ParagraphStyle paragraphStyle = ParagraphStyle(textIndent: 10);
    double trailingPadding = 16;
    switch (this) {
      case ParagraphType.caption:
        textStyle = Get.textTheme.labelMedium!;
        break;
      case ParagraphType.title:
        textStyle = Get.textTheme.headlineLarge!;
        break;
      case ParagraphType.subHead:
        textStyle = Get.textTheme.headlineSmall!;
        trailingPadding = 12;
        break;
      case ParagraphType.text:
        textStyle = Get.textTheme.bodyLarge!;
        break;
      case ParagraphType.header:
        textStyle = Get.textTheme.headlineMedium!;
        trailingPadding = 12;
        break;
      case ParagraphType.codeBlock:
        textStyle = Get.textTheme.displayMedium!;
        break;
      case ParagraphType.quote:
        textStyle =
            Get.textTheme.bodyLarge!.copyWith(fontStyle: FontStyle.italic);
        break;
      default:
        paragraphStyle = ParagraphStyle(textIndent: 8);
    }

    return ParagraphStyling(
      textStyle: textStyle,
      paragraphStyle: paragraphStyle,
      trailingPadding: trailingPadding,
    );
  }
}

extension on Markup {
  TextSpan toTextSpan() {
    NewsDetailController newsDetailController = Get.find();

    TextSpan textSpan = TextSpan();
    switch (type) {
      case MarkupType.bold:
        textSpan = TextSpan(
            text: text,
            style: Get.textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ));
        break;
      case MarkupType.italic:
        textSpan = TextSpan(
            text: text,
            style:
                Get.textTheme.bodyLarge!.copyWith(fontStyle: FontStyle.italic));
        break;
      case MarkupType.code:
        textSpan = TextSpan(
            text: text,
            style: Get.textTheme.displayMedium!.copyWith(
                backgroundColor: Get.theme.primaryColorDark.withOpacity(.15)));
        break;
      case MarkupType.link:
        textSpan = TextSpan(
            text: text,
            style: Get.textTheme.bodyLarge!
                .copyWith(decoration: TextDecoration.underline),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                newsDetailController.launchURL(href);
              });
        break;
      default:
        textSpan = TextSpan(text: text, style: Get.textTheme.bodyLarge!);
    }
    return textSpan;
  }
}

RichTextString paragraphToTextSpan(Paragraph paragraph) {
  List<TextSpan> textSpans = paragraph.markups.isNotEmpty
      ? paragraph.markups
          .map<TextSpan>((e) => e.toTextSpan())
          .toList(growable: false)
      : [];
  return RichTextString(text: paragraph.text, textSpans: textSpans);
}

class CodeBlockParagraph extends StatelessWidget {
  final RichTextString richTextString;
  final double paragraphindent;
  final TextStyle paragraphStyle;
  const CodeBlockParagraph(
      {Key? key,
      required this.richTextString,
      required this.paragraphindent,
      required this.paragraphStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width - 70,
      padding: EdgeInsets.only(left: paragraphindent),
      decoration: BoxDecoration(
          color: Get.theme.primaryColorDark.withOpacity(.15),
          borderRadius: BorderRadius.circular(4)),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: richTextString.textSpans.isNotEmpty
            ? RichText(
                text: TextSpan(
                    text: richTextString.text,
                    style: paragraphStyle,
                    children: richTextString.textSpans))
            : RichText(
                text: TextSpan(
                  text: richTextString.text,
                  style: paragraphStyle,
                ),
              ),
      ),
    );
  }
}

class BulletParagraph extends StatelessWidget {
  final RichTextString richTextString;
  final double paragraphindent;
  final TextStyle paragraphStyle;
  const BulletParagraph(
      {Key? key,
      required this.richTextString,
      required this.paragraphindent,
      required this.paragraphStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: paragraphindent),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              const SizedBox(
                height: 4,
              ),
              Container(
                  // alignment: AlignmentDirectional.topStart,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                  ),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Get.theme.primaryColorDark,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const SizedBox(
                    width: 8,
                    height: 8,
                  )),
            ],
          ),
          richTextString.textSpans.isNotEmpty
              ? Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                    ),
                    child: RichText(
                        text: TextSpan(
                            text: richTextString.text,
                            style: paragraphStyle,
                            children: richTextString.textSpans)),
                  ),
                )
              : Expanded(
                  child: Container(
                    alignment: AlignmentDirectional.topStart,
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      richTextString.text,
                      style: paragraphStyle,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

class HeaderParagraph extends StatelessWidget {
  final RichTextString richTextString;
  final double paragraphindent;
  final TextStyle paragraphStyle;
  const HeaderParagraph(
      {Key? key,
      required this.richTextString,
      required this.paragraphindent,
      required this.paragraphStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: paragraphindent),
      child: Container(
        padding: const EdgeInsets.all(4),
        child: richTextString.textSpans.isNotEmpty
            ? RichText(
                text: TextSpan(
                    text: richTextString.text,
                    style: paragraphStyle,
                    children: richTextString.textSpans))
            : RichText(
                text: TextSpan(
                  text: richTextString.text,
                  style: paragraphStyle,
                ),
              ),
      ),
    );
  }
}
