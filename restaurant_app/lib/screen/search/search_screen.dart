import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/search/restaurant_search_provider.dart';
import 'package:restaurant_app/static/navigation_route.dart';
import 'package:restaurant_app/static/restaurant_search_result_state.dart';
import 'package:restaurant_app/widget/restaurant_card_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> filteredRestaurantList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Restaurants'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Enter restaurant name',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    // Trigger search when user presses the search button
                    context
                        .read<RestaurantSearchProvider>()
                        .fetchRestaurantSearch(_searchController.text);
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Consumer<RestaurantSearchProvider>(
              builder: (context, provider, child) {
                if (provider.resultState is RestaurantSearchLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (provider.resultState is RestaurantSearchLoadedState) {
                  var restaurantList =
                      (provider.resultState as RestaurantSearchLoadedState)
                          .data;
                  return ListView.builder(
                    itemCount: restaurantList.length,
                    itemBuilder: (context, index) {
                      final restaurant = restaurantList[index];
                      return RestaurantCardWidget(
                        restaurant: restaurant,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            NavigationRoute.detailRoute.name,
                            arguments: restaurant.id,
                          );
                        },
                      );
                    },
                  );
                } else if (provider.resultState is RestaurantSearchErrorState) {
                  var message =
                      (provider.resultState as RestaurantSearchErrorState)
                          .error;
                  return Center(
                    child: Text(message),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
