import 'package:animated_watch/screens/services/notification_services.dart';
import 'package:flutter/material.dart';

import 'my_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().init();
  await NotificationService().requestIOSPermissions();
  runApp(const MyApp());
}




