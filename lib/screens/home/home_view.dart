import 'package:animated_watch/screens/components/size_config.dart';
import 'package:animated_watch/screens/home/reminder.dart';
import 'package:flutter/material.dart';

import '../components/clock.dart';
import '../components/country_card.dart';
import '../components/time_in_hours_minutes.dart';
import '../track_activity/track_activity_view.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  List<CountryCard> country = const [
    CountryCard(
      zoneLocation: 'Europe/London',
      country: 'London, UK',
      iconSrc: 'assets/images/London.svg',
    ),
    CountryCard(
      zoneLocation: 'America/Los_Angeles',
      country: 'Los_Angeles, America',
      iconSrc: 'assets/images/Liberty.svg',
    ),
    CountryCard(
      zoneLocation: 'America/New_York',
      country: 'New_York, America',
      iconSrc: 'assets/images/Newyork.svg',
    ),
    CountryCard(
      zoneLocation: 'Europe/Berlin',
      country: 'Berlin, Europe',
      iconSrc: 'assets/images/Berlin.svg',
    ),
    CountryCard(
      zoneLocation: 'Asia/Baku',
      country: 'Dubai, United Arab Emirates',
      iconSrc: 'assets/images/Dubaisvg.svg',
    ),
    CountryCard(
      zoneLocation: 'Africa/Cairo',
      country: 'Cairo, Africa',
      iconSrc: 'assets/images/Africa.svg',
    ),
    CountryCard(
      zoneLocation: 'Asia/Kabul',
      country: 'Kabul, Afghanistan',
      iconSrc: 'assets/images/afghanistan.svg',
    ),
    CountryCard(
      zoneLocation: 'Europe/Moscow',
      country: 'Moscow, Russia',
      iconSrc: 'assets/images/Russia.svg',
    ),
    CountryCard(
      zoneLocation: 'Asia/Kolkata',
      country: 'Kolkata, India',
      iconSrc: 'assets/images/India.svg',
    ),
    CountryCard(
      zoneLocation: 'Asia/Colombo',
      country: 'Colombo, Sri Lanka',
      iconSrc: 'assets/images/Sri lanka.svg',
    ),
    CountryCard(
      zoneLocation: 'Asia/Bangkok',
      country: 'Bangkok, Thailand',
      iconSrc: 'assets/images/Thailand.svg',
    ),
    CountryCard(
      zoneLocation: 'Asia/Tokyo',
      country: 'Tokyo, Japan',
      iconSrc: 'assets/images/Japan.svg',
    ),
    CountryCard(
      zoneLocation: 'Australia/Sydney',
      country: 'Sydney, Australia',
      iconSrc: 'assets/images/Sydney.svg',
    ),
    CountryCard(
      zoneLocation: 'Asia/Karachi',
      country: 'Karachi, Pakistan',
      iconSrc: 'assets/images/Pakistan.svg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: _key,
      drawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(right: 10, bottom: 10),
            child: Container(
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26, spreadRadius: 5, blurRadius: 5)
                  ],
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
              child: ListView(
                  // Important: Remove any padding from the ListView.
                  padding: EdgeInsets.zero,
                  children: [
                    const DrawerHeader(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  spreadRadius: 5,
                                  blurRadius: 5)
                            ],
                            shape: BoxShape.rectangle,
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                bottomRight: Radius.circular(15))),
                        padding: EdgeInsets.all(25),
                        child: Text(
                          'Track Your Activity',
                          style: TextStyle(fontSize: 20),
                        )),
                    ListTile(
                      leading: Icon(Icons.directions_run,
                          color: Theme.of(context).accentIconTheme.color),
                      title: Text(
                        'Running',
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.copyWith(fontSize: getProportionateWidth(16)),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.health_and_safety,
                          color: Theme.of(context).accentIconTheme.color),
                      title: Text(
                        'Health',
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                              fontSize: getProportionateWidth(16),
                            ),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.track_changes_sharp,
                          color: Theme.of(context).accentIconTheme.color),
                      title: Text(
                        'Track',
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                              fontSize: getProportionateWidth(16),
                            ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TrackActivityView(),
                            ));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.track_changes_sharp,
                          color: Theme.of(context).accentIconTheme.color),
                      title: Text(
                        'Health',
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                              fontSize: getProportionateWidth(16),
                            ),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.track_changes_sharp,
                          color: Theme.of(context).accentIconTheme.color),
                      title: Text(
                        'Health',
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                              fontSize: getProportionateWidth(16),
                            ),
                      ),
                      onTap: () {},
                    )
                  ]),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu_outlined,
            color: Theme.of(context).iconTheme.color,
          ),
          onPressed: () {
            _key.currentState?.openDrawer();
          },
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            width: getProportionateWidth(32),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,
            ),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyNoteScreen(),
                      ));
                },
                icon: const Icon(Icons.add)),
          )
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Text(
              'New Delhi, India | IST',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const TimeInHourAndMinute(),
            const Spacer(),
            Clock(),
            Spacer(),
            Row(
              children: [
                SizedBox(
                  height: 200,
                  width: SizeConfig.screenWidth,
                  child: listView(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget listView() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: country.length,
      itemBuilder: (context, index) => country[index],
    );
  }
}
