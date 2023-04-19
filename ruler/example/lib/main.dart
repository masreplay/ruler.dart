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
        brightness: Brightness.dark,
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
      appBar: AppBar(title: const Text("Ruler")),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Ruler.dynamic((MediaQuery.of(context).size.width + 1).inch(10)),
          Notch((9.01 / 10).inch(10)),
          // Ruler.count(3.cm, notchScaleFactor: 4),
          // Ruler.count(10.cm),
          // Ruler.dynamic(190.cm),
          // Ruler.dynamic(200.inch()),
        ],
      ),
    );
  }
}
