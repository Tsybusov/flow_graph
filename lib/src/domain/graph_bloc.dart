import 'package:lumener/src/data/breath_flow_repo.dart';
import 'package:lumener/src/data/model/breath_flow.dart';

class GraphBloc {
  GraphBloc(this.repo);

  final BreathFlowRepo repo;

  Stream<BreathFlow> breathFlowStream() => repo.breathFlowStream();
}
