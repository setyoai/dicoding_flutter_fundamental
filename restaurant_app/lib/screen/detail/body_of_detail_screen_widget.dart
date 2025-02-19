import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/restaurant.dart';

class BodyOfDetailScreenWidget extends StatelessWidget {
  const BodyOfDetailScreenWidget({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(
              'https://restaurant-api.dicoding.dev/images/small/${restaurant.pictureId}',
              fit: BoxFit.cover,
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
                  restaurant.rating.toString(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
             const SizedBox.square(dimension: 8.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox.square(dimension: 4),
                Text(
                  restaurant.address,
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
                "Foods : ",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            SizedBox(
              height: 55,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final foods = restaurant.menus.foods[index];
                  return Padding(
                    padding: const EdgeInsets.all(1),
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
                              foods.name,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: restaurant.menus.foods.length,
              ),
            ),
            const SizedBox.square(dimension: 8.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Drinks :",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            SizedBox(
              height: 55,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final drinks = restaurant.menus.drinks[index];
                    return Padding(
                      padding: const EdgeInsets.all(1),
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
                                drinks.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: restaurant.menus.drinks.length),
            ),
          ],
        ),
      ),
    );
  }
}
