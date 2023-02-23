import 'dart:math';

import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  ClockPainter(this.context, this.dateTime);

  final BuildContext context;
  final DateTime dateTime;

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);

    ///secondCalculation
    ///size.width * 0.4 define our line height
    ///dateTime.second * 6 because 360 /60 = 6

    double secondX = centerX + size.width * 0.4 * cos((dateTime.second * 6) * pi / 180);
    double secondY = centerY + size.width * 0.4 * sin((dateTime.second * 6) * pi / 180);

    ///second line
    canvas.drawLine(center, Offset(secondX, secondY),
        Paint()..color = Theme.of(context).primaryColor);


    ///hoursCalculation
    ///dateTime.hour * 30 because 360 /12 = 30
    ///+ dateTime.minute * 0.5 because each minute we want to turn our hour line a little

    double hoursX = centerX + size.width * 0.3 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    double hoursY = centerY + size.width * 0.3 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);

    ///hours line
    canvas.drawLine(
        center,
        Offset(hoursX, hoursY),
        Paint()
          ..color = Theme.of(context).colorScheme.secondary
          ..style = PaintingStyle.stroke
          ..strokeWidth = 8);

    ///minutesCalculation

    double minutesX = centerX + size.width * 0.35 * cos((dateTime.minute * 6) * pi / 180);
    double minutesY = centerY + size.width * 0.35 * sin((dateTime.minute * 6) * pi / 180);

    ///minutes line
    canvas.drawLine(
        center,
        Offset(minutesX, minutesY),
        Paint()
          ..color = Theme.of(context).accentColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = 8);



    ///center dots
    Paint dotPainter = Paint()
      ..color = Theme.of(context).primaryIconTheme.color ?? Colors.white;

    canvas.drawCircle(center, 13, dotPainter);
    canvas.drawCircle(
        center, 8, Paint()..color = Theme.of(context).backgroundColor);
    canvas.drawCircle(center, 5, dotPainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}