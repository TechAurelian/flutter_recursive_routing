// Copyright 2020-2022 TechAurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'counter.dart';
import 'ui_strings.dart';
import 'utils.dart';

class RecursiveRoutingScreen extends StatefulWidget {
  static const String _viewSourceUrl = 'https://github.com/TechAurelian/flutter_recursive_routing';

  const RecursiveRoutingScreen(this.level, {super.key});

  final int level;

  @override
  State<RecursiveRoutingScreen> createState() => _RecursiveRoutingScreenState();
}

class _RecursiveRoutingScreenState extends State<RecursiveRoutingScreen> {
  void _goDeep(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecursiveRoutingScreen(widget.level + 1),
      ),
    );
  }

  void _goHomeAction(BuildContext context) {
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  void _viewSourceAction() {
    launchUrl(
      Uri.parse(RecursiveRoutingScreen._viewSourceUrl),
      mode: LaunchMode.externalApplication,
    );
  }

  @override
  Widget build(BuildContext context) {
    Color color = Utils.getRandomColor();
    Color contrastColor = Utils.contrastOf(color);

    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: color,
              onPrimary: contrastColor,
              secondary: color,
              onSecondary: contrastColor,
            ),
      ),
      child: Scaffold(
        appBar: _AppBar(
          level: widget.level,
          onHomePressed: () => _goHomeAction(context),
          onSourcePressed: _viewSourceAction,
        ),
        body: Counter(level: widget.level),
        floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.arrow_drop_down_circle),
          label: const Text(UIStrings.goDeeperTitle),
          onPressed: () => _goDeep(context),
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar({
    // ignore: unused_element
    super.key,
    required this.level,
    this.onHomePressed,
    this.onSourcePressed,
  });

  final int level;

  /// The callback that is called when the home action is pressed.
  final VoidCallback? onHomePressed;

  /// The callback that is called when the view source action is pressed.
  final VoidCallback? onSourcePressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(UIStrings.screenTitle(level)),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.home),
          tooltip: UIStrings.goHomeActionTooltip,
          onPressed: onHomePressed,
        ),
        IconButton(
          icon: const Icon(Icons.source),
          tooltip: UIStrings.viewSourceTooltip,
          onPressed: onSourcePressed,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
