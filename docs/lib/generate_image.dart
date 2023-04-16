import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

Future<Uint8List?> generateImage({
  required Widget widget,
  required Size size,
  double devicePixelRatio = 1,
}) async {
  final viewConfiguration = ViewConfiguration(
    devicePixelRatio: devicePixelRatio,
    size: size,
  );

  final repaintBoundary = RenderRepaintBoundary();

  final renderPositionedBox = RenderPositionedBox(
    alignment: Alignment.center,
    child: repaintBoundary,
  );

  final renderView = RenderView(
    window: ui.window,
    child: renderPositionedBox,
    configuration: viewConfiguration,
  );

  final pipelineOwner = PipelineOwner();
  final buildOwner = BuildOwner(focusManager: FocusManager());

  pipelineOwner.rootNode = renderView;
  renderView.prepareInitialFrame();

  final widgetRender = RenderObjectToWidgetAdapter<RenderBox>(
    container: repaintBoundary,
    debugShortDescription: "Generated",
    child: widget,
  );

  final rootElement = widgetRender.attachToRenderTree(buildOwner);

  buildOwner.buildScope(rootElement);
  buildOwner.finalizeTree();

  ///
  pipelineOwner.flushLayout();
  pipelineOwner.flushCompositingBits();
  pipelineOwner.flushPaint();
  pipelineOwner.flushSemantics();

  final image = await repaintBoundary.toImage(pixelRatio: 2);

  final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

  return byteData?.buffer.asUint8List();
}
