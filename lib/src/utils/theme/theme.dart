import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talkify_chat_application/src/constants/constant_colors.dart';

Color getTextColor(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark
      ? kContentColorDarkTheme
      : kContentColorLightTheme;
}
abstract class LightColors {
  static const background = Colors.white;
  static const card = Color.fromARGB(255, 247, 243, 243);
}

abstract class DarkColors {
  static const background = Color.fromARGB(255, 35, 39, 41);
  static const card = Color.fromARGB(255, 2, 5, 40);
}
ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: kSecondaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme,
    iconTheme: const IconThemeData(color: kContentColorLightTheme),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: kContentColorLightTheme),
    colorScheme: const ColorScheme.light(
      primary: kSecondaryColor,
      secondary: kSecondaryColor,
      error: kErrorColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: kContentColorLightTheme.withOpacity(0.7),
      unselectedItemColor: kContentColorLightTheme.withOpacity(0.32),
      selectedIconTheme: const IconThemeData(color: kPrimaryColor),
      showUnselectedLabels: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kContentColorLightTheme,
      ),
    ),
    cardColor: LightColors.card,
    cardTheme: CardTheme(
      color: LightColors.card,
    ),
    
  );
}

ThemeData darkThemeData(BuildContext context) {
  // Bydefault flutter provie us light and dark theme
  // we just modify it as our need
  return ThemeData.dark().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kContentColorLightTheme,
    appBarTheme: appBarTheme.copyWith(backgroundColor: kContentColorLightTheme),
    iconTheme: const IconThemeData(color: kContentColorDarkTheme),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: kContentColorDarkTheme),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: kPrimaryColor,
      secondary: kSecondaryColor,
      error: kErrorColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: kContentColorLightTheme,
      selectedItemColor: Colors.white70,
      unselectedItemColor: kContentColorDarkTheme.withOpacity(0.32),
      selectedIconTheme: const IconThemeData(color: kPrimaryColor),
      showUnselectedLabels: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kContentColorDarkTheme,
      ),
    ),
    cardColor: DarkColors.card,
    cardTheme: CardTheme(
      color: DarkColors.card
    ),
  );
}

const appBarTheme = AppBarTheme(centerTitle: false, elevation: 0);
