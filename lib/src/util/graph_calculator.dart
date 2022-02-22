import 'dart:ui';

extension DurationX on Duration {
  bool inRangeDuration(Duration min, Duration max) {
    return this >= min && this <= max;
  }
}

Offset position(double dx, double dy, Size size) {
  return Offset(dx, dy);
}
