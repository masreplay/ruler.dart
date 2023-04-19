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
      appBar: AppBar(title: const Text("Rulers")),
      body: Column(
        children: [
          /// 10 centimeters
          Ruler.count(10.cm),

          /// 5 inches and 10 graduations per inch
          Ruler.count(5.inch(10)),

          // 24 graduation of inch with 8 graduations
          Ruler.count(24.inchGraduation(8)),

          // 100 pixel each cm width
          Ruler.dynamic(100.cm),

          Ruler.real(system: MeasureSystem.metric)
        ],
      ),
    );
  }
}
