// Copyright 2020-2022 TechAurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'dart:math';
import 'package:flutter/material.dart';

class Utils {
  static final _random = Random();

  static Color getRandomColor() {
    return Color.fromRGBO(_random.nextInt(256), _random.nextInt(256), _random.nextInt(256), 1.0);
  }

  /// Returns the black or white contrast color of a given color.
  static Color contrastOf(Color color) {
    return ThemeData.estimateBrightnessForColor(color) == Brightness.light
        ? Colors.black
        : Colors.white;
  }
}
