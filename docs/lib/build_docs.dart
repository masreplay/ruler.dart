import 'dart:io';

import 'package:flutter/material.dart';

import 'documentation.dart';
import 'generate_image.dart';

class ImageData {
  final String name;
  final String path;

  const ImageData({required this.name, required this.path});

  String get image => "![$name]($path)";
  String get htmlImage => "<img src=\"$path\" alt=\"$name\" />";
}

Future<String> buildMarkdown(Documentation doc) async {
  return doc.map(
    text: (value) {
      return value.text;
    },
    assetsImage: (value) {
      return "";
      // return "![${value.text}](${value.path})";
    },
    widget: (value) async {
      return (await buildWidgetDocs(value)).image;
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
  );
}

Future<ImageData> buildWidgetDocs(DocumentationWidget value) async {
  const size = Size(100, 100);
  final image = await generateImage(
    widget: Directionality(
      textDirection: TextDirection.ltr,
      child: Theme(
        data: ThemeData(
          brightness: Brightness.light,
          dividerColor: Colors.black,
          useMaterial3: false,
        ),
        child: Container(
          width: size.width,
          height: size.height,
          color: Colors.white,
          child: value.widget,
        ),
      ),
    ),
    size: size,
  );

  final filename = value.description.replaceAll(" ", "_").toLowerCase();
  final dir = Directory.current.path;
  await File("$dir/docs/$filename.png").writeAsBytes(image!);

  return ImageData(name: value.description, path: "/docs/$filename.png");
}
