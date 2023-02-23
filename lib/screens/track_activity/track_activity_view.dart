import 'dart:async';

import 'package:flutter/material.dart';

import '../components/size_config.dart';
import 'components/habit_tile.dart';

class TrackActivityView extends StatefulWidget {
  TrackActivityView({Key? key}) : super(key: key);

  @override
  State<TrackActivityView> createState() => _TrackActivityViewState();
}

class _TrackActivityViewState extends State<TrackActivityView> {
  ///habit list
  List habitList = [
    ['Exercise', false, 0, 1],
    ['Read', false, 0, 10],
    ['Meditate', false, 0, 10],
    ['Code', false, 0, 10],
  ];
///convert into seconds into min for e.g. 62 seconds into  01.02 minutes



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[300],
          automaticallyImplyLeading: false,
          centerTitle: false,
          title: Text(
            'Track your activity here...',
            style: Theme.of(context).textTheme.headline4?.copyWith(
                fontSize: getProportionateWidth(22),
                fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView.builder(
          itemCount: habitList.length,
          itemBuilder: (context, index) => HabitTile(
              habitName: habitList[index][0],
              onTap: () {
                habitStarted(index);
              },
              settingTap: () {
                dialogBox(index);
              },
              isHabitStarted: habitList[index][1],
              goalTime: habitList[index][3],
              timeSpent: habitList[index][2]),
        ));
  }

  void habitStarted(int index) {
    ///to run app in background taking reference to current time to run app even after lock device

    var startTime = DateTime.now();

    ///store the time already elapsed
    int elapcedTime = habitList[index][2];
    setState(() {
      habitList[index][1] = !habitList[index][1];
    });


    if(habitList[index][1]){

      ///keep time going
      Timer.periodic(const Duration(seconds: 1), (timer) {
       setState((){
         ///check when user has stoped the timer
         if (!habitList[index][1]) {
           timer.cancel();
         }

         ///calculate the time that elapsed by comparing current time
         var currentTime = DateTime.now();

         /// currentTime.second - startTime.second :- let suppose start time is 6:30:20 and current time is 6:30:30
         /// so result is 5 seconds but if start time is 6:30:20 and current time 6:31:20 then the result is -10 ,
         /// this not right just because there is calculating only seconds so, want to get accurate result so calculate
         /// minutes and hours also
         habitList[index][2] = elapcedTime + currentTime.second -
             startTime.second +
             60 * (currentTime.minute - startTime.minute) +
             60 * 60 * (currentTime.hour - startTime.hour);
       });
       if(habitList[index][2] == habitList[index][3]*60 ){
         timer.cancel();
       }
      });
    }
  }

  void dialogBox(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Setting for ' + habitList[index][0]),
          );
        });
  }
}
