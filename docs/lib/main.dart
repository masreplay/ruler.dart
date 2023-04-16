import 'dart:io';

import 'package:docs/dir.dart';
import 'package:docs/generate_image.dart';
import 'package:flutter/material.dart';
import 'package:ruler/ruler.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Notch(10.mm),
            Column(),
            TextButton(
              onPressed: () async {
                final image = await generateImage(
                  widget: Directionality(
                    textDirection: TextDirection.ltr,
                    child: Notch(10.mm),
                  ),
                  size: const Size(100, 100),
                );
                const filename = "test.png";
                File("$dir/docs/$filename").writeAsBytes(image!);
              },
              child: const Text("Print"),
            )
          ],
        ),
      ),
    );
  }
}
