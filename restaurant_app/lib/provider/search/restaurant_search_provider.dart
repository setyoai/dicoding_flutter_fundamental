import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_services.dart';
import 'package:restaurant_app/static/restaurant_search_result_state.dart';

class RestaurantSearchProvider extends ChangeNotifier {
  final ApiServices _apiServices;

  RestaurantSearchProvider(this._apiServices);

  RestaurantSearchResultState _resultState = RestaurantSearchNoneState();

  RestaurantSearchResultState get resultState => _resultState;

  Future<void> fetchRestaurantSearch(String query) async {
    try {
      _resultState = RestaurantSearchLoadingState();
      notifyListeners();

      final result = await _apiServices.searchRestaurants(query);

      if (result.error || result.restaurants.isEmpty) {
        _resultState = RestaurantSearchErrorState("No restaurants found for \"$query\"");
      } else {
        _resultState = RestaurantSearchLoadedState(result.restaurants);
      }
    } catch (e) {
      _resultState = RestaurantSearchErrorState("Failed to fetch restaurants: $e");
    } finally {
      notifyListeners();
    }
  }
}
