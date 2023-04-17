import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'documentation.freezed.dart';

@freezed
class Documentation with _$Documentation {
  const Documentation._();

  const factory Documentation.text(String text) = DocumentationText;

  const factory Documentation.assetsImage({
    required String text,
    required String path,
  }) = DocumentationAssetsImage;

  const factory Documentation.widget({
    required String description,
    required Widget widget,
    required String code,
  }) = DocumentationWidget;

  const factory Documentation.widgetsTable({
    required List<DocumentationWidget> widgets,
  }) = DocumentationWidgetsTable;
}
