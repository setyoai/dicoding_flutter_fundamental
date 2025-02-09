import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restaurant.dart';

class DetailScreen extends StatelessWidget {
  final Restaurant restaurant;

  const DetailScreen({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(restaurant.name),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Image.network(
                  restaurant.image,
                  fit: BoxFit.fill,
                ),
                const SizedBox.square(dimension: 16.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    restaurant.name,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                const SizedBox.square(dimension: 8.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on_outlined),
                    const SizedBox.square(dimension: 4),
                    Text(
                      restaurant.city,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                const SizedBox.square(dimension: 8.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.star_outline_outlined),
                    const SizedBox.square(dimension: 4),
                    Text(
                      restaurant.rating,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                const SizedBox.square(dimension: 32.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Description",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const SizedBox.square(dimension: 8.0),
                Text(
                  restaurant.description,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox.square(dimension: 32),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Menu",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                 const SizedBox.square(dimension: 8.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Food : ",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                SizedBox(
                  height:
                      80, 
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final Restaurant restaurant = restaurantList[index];
                      return Padding(
                        padding: const EdgeInsets.all(5),
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  restaurant.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: restaurantList.length,
                  ),
                ),
                 const SizedBox.square(dimension: 16),
                 Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Drinks",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                SizedBox(
                  height:
                      80, 
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final Restaurant restaurant = restaurantList[index];
                      return Padding(
                        padding: const EdgeInsets.all(5),
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  restaurant.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: restaurantList.length,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
