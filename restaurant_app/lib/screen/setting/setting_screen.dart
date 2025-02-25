import 'package:flutter/material.dart';
import 'package:restaurant_app/widget/theme_field.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting Screen'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: const [
              ThemeField(),
            ],
          ),
        ),
      ),
    );
  }
}
