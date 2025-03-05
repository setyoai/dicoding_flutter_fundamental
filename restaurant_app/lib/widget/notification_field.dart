import 'package:flutter/material.dart';
import 'package:restaurant_app/provider/local_notification_provider.dart';
import 'package:provider/provider.dart';

class NotificationField extends StatelessWidget {
  const NotificationField({super.key});

  @override
  Widget build(BuildContext context) {
    final localNotificationProvider =
        Provider.of<LocalNotificationProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Daily Reminder',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Switch(
                value: localNotificationProvider.isReminderMode,
                onChanged: (value) {
                  localNotificationProvider.toggleReminder(value);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
