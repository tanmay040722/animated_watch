import 'dart:async';
import 'dart:math';

import 'package:animated_watch/models/my_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'clock_painter.dart';

class Clock extends StatefulWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  DateTime _dateTime = DateTime.now();

  late Timer _timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer =  Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _dateTime = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Consumer<MyThemeModel>(
          builder: (context, theme, child) => Center(
            child: theme.isLightTheme
                ? Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey[500] ?? Colors.white,
                              offset: const Offset(5.0, 5.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0),
                          const BoxShadow(
                              color: Colors.white,
                              offset: Offset(-5.0, -5.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0),
                        ]),
                    child: Transform.rotate(
                      angle: -pi / 2,
                      child: CustomPaint(
                        painter: ClockPainter(context, _dateTime),
                      ),
                    ),
                  )
                : Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.grey[850],
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey[900] ?? Colors.white,
                              offset: const Offset(5.0, 5.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0),
                          BoxShadow(
                              color: Colors.grey[800] ?? Colors.white,
                              offset: Offset(-5.0, -5.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0),
                        ]),
                    child: Transform.rotate(
                      angle: -pi / 2,
                      child: CustomPaint(
                        painter: ClockPainter(context, _dateTime),
                      ),
                    ),
                  ),
          ),
        ),
        Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Consumer<MyThemeModel>(
                builder: (context, theme, child) => theme.isLightTheme
                    ? IconButton(
                        onPressed: () {
                          theme.changeTheme();
                        },
                        icon: Icon(Icons.sunny,
                            size: 25, color: Theme.of(context).primaryColor))
                    : IconButton(
                        onPressed: () {
                          theme.changeTheme();
                        },
                        icon: Icon(Icons.nightlight_rounded,
                            size: 25, color: Theme.of(context).primaryColor)))),
      ],
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _timer.cancel();
    super.dispose();
  }


}
