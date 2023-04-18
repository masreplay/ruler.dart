import 'package:docs/codeviewer/code_segments.dart';
import 'package:flutter/material.dart';
import 'package:ruler/ruler.dart';

import '../documentation.dart';

List<Documentation> getDocumentations(BuildContext context) {
  String code(TextSpan Function(BuildContext context) f) =>
      f(context).toPlainText().trim();

  return [
    const Documentation.text(
      "Real Ruler with notches supports both metric and imperial units.",
    ),
    Documentation.widgetsTable(
      widgets: [
        DocumentationWidget(
            description: "Ruler.count fit the given distance to the width",
            code: code(CodeSegments.count),
            widget:
                // BEGIN count
                Ruler.count(3.cm)
            // END
            ),
        DocumentationWidget(
            description:
                "Ruler.dynamic create n of notches depending on the width",
            code: code(CodeSegments.dynamic),
            widget:
                // BEGIN dynamic
                Ruler.dynamic(3.cm)
            // END
            ),
        DocumentationWidget(
            description:
                "Ruler.real create an in real life ruler equivalent to real cm or inches",
            code: code(CodeSegments.real),
            widget:
                // BEGIN real
                Ruler.real(MeasureSystem.imperial)
            // END
            ),
        DocumentationWidget(
            description: "Change color notches color",
            code: code(CodeSegments.notchColor),
            widget:
                // BEGIN notchColor
                Ruler.count(1.cm, notchColor: Colors.black)
            // END
            ),
        DocumentationWidget(
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
