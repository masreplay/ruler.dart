import 'package:docs/documentation.dart';

String toMarkdown(List<Documentation> documentations) {
  final buffer = StringBuffer();
  for (final documentation in documentations) {
    buffer.writeln(documentation.buildMarkdown());
  }
  return buffer.toString();
}
