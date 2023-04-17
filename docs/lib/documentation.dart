import 'dart:io';

import 'package:docs/generate_image.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'documentation.freezed.dart';

@freezed
class Documentation with _$Documentation {
  const Documentation._();

  const factory Documentation.text(String text) = DocumentationText;

  const factory Documentation.assetsImage({
    required String text,
    required String path,
  }) = DocumentationAssetsImage;

  const factory Documentation.widget({
    required String text,
    required Widget widget,
    required String code,
  }) = DocumentationWidget;

  const factory Documentation.widgetsTable({
    required List<DocumentationWidget> widgets,
  }) = DocumentationWidgetsTable;

  Future<String> buildMarkdown() async {
    return map(
      text: (value) {
        return value.text;
      },
      assetsImage: (value) {
        return "![${value.text}](${value.path})";
      },
      widget: (value) {
        return value.toMarkdown(const Size(200, 200));
      },
      widgetsTable: (value) {
        return "";
      },
    );
  }
}

extension on DocumentationWidget {
  Future<String> toMarkdown(Size size) async {
    final image = await generateImage(
      widget: Directionality(textDirection: TextDirection.ltr, child: widget),
      size: size,
    );
    // parse text for filename
    final filename = text.replaceAll(RegExp(r"\W+"), "_");
    final dir = Directory.current.path;
    await File("$dir/docs/$filename.png").writeAsBytes(image!);

    return "![$text](/docs/$filename.png)";
  }
}
