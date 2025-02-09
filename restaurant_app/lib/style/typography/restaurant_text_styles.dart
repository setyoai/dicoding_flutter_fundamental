import 'package:flutter/material.dart';

class RestaurantTextStyles {
  static const TextStyle _commonStyle = TextStyle(fontFamily: 'Overpass');

  /// displayLarge Text Style
  static TextStyle displayLarge = _commonStyle.copyWith(
    fontSize: 57,
    fontWeight: FontWeight.w700,
    height: 1.11,
    letterSpacing: -2,
  );

  /// displayMedium Text Style
  static TextStyle displayMedium = _commonStyle.copyWith(
    fontSize: 45,
    fontWeight: FontWeight.w600,
    height: 1.17,
    letterSpacing: -1,
  );

  /// displaySmall Text Style
  static TextStyle displaySmall = _commonStyle.copyWith(
    fontSize: 36,
    fontWeight: FontWeight.w500,
    height: 1.25,
    letterSpacing: -1,
  );

  /// headLineLarge Style
  static TextStyle headLineLarge = _commonStyle.copyWith(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    height: 1.5,
    letterSpacing: -1,
  );

  /// headLineMedium Style
  static TextStyle headLineMedium = _commonStyle.copyWith(
    fontSize: 28,
    fontWeight: FontWeight.w500,
    height: 1.2,
    letterSpacing: -1,
  );

  /// headLineSmall Style
  static TextStyle headLineSmall = _commonStyle.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    height: 1.0,
    letterSpacing: -1,
  );

  /// titleLarge Style
  static TextStyle titleLarge = _commonStyle.copyWith(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    height: 1.2,
    letterSpacing: 1.2,
  );

  /// titleMedium Style
  static TextStyle titleMedium = _commonStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.2,
    letterSpacing: 1.2,
  );

  /// titleSmall Style
  static TextStyle titleSmall = _commonStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    height: 1.2,
    letterSpacing: 1.2,
  );

  /// bodyLargeBold Text Style
  static TextStyle bodyLargeBold = _commonStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.56,
  );

  /// bodyLargeMedium Text Style
  static TextStyle bodyLargeMedium = _commonStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    height: 1.56,
  );

  /// bodyLargeReguler Text Style
  static TextStyle bodyLargeReguler = _commonStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w200,
    height: 1.56,
  );

   /// labelLarge Text Style
  static TextStyle labelLarge = _commonStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    height: 1.71,
    letterSpacing: 1.3,
  );

   static TextStyle labelMedium = _commonStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w200,
    height: 1.4,
    letterSpacing: 1.3,
  );

   static TextStyle labelSmall = _commonStyle.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w100,
    height: 1.2,
    letterSpacing: 1.3,
  );

}
