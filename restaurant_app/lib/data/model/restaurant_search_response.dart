import 'package:restaurant_app/data/model/restaurant.dart';

class RestaurantSearchResponse {
  final bool error;
  final int founded;
  final List<Restaurant> restaurants;

  RestaurantSearchResponse({
    required this.error,
    required this.founded,
    required this.restaurants,
  });

  factory RestaurantSearchResponse.fromJson(Map<String, dynamic> json) {
    return RestaurantSearchResponse(
      error: json["error"] ?? false, // Default to false if null
      founded: json["count"] ?? 0, // Default to 0 if null
      restaurants: json["restaurants"] != null
          ? List<Restaurant>.from(
              json["restaurants"]!.map((x) => Restaurant.fromJson(x)))
          : <Restaurant>[], // Empty list if null
    );
  }
}
