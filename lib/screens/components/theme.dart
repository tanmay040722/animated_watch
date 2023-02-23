import 'package:animated_watch/screens/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeData(BuildContext context) {
  return ThemeData(
      appBarTheme: appBarTheme,
      primaryColor: kPrimaryColor,
      accentColor: kAccentLightColor,
      scaffoldBackgroundColor: Colors.grey[300],
      colorScheme: const ColorScheme.light(secondary: kBodyTextColorLight ),//kSecondaryLightColor
      ///onLight theme surface =Colors.white by default
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: kBodyTextColorLight),
      accentIconTheme: const IconThemeData(color: kTitleTextLightColor),
      primaryIconTheme: const IconThemeData(color: kPrimaryIconLightColor),
      textTheme: GoogleFonts.latoTextTheme().copyWith(
        bodyText1: const TextStyle(color: kBodyTextColorLight),
        bodyText2: const TextStyle(color: kBodyTextColorLight),
        headline4: const TextStyle(color: kTitleTextLightColor, fontSize: 32),
        headline1: const TextStyle(color: kTitleTextLightColor, fontSize: 82),
      ));
}

///dark theme

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
      appBarTheme: appBarTheme,
      primaryColor: kPrimaryColor,
      accentColor: kAccentDarkColor,
      scaffoldBackgroundColor: Colors.grey[850],
      colorScheme: const ColorScheme.light(
        secondary: kSecondaryDarkColor,
        surface: kSurfaceDarkColor,
      ),
      backgroundColor: kBackgroundDarkColor,
      iconTheme: IconThemeData(color: kBodyTextColorDark),
      accentIconTheme: const IconThemeData(color: kPrimaryIconLightColor),
      primaryIconTheme: const IconThemeData(color: kPrimaryIconDarkColor),
      textTheme: GoogleFonts.latoTextTheme().copyWith(
        bodyText1: const TextStyle(color: kBodyTextColorDark),
        bodyText2: const TextStyle(color: kBodyTextColorDark),
        headline4: const TextStyle(color: kTitleTextDarkColor, fontSize: 32),
        headline1: const TextStyle(color: kTitleTextDarkColor, fontSize: 82),
      ));
}

AppBarTheme appBarTheme = AppBarTheme(color: Colors.transparent, elevation: 0);
