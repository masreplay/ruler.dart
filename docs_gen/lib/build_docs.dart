import 'dart:io';

import 'package:flutter/material.dart';

import 'documentation.dart';
import 'generate_image.dart';
import 'main.dart';

class ImageData {
  final String name;
  final String path;

  const ImageData({required this.name, required this.path});

  String get code => "![$name]($path)";
  String get htmlImage => "<img src=\"$path\" alt=\"$name\" />";
}

Future<String> buildMarkdown(Documentation doc) async {
  return doc.map(
    text: (value) {
      return value.toMarkdown();
    },
    assetsImage: (value) {
      return "";
      // return "![${value.text}](${value.path})";
    },
    widget: (value) async {
      final image = await buildWidgetDocs(value);
      final buffer = StringBuffer();
      buffer.writeln(TextSize.heading4.build(value.description));
      buffer.writeln(image.htmlImage);
      // code
      buffer.writeln("```dart");
      buffer.writeln(value.code);
      buffer.writeln("```");

      return buffer.toString();
    },
    widgetsTable: (value) async {
      final buffer = StringBuffer();
      buffer.writeln("<table>");
      buffer.writeln("<tr>");
      for (var element in ["Image", "Code", "description"]) {
        buffer.writeln("<td> $element </td>");
      }
      buffer.writeln("</tr>");
      for (var element in value.widgets) {
        buffer.writeln("<tr>");
        final imageData = await buildWidgetDocs(element);
        buffer.writeln("<td> ${imageData.htmlImage} </td>");
        buffer.writeln("""<td> \n\n```dart\n${element.code}\n```\n</td>""");
        buffer.writeln("<td> ${element.description}</td>");
        buffer.writeln("</tr>");
      }
      buffer.writeln("</table>");

      return buffer.toString();
    },
    textTable: (DocumentationTextTable value) {
      return "";
    },
  );
}

Future<ImageData> buildWidgetDocs(DocumentationWidget value) async {
  final size = value.renderSize;
  final image = await generateImage(
    widget: Directionality(
      textDirection: TextDirection.ltr,
      child: Theme(
        data: ThemeData(
          brightness: Brightness.light,
          dividerColor: Colors.black,
          useMaterial3: false,
        ),
        child: Center(
          child: Container(
            width: size.width,
            height: size.height,
            color: Colors.transparent,
            alignment: Alignment.center,
            child: value.widget,
          ),
        ),
      ),
    ),
    size: size,
  );

  final filename = value.name.replaceAll(" ", "_").toLowerCase();

  final filepath = "/images/$filename.png";
  await File("$mainDir$filepath").writeAsBytes(image!);

  return ImageData(name: value.description, path: filepath);
}
