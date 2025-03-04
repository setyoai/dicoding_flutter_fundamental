import 'package:mocktail/mocktail.dart';
import 'package:restaurant_app/data/api/api_services.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/data/model/restaurant_list_response.dart';
import 'package:restaurant_app/provider/home/restaurant_list_provider.dart';
import 'package:restaurant_app/static/restaurant_list_result_state.dart';
import 'package:test/test.dart';

class MockApiServices extends Mock implements ApiServices {}

void main() {
  late MockApiServices mockApiServices;
  late RestaurantListProvider restaurantListProvider;

  setUpAll(() {
    registerFallbackValue(Uri());
  });

  setUp(() {
    mockApiServices = MockApiServices();
    restaurantListProvider = RestaurantListProvider(mockApiServices);
  });

  group("restaurant list provider", () {
    test('Initial state should be RestaurantListInitial', () {
      expect(
          restaurantListProvider.resultState, isA<RestaurantListNoneState>());
    });

    test('Should return restaurant list when API call is successful', () async {
      final mockResult = RestaurantListResponse(
        error: false,
        message: 'Success',
        count: 2,
        restaurants: [
          Restaurant(
            id: '1',
            name: 'Restaurant 1',
            description: 'Description 1',
            pictureId: '1',
            city: 'City 1',
            rating: 3.0,
          ),
          Restaurant(
            id: '2',
            name: 'Restaurant 2',
            description: 'Description 2',
            pictureId: '2',
            city: 'City 2',
            rating: 4.0,
          ),
        ],
      );

      when(() => mockApiServices.getRestaurantList())
          .thenAnswer((_) async => mockResult);

      await restaurantListProvider.fetchRestaurantList();

      expect(
          restaurantListProvider.resultState, isA<RestaurantListLoadedState>());
      final state =
          restaurantListProvider.resultState as RestaurantListLoadedState;
      expect(state.data.length, 2);
    });

    test('Should return error when API call fails', () async {
      final mockResult = RestaurantListResponse(
        error: true,
        message: 'Error fetching data',
        count: 0,
        restaurants: [],
      );

      when(() => mockApiServices.getRestaurantList())
          .thenAnswer((_) async => mockResult);

      await restaurantListProvider.fetchRestaurantList();

      expect(
          restaurantListProvider.resultState, isA<RestaurantListErrorState>());
      final state =
          restaurantListProvider.resultState as RestaurantListErrorState;
      expect(state.error, 'Error fetching data');

      verify(() => mockApiServices.getRestaurantList()).called(1);
    });

    test('Should return error when API throws an exception', () async {
      when(() => mockApiServices.getRestaurantList())
          .thenThrow(Exception("Network error"));

      await restaurantListProvider.fetchRestaurantList();

      expect(
          restaurantListProvider.resultState, isA<RestaurantListErrorState>());

      final state =
          restaurantListProvider.resultState as RestaurantListErrorState;
      expect(state.error, contains("Network error"));

      verify(() => mockApiServices.getRestaurantList()).called(1);
    });
    
  });
}
