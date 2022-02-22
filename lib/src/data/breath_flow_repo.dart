import 'model/breath_flow.dart';

class BreathFlowRepo {

  Stream<BreathFlow> breathFlowStream() async* {
    Stream.periodic(const Duration(seconds: 10), (computationCount) {
      yield BreathFlow();
    });
  }
}