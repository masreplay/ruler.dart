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
              Ruler.count(2.cm),
              Notch(
                10.mm,
                base: true,
                number: 1,
                showLastNumber: true,
                numberSpacing: 20,
                notchScaleFactor: 3,
                showLastPart: true,
              ),
              // gap,
              // Notch(
              //   10.mm,
              //   axis: Axis.vertical,
              //   base: true,
              //   number: 1,
              //   size: 200,
              //   numberSide: RulerSide.end,
              //   showLastPart: true,
              //   showLastNumber: true,
              //   numberSpacing: 20,
              //   notchScaleFactor: 3,
              //   notchSide: RulerSide.start,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
