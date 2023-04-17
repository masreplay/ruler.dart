import 'package:docs/codeviewer/code_segments.dart';
import 'package:flutter/material.dart';
import 'package:ruler/ruler.dart';

import '../documentation.dart';

List<Documentation> getDocumentations(BuildContext context) {
  return [
    const Documentation.text(
      "Real Ruler with notches supports both metric and imperial units.",
    ),
    Documentation.widgetsTable(
      widgets: [
        DocumentationWidget(
            description: "Change color",
            code: CodeSegments.notchColor(context).toPlainText().trim(),
            widget:
                // BEGIN notchColor#1
                Ruler.count(1.cm, notchColor: Colors.black)
            // END
            ),
        DocumentationWidget(
            description: "Change size",
            code: CodeSegments.axis(context).toPlainText().trim(),
            widget:
                // BEGIN axis#1
                Ruler.count(1.cm, axis: Axis.vertical)
            // END
            ),
      ],
    ),
  ];
}
