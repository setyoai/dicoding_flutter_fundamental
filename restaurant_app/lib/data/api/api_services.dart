import 'dart:convert';
import 'dart:io';
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
        try {
         return RestaurantListResponse.fromJson(jsonDecode(response.body));
        } catch (e) {
          throw Exception('Invalid data, try again later.');
        }
      } else {
        throw Exception(
            'Failed to load restaurant list. Please try again later.');
      }
    } on SocketException {
      throw Exception(
          'There is no internet connection. Check your network and try again.');
    } catch (e) {
      throw Exception('An error occurred. Please try again later.');
    }
  }

  /// Get restaurant detail by ID
  Future<RestaurantDetailResponse> getRestaurantDetail(String id) async {
    try {
      final uri = Uri.parse("$_baseUrl/detail/$id");
      final response = await http.get(uri);

     if (response.statusCode == 200) {
        try {
         return RestaurantDetailResponse.fromJson(jsonDecode(response.body));
        } catch (e) {
          throw Exception('Invalid data, try again later.');
        }
      } else {
        throw Exception(
            'Failed to load restaurant list. Please try again later.');
      }
    } on SocketException {
      throw Exception(
          'There is no internet connection. Check your network and try again.');
    } catch (e) {
      throw Exception('An error occurred. Please try again later.');
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
        throw Exception(
            'Failed to load restaurant data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching restaurant data: $e');
    }
  }
}
