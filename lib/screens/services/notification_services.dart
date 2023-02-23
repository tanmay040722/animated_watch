import 'package:animated_watch/screens/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static BuildContext? context;

  static void setContext(BuildContext context) =>
      NotificationService.context = context;

  //instance of FlutterLocalNotificationsPlugin
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    //Initialization Settings for Android
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    //Initialization Settings for iOS
    const DarwinInitializationSettings initializationSettingsIOS =
    DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    );

    //Initializing settings for both platforms (Android & iOS)
    const InitializationSettings initializationSettings =
    InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS);

    tz.initializeTimeZones();

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        print('______________${details.payload}_________');

      },
    );
  }

  onSelectNotification(String? payload) async {
    //Navigate to wherever you want
    if (NotificationService.context == null) {

    } else {
      Navigator.push(
          context!,
          MaterialPageRoute(
            builder: (context) => HomeView(),
          ));
    }
  }

  requestIOSPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  Future<void> showNotifications({id, title, body, payload}) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails('watch123', 'animated_watch',
        channelDescription: 'your channel description',
        importance: Importance.max,
        priority: Priority.max,
        ticker: 'ticker');
    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin
        .show(id, title, body, platformChannelSpecifics, payload: payload);
  }

  Future<void> scheduleNotifications({id, title, body, time}) async {
    try {
      await flutterLocalNotificationsPlugin.zonedSchedule(
          0,
          'scheduled title',
          'scheduled body',
          tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
          const NotificationDetails(
              android: AndroidNotificationDetails(
                  'full screen channel id', 'full screen channel name',
                  channelDescription: 'full screen channel description',
                  priority: Priority.high,
                  importance: Importance.high,
                  fullScreenIntent: true, )),
          androidAllowWhileIdle: true,
          uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime
       /* id,
        title,
        body,
        tz.TZDateTime.from(time, tz.local),
        payload: 'hi',
        const NotificationDetails(
            android: AndroidNotificationDetails('watch123', 'animated_watch',
              channelDescription: 'your channel description',
              importance: Importance.max,
              priority: Priority.max, playSound: true,)),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,*/
      );
    } catch (e) {
      print(e);
    }
  }
}
