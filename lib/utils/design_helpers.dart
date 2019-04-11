import 'dart:math' as math;
import 'package:flutter/material.dart';

class DesignHelpers {
  static BoxShadow getShadow() {
    return BoxShadow(
      blurRadius: 25,
      spreadRadius: -15,
      color: const Color.fromARGB(50, 0, 0, 0),
    );
  }

  static BoxDecoration getColorfulDropShadow() {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          blurRadius: 25,
          spreadRadius: -9,
          color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
              .withOpacity(1.0),
        ),
      ],
    );
  }
}
