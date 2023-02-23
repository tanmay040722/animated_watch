import 'dart:async';

import 'package:animated_watch/screens/components/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class CountryCard extends StatefulWidget {
  const CountryCard({
    Key? key,
    this.country,
    this.iconSrc,
    this.zoneLocation,
  }) : super(key: key);

  final String? country, iconSrc, zoneLocation;

  @override
  State<CountryCard> createState() => _CountryCardState();
}

class _CountryCardState extends State<CountryCard> {
  String? timeFormat ;
  String? timeZone;
  String? timePeriod;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    setup();





  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateWidth(20)),
      child: SizedBox(
        width: getProportionateWidth(233),
        child: AspectRatio(
          aspectRatio: 1.32,
          child: Container(
            padding: EdgeInsets.all(getProportionateWidth(20)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Theme.of(context).primaryIconTheme.color ?? Colors.white,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.country ?? 'N/A',
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(fontSize: getProportionateWidth(16)),
                ),
                SizedBox(height: 5),
                Text(timeZone ?? ''),
                Spacer(),
                Row(
                  children: [
                    SizedBox(
                      height: 80,
                      width: 70,
                      child: SvgPicture.asset(
                        widget.iconSrc ?? 'N/A',
                        width: getProportionateWidth(40),
                        color: Theme.of(context).accentIconTheme.color,


                      ),
                    ),
                    Spacer(),
                    Text(
                      timeFormat ?? '',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    RotatedBox(
                      quarterTurns: 3,
                      child: Text(timePeriod ?? ''),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
 Future<void> setup () async{
    tz.initializeTimeZones();
    var location = tz.getLocation(widget.zoneLocation ?? 'N/A' );
    var now = tz.TZDateTime.now(location);

    String name = tz.TZDateTime.now(location).timeZoneName;

    timeFormat = DateFormat(' hh:mm').format(now);
    timePeriod = DateFormat('a').format(now);

    timeZone =
    '${tz.TZDateTime.now(location).timeZoneOffset.toString().replaceAll(':00.000000', '')} HRS | $name';
  }
}
