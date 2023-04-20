import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ruler/ruler.dart';

import 'build_docs.dart';
import 'demos/documentations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: false,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void reassemble() {
    super.reassemble();
    buildDocumentations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ruler")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [],
      ),
    );
  }

  Future<void> buildDocumentations() async {
    final buffer = StringBuffer();

    for (final doc in getDocumentations(context)) {
      buffer.writeln(await buildMarkdown(doc));
    }

    final mainDir = Directory.current.path;
    final imagesDir = "$mainDir/docs";
    final file =
        await File("$imagesDir/README.md").writeAsString(buffer.toString());
    debugPrint(file.path);
  }
}
