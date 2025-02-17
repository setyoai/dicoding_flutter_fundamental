import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restaurant_app/data/model/restaurant_detail_response.dart';
import 'package:restaurant_app/data/model/restaurant_list_response.dart';
import 'package:restaurant_app/data/model/restaurant_search_response.dart';

class ApiServices {
   static const String _baseUrl = "https://restaurant-api.dicoding.dev";

  /// Get list of restaurants
  Future<RestaurantListResponse> getRestaurantList() async {
    try {
      final uri = Uri.parse("$_baseUrl/list");
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        return RestaurantListResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load restaurant list: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching restaurant list: $e');
    }
  }

  /// Get restaurant detail by ID
  Future<RestaurantDetailResponse> getRestaurantDetail(String id) async {
    try {
      final uri = Uri.parse("$_baseUrl/detail/$id");
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        return RestaurantDetailResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load restaurant detail: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching restaurant detail: $e');
    }
  }

  /// Search for restaurants
  Future<RestaurantSearchResponse> searchRestaurants(String query) async {
    try {
      final uri = Uri.parse('$_baseUrl/search?q=$query');
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        return RestaurantSearchResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load restaurant data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching restaurant data: $e');
    }
  }
}
