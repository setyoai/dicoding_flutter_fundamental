import 'package:flutter/material.dart';
import 'package:restaurant_app/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/style/typography/restaurant_text_styles.dart';

class ThemeField extends StatelessWidget {
  const ThemeField({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Dark Theme',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: RestaurantTextStyles.labelSmall.fontWeight,
                ),
              ),
              Switch(
                value: themeProvider.isDarkMode,
                onChanged: (value) {
                  themeProvider.toggleTheme(value);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
