import 'dart:math' as math;

import 'package:flutter/material.dart';

class CenteredElasticOutCurve extends Curve {
  final double period;

  CenteredElasticOutCurve([this.period = 0.4]);

  @override
  double transform(double x) {
    return math.pow(2.0, -10.0 * x) * math.sin(x * 2.0 * math.pi / period) +
        0.5;
  }
}

class CenteredElasticInCurve extends Curve {
  final double period;

  CenteredElasticInCurve([this.period = 0.4]);

  @override
  double transform(double x) {
    return -math.pow(2.0, 10.0 * (x - 1.0)) *
            math.sin((x - 1.0) * 2.0 * math.pi / period) +
        0.5;
  }
}

class LinearPointCurve extends Curve {
  final double pIn;
  final double pOut;

  LinearPointCurve(this.pIn, this.pOut);

  @override
  double transform(double x) {
    final lowerScale = pOut / pIn;
    final upperScale = (1.0 - pOut) / (1.0 - pIn);
    final upperOffset = 1.0 - upperScale;
    return x < pIn ? x * lowerScale : x * upperScale + upperOffset;
  }
}
