// Copyright 2020-2022 TechAurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

class UIStrings {
  UIStrings._();

  // -----------------------------------------------------------------------------------------------
  // App
  // -----------------------------------------------------------------------------------------------

  static const String appName = 'Flutter Recursive Routing';

  // -----------------------------------------------------------------------------------------------
  // Recursive Routing Screen
  // -----------------------------------------------------------------------------------------------

  static String screenTitle(int level) => 'Level $level';
  static const String goHomeActionTooltip = 'Go home';
  static const String viewSourceTooltip = 'View source';
  static String levelCounter(int level) => 'The Level $level counter is';
  static const String changeCounterTip = 'Change the counter to check state keeping';
  static const String goDeeperTitle = 'Go deeper';
}
