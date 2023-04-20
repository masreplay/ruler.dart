import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'documentation.freezed.dart';

@freezed
class Documentation with _$Documentation {
  const Documentation._();

  const factory Documentation.text(
    String text, {
    @Default(TextType.normal) TextType type,
    @Default(TextSize.paragraph) TextSize size,
  }) = DocumentationText;

  const factory Documentation.assetsImage({
    required String text,
    required String path,
  }) = DocumentationAssetsImage;

  const factory Documentation.widget({
    required String name,
    required String description,
    required Widget widget,
    required String code,
  }) = DocumentationWidget;

  const factory Documentation.textTable({
    required List<DocumentationText> cells,
    required List<DocumentationText> columns,
    required List<DocumentationText> rows,
  }) = DocumentationTextTable;

  const factory Documentation.widgetsTable({
    required List<DocumentationWidget> widgets,
  }) = DocumentationWidgetsTable;
}

enum TextType {
  normal,
  bold,
  italic,
  boldItalic;

  String build(String text) {
    switch (this) {
      case TextType.normal:
        return text;
      case TextType.bold:
        return "**$text**";
      case TextType.italic:
        return "*$text*";
      case TextType.boldItalic:
        return "***$text***";
    }
  }
}

enum TextSize {
  heading1,
  heading2,
  heading3,
  heading4,
  heading5,
  heading6,
  paragraph;

  String build(String text) {
    switch (this) {
      case TextSize.heading1:
        return "# $text";
      case TextSize.heading2:
        return "## $text";
      case TextSize.heading3:
        return "### $text";
      case TextSize.heading4:
        return "#### $text";
      case TextSize.heading5:
        return "##### $text";
      case TextSize.heading6:
        return "###### $text";
      case TextSize.paragraph:
        return text;
    }
  }
}

extension DocumentationTextX on DocumentationText {
  String toMarkdown() {
    return size.build(type.build(text));
  }
}
