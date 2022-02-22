import 'package:flutter/widgets.dart';
import 'package:lumener/src/data/model/breath_flow.dart';
import 'package:lumener/src/domain/graph_bloc.dart';
import 'package:lumener/src/feature/no_data_widget.dart';
import 'package:lumener/src/layer/flow/flow_trend_painter.dart';
import 'package:lumener/src/layer/flow/flow_trend_spec.dart';

class Graph extends StatelessWidget {
  const Graph({
    required this.spec,
    required this.bloc,
  });

  final FlowTrendSpec spec;
  final GraphBloc bloc;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BreathFlow>(
        stream: bloc.breathFlowStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const NoDataWidget();
          }
          return CustomPaint(
            size: Size.infinite,
            painter: FlowTrendPainter(
              spec: spec,
              breathFlow: snapshot.data!,
            ),
          );
        });
  }
}
