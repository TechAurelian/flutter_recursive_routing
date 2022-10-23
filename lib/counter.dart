// Copyright 2020-2022 TechAurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'ui_strings.dart';

class Counter extends StatefulWidget {
  const Counter({super.key, required this.level});

  final int level;

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;
  bool _counterHasChanged = false;

  void decreaseCounter() {
    setState(() {
      _counter--;
      _counterHasChanged = true;
    });
  }

  void increaseCounter() {
    setState(() {
      _counter++;
      _counterHasChanged = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          UIStrings.levelCounter(widget.level),
          style: Theme.of(context).textTheme.subtitle2,
        ),
        Text(
          '$_counter',
          style: Theme.of(context).textTheme.headline1?.copyWith(
                color: _counterHasChanged ? Colors.black : Colors.black26,
              ),
        ),
        const SizedBox(height: 12.0),
        Text(
          UIStrings.changeCounterTip,
          style: Theme.of(context).textTheme.caption,
        ),
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: decreaseCounter,
              child: const Icon(Icons.remove),
            ),
            const SizedBox(width: 16.0),
            ElevatedButton(
              onPressed: increaseCounter,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }
}
