import 'package:tourism_app/data/model/tourism.dart';

sealed class TourismDetailResultState {}

class TourismListNoneState extends TourismDetailResultState {}

class TourismListLoadingState extends TourismDetailResultState {}

class TourismListErrorState extends TourismDetailResultState {
  final String error;

  TourismListErrorState(this.error);
}

class TourismListLoadedState extends TourismDetailResultState {
  final List<Tourism> data;

  TourismListLoadedState(this.data);
}