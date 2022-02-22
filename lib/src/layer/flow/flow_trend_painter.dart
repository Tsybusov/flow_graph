import 'dart:ui';

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:lumener/src/data/model/breath_flow.dart';
import 'package:lumener/src/util/graph_calculator.dart';

import 'flow_trend_spec.dart';

class FlowTrendPainter extends CustomPainter {
  FlowTrendPainter({
    required this.spec,
    required this.breathFlow,
  }) : _linePaint = Paint()
          ..color = spec.color
          ..isAntiAlias = true
          ..strokeCap = StrokeCap.round
          ..strokeJoin = StrokeJoin.bevel;

  final Paint _linePaint;
  final BreathFlow breathFlow;
  final FlowTrendSpec spec;

  @override
  void paint(Canvas canvas, Size size) {
    if (breathFlow.flow.isEmpty) {
      return;
    }

    double dx = 0.0;

    final points = breathFlow.flow.map((flow) {
      dx += spec.step;
      return position(dx, flow, size);
    }).toList();

    _drawPath(canvas, points, _linePaint);
  }

  void _drawPath(Canvas canvas, List<Offset> points, Paint linePaint) {
    final Path path = Path();
    path.moveTo(points[0].dx, points[0].dy);
    for (int i = 1; i < points.length; ++i) {
      path.lineTo(points[i].dx, points[i].dy);
    }
    canvas.drawPath(path, linePaint);
  }

  @override
  bool shouldRepaint(FlowTrendPainter oldDelegate) => true;
}
