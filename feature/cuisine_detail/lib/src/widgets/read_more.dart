import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReadMoreText extends StatefulWidget {
  final String text;
  final int maxLines;

  const ReadMoreText({super.key, required this.text, this.maxLines = 3});

  @override
  State<ReadMoreText> createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final textSpan = TextSpan(
          text: widget.text,
          style: TextStyle(fontSize: 16),
        );

        final textPainter = TextPainter(
          text: textSpan,
          maxLines: widget.maxLines,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: constraints.maxWidth);

        final tapGestureRecognizer = TapGestureRecognizer()
          ..onTap = () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          };

        final textWidget = RichText(
          text: textSpan,
          maxLines: _isExpanded ? double.maxFinite.toInt() : widget.maxLines,
          overflow: TextOverflow.ellipsis,
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.justify,
          softWrap: true,
        );

        if (textPainter.didExceedMaxLines) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textWidget,
              GestureDetector(
                child: Text(
                  _isExpanded ? 'Read less' : '... Read more',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
              ),
            ],
          );
        }

        return textWidget;
      },
    );
  }
}
