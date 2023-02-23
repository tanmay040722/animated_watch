import 'dart:ffi';

import 'package:animated_watch/screens/components/size_config.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HabitTile extends StatelessWidget {
  HabitTile(
      {Key? key,
      required this.habitName,
      required this.onTap,
      required this.settingTap,
      required this.goalTime,
      required this.timeSpent,
      required this.isHabitStarted})
      : super(key: key);
  final String habitName;
  final VoidCallback onTap;
  final VoidCallback settingTap;
  final int timeSpent;
  final int goalTime;
  final bool isHabitStarted;

  String formateToSec(int totalSeconds) {
    String sec = (totalSeconds % 60).toString();

    /// 62 % 60 = 2
    String min = (totalSeconds / 60).toStringAsFixed(5);

    /// 62/60 = 1.2

    if (sec.length == 1) {
      sec = '0' + sec;
    }
    if (min[1] == '.') {
      min = min.substring(0, 1);
    }
    return min + ':' + sec;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey[100],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 60,
                  width: 60,
                  child: Stack(
                    children: [
                      CircularPercentIndicator(
                        radius: 30,
                        percent: calculatePercent() < 1 ? calculatePercent() : 1,
                        progressColor: calculatePercent() > 0.5 ? Colors.green : Colors.red,
                      ),
                      Center(
                          child: GestureDetector(
                        onTap: onTap,
                        child: Icon(
                            isHabitStarted ? Icons.pause : Icons.play_arrow),
                      ))
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      habitName,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text('${formateToSec(timeSpent)} / $goalTime  = ${(calculatePercent()*100).toStringAsFixed(0)}%'),
                  ],
                ),
              ],
            ),
            GestureDetector(onTap: settingTap, child: Icon(Icons.settings)),
          ],
        ),
      ),
    );
  }

 double calculatePercent() {
    return timeSpent / (goalTime * 60) ;
  }
}
