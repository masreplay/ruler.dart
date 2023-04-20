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
    const padding = SizedBox(height: 20);
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

          // cm equalivlaint to real life ruler's cm
          Ruler.real(system: MeasureSystem.metric),

          padding,

          Expanded(
            child: DynamicDoubleSidedRuler(
              cmWidth: 100,
              rulersAxis: Axis.vertical,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
            ),
          )
        ],
      ),
    );
  }
}
