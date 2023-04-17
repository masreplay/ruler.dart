import 'dart:io';

import 'package:flutter/material.dart';

import 'documentations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ruler"),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () async {
              final buffer = StringBuffer();
              for (final doc in documentations) {
                buffer.writeln(await doc.buildMarkdown());
              }
              final file = await File("${getDocsDir()}/docs/README.md")
                  .writeAsString(buffer.toString());
              debugPrint(file.path);
            },
            child: const Text("Print"),
          )
        ],
      ),
    );
  }

  String getDocsDir() {
    return Directory.current.path;
  }
}
