import 'package:flutter/material.dart';
import 'package:restaurant_app/services/local_notification_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalNotificationProvider extends ChangeNotifier {
  final LocalNotificationService flutterNotificationService;

  bool _isReminderMode = false;

  bool get isReminderMode => _isReminderMode;

  LocalNotificationProvider(this.flutterNotificationService) {
    _loadReminder();
  }

  void toggleReminder(bool value) async {
    _isReminderMode = value;

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('isReminderMode', value);

    if (value) {
      await flutterNotificationService.scheduleDailyTenAMNotification(id: 0);
    } else {
      await flutterNotificationService.cancelNotification(0);
    }

    notifyListeners();
  }

  Future<void> _loadReminder() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isReminderMode = prefs.getBool('isReminderMode') ?? false;
    notifyListeners();
  }
}
