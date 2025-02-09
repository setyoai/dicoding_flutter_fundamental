import 'package:flutter/material.dart';
import 'package:restaurant_app/style/colors/restaurant_colors.dart';
import 'package:restaurant_app/style/typography/restaurant_text_styles.dart';

class RestaurantTheme {
  static TextTheme get _textTheme {
    return TextTheme(
        displayLarge: RestaurantTextStyles.displayLarge,
        displayMedium: RestaurantTextStyles.displayMedium,
        displaySmall: RestaurantTextStyles.displaySmall,
        headlineLarge: RestaurantTextStyles.headLineLarge,
        headlineMedium: RestaurantTextStyles.headLineMedium,
        headlineSmall: RestaurantTextStyles.headLineSmall,
        titleLarge: RestaurantTextStyles.titleLarge,
        titleMedium: RestaurantTextStyles.titleMedium,
        titleSmall: RestaurantTextStyles.titleSmall,
        bodyLarge: RestaurantTextStyles.bodyLargeBold,
        bodyMedium: RestaurantTextStyles.bodyLargeMedium,
        bodySmall: RestaurantTextStyles.bodyLargeReguler,
        labelLarge: RestaurantTextStyles.labelLarge,
        labelMedium: RestaurantTextStyles.labelMedium,
        labelSmall: RestaurantTextStyles.labelSmall);
  }

  static AppBarTheme get _appBarTheme {
    return AppBarTheme(
        toolbarTextStyle: _textTheme.titleLarge,
        shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(14),
                bottomRight: Radius.circular(14))));
  }

  static ThemeData get lightTheme {
    return ThemeData(
      colorSchemeSeed: RestaurantColors.green.color,
      brightness: Brightness.light,
      textTheme: _textTheme,
      useMaterial3: true,
      appBarTheme: _appBarTheme,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorSchemeSeed: RestaurantColors.green.color,
      brightness: Brightness.dark,
      textTheme: _textTheme,
      useMaterial3: true,
      appBarTheme: _appBarTheme,
    );
  }
}
