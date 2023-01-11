import 'package:flutter/material.dart';

class NewsPostModel {
  final String id;
  final String title;
  final String? subtitle;
  final String url;
  final Publication? publication;
  final Metadata metadata;
  final List<Paragraph> paragraphs;
  final String imageId;
  final String imageThumbId;
  final List<Comment> comments;

  NewsPostModel(
      {required this.comments,
      required this.id,
      required this.title,
      required this.subtitle,
      required this.url,
      this.publication,
      required this.metadata,
      required this.paragraphs,
      required this.imageId,
      required this.imageThumbId});

  NewsPostModel copyWith(
          {String? id,
          String? title,
          String? subtitle,
          String? url,
          Publication? publication,
          Metadata? metadata,
          List<Paragraph>? paragraphs,
          String? imageId,
          String? imageThumbId,
          List<Comment>? comments}) =>
      NewsPostModel(
          id: id ?? this.id,
          title: title ?? this.title,
          subtitle: subtitle ?? this.subtitle,
          url: url ?? this.url,
          metadata: metadata ?? this.metadata,
          paragraphs: paragraphs ?? this.paragraphs,
          imageId: imageId ?? this.imageId,
          imageThumbId: imageThumbId ?? this.imageThumbId,
          comments: comments ?? this.comments);
}

class Metadata {
  final PostAuthor author;
  final String date;
  final int readTimeMinutes;

  Metadata(
    this.author,
    this.date,
    this.readTimeMinutes,
  );
}

class PostAuthor {
  final String name;
  final String? profilePhoto;

  PostAuthor(
    this.name,
    this.profilePhoto,
  );
}

class Publication {
  final String name;
  final String logoUrl;

  Publication(
    this.name,
    this.logoUrl,
  );
}

class Paragraph {
  final ParagraphType type;
  final String text;
  final List<Markup> markups;

  Paragraph(
    this.type,
    this.text,
    this.markups,
  );
}

class Comment {
  final String text;
  final String? imageUrl;
  final Metadata metadata;

  Comment({required this.metadata, required this.text, this.imageUrl});
}

class Markup {
  final MarkupType type;
  final String text;
  String? href;

  Markup(
    this.type,
    this.text,
    this.href,
  );
}

enum MarkupType { link, code, italic, bold, text }

enum ParagraphType {
  title,
  caption,
  header,
  subHead,
  text,
  codeBlock,
  quote,
  bullet,
}

class ParagraphStyling {
  final TextStyle textStyle;
  final ParagraphStyle paragraphStyle;
  final double trailingPadding;

  ParagraphStyling({
    required this.textStyle,
    required this.paragraphStyle,
    required this.trailingPadding,
  });
}

class ParagraphStyle {
  final double textIndent;

  ParagraphStyle({
    required this.textIndent,
  });
}

class RichTextString {
  final String text;
  final List<TextSpan> textSpans;

  RichTextString({required this.text, required this.textSpans});
}
