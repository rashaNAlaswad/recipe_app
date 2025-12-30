import 'package:flutter/cupertino.dart';

class AppTheme {
  // Light Theme Colors
  static const Color lightBackground = CupertinoColors.white;
  static const Color lightPrimary = CupertinoColors.systemBlue;
  static const Color lightSecondary = CupertinoColors.systemGrey;
  static const Color lightText = CupertinoColors.black;
  static const Color lightSecondaryText = CupertinoColors.systemGrey;
  static const Color lightCardBackground = CupertinoColors.systemGrey6;

  // Dark Theme Colors
  static const Color darkBackground = CupertinoColors.black;
  static const Color darkPrimary = CupertinoColors.systemBlue;
  static const Color darkSecondary = CupertinoColors.systemGrey2;
  static const Color darkText = CupertinoColors.white;
  static const Color darkSecondaryText = CupertinoColors.systemGrey;
  static const Color darkCardBackground = CupertinoColors.darkBackgroundGray;

  static CupertinoThemeData get lightTheme {
    return const CupertinoThemeData(
      brightness: Brightness.light,
      primaryColor: lightPrimary,
      scaffoldBackgroundColor: lightBackground,
      textTheme: CupertinoTextThemeData(
        primaryColor: lightText,
      ),
    );
  }

  static CupertinoThemeData get darkTheme {
    return const CupertinoThemeData(
      brightness: Brightness.dark,
      primaryColor: darkPrimary,
      scaffoldBackgroundColor: darkBackground,
      textTheme: CupertinoTextThemeData(
        primaryColor: darkText,
      ),
    );
  }
}
