import 'package:ruler/ruler.dart';

import 'documentation.dart';

final List<Documentation> documentations = [
  const Documentation.text(
      "Real Ruler with notches supports both metric and imperial units."),
  // Documentation.widget(
  //   text: "show in real life ruler",
  //   widget: Ruler.real(MeasureSystem.imperial),
  //   code: "Ruler.real(MeasureSystem.imperial)",
  // ),
  Documentation.widget(
    text: "full-screen ruler",
    widget: Ruler.dynamic(10.cm),
    code: "Ruler.dynamic(10.cm)",
  ),
];
