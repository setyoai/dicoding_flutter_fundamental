import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restaurant.dart';
import 'package:restaurant_app/screen/home/restaurant_card_widget.dart';
import 'package:restaurant_app/static/navigation_route.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant Home'),
      ),
      body: ListView.builder(
        itemCount: restaurantList.length,
        itemBuilder: (context, index) {
          final restaurant = restaurantList[index];

          return RestaurantCardWidget(
            restaurant: restaurant,
            onTap: () {
              Navigator.pushNamed(
                context,
                NavigationRoute.detailRoute.name,
              );
            },
          );
        },
      ),
    );
  }
}
