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
    final distance = (16.9 / 8).inch(8);

    return Scaffold(
      appBar: AppBar(title: const Text("Rulers")),
      body: Column(
        children: [
          /// 10 centimeters
          // Ruler.count(0.05.cm),

          Ruler.count(distance),
          Expanded(
            child: Ruler.count(
              distance,
              axis: Axis.vertical,
            ),
          ),

          /// 5 inches and 10 graduations per inch
          // Ruler.count(5.1.inch(10)),

          // padding,

          // padding,
          // 24 graduation of inch with 8 graduations
          // Ruler.count(16.9.inchGraduation(8)),

          // padding,
          // Ruler.count(1.inchGraduation(8)),

          // padding,
          // 100 pixel each cm width
          // Ruler.dynamic(100.cm),

          // padding,
          // cm equalivlaint to real life ruler's cm
          // Ruler.real(system: MeasureSystem.metric),

          // padding,
          // DynamicDoubleSidedRuler(
          //   cmWidth: 100,
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.red,
          //   ),
          // ),

          // padding,
          // Expanded(
          //   child: DynamicDoubleSidedRuler(
          //     cmWidth: 100,
          //     rulersAxis: Axis.vertical,
          //     child: Container(
          //       width: 100,
          //       height: 100,
          //       color: Colors.red,
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
