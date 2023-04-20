import 'package:docs/codeviewer/code_segments.dart';
import 'package:flutter/material.dart';
import 'package:ruler/ruler.dart';

import '../documentation.dart';

List<Documentation> getDocumentations(BuildContext context) {
  String code(TextSpan Function(BuildContext context) f) =>
      f(context).toPlainText().trim();

  return [
    const Documentation.text("Ruler", size: TextSize.heading1),
    const Documentation.text(
      "A ruler is a widget that displays a ruler with a given distance in cm or inches",
      size: TextSize.paragraph,
    ),
    const Documentation.text("Overview", size: TextSize.heading2),
    const Documentation.text(
      "A ruler is a widget that displays a ruler with a given distance in cm or inches",
      size: TextSize.paragraph,
    ),
    Documentation.widget(
      name: 'double_sided',
      description: "Double-sided ruler",
      code: "code",
      widget: Column(
        children: [
          Ruler.count(1.cm),
          Ruler.count(1.cm),
        ],
      ),
    ),
    Documentation.widgetsTable(
      widgets: [
        DocumentationWidget(
          name: "ruler_count",
          description: "Ruler.count fit the given distance to the width",
          code: code(CodeSegments.count),
          widget:
              // BEGIN count
              Ruler.count(3.cm),
          // END
        ),
        DocumentationWidget(
            name: "ruler_dynamic",
            description:
                "Ruler.dynamic is used to display a ruler with a fixed width in pixels for notch",
            code: code(CodeSegments.dynamic),
            widget:
                // BEGIN dynamic
                Ruler.dynamic(300.cm)
            // END
            ),
        DocumentationWidget(
            name: "ruler_real",
            description:
                "Ruler.real create an in real life ruler equivalent to real cm or inches",
            code: code(CodeSegments.real),
            widget:
                // BEGIN real
                Ruler.count(1.cm)
            // END
            ),
        DocumentationWidget(
            name: "notch_color",
            description: "Change color notches color",
            code: code(CodeSegments.notchColor),
            widget:
                // BEGIN notchColor
                Ruler.count(1.cm, notchColor: Colors.black)
            // END
            ),
        DocumentationWidget(
            name: "axis",
            description: "Change axis to vertical or horizontal",
            code: code(CodeSegments.axis),
            widget:
                // BEGIN axis
                Ruler.count(1.cm, axis: Axis.vertical)
            // END
            ),
      ],
    ),
  ];
}
