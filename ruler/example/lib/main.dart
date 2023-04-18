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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RulerTheme(
          data: RulerThemeData(
            notchColor: Colors.red,
            thickness: 2,
            numberTextStyle: const TextStyle(color: Colors.red),
            numberSpacing: 1,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Ruler.count(
                3.cm,
                notchScaleFactor: 4,
              ),
              Ruler.count(10.cm),
              Ruler.dynamic(190.cm),
              Ruler.dynamic(200.inch()),
            ],
          ),
        ),
      ),
    );
  }
}
