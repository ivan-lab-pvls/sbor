part of 'travel_bloc.dart';

@immutable
abstract class TravelState {}

class TravelInitial extends TravelState {}

class LoadedAllTravelsState extends TravelState {
  final List<TravelModel> travels;

  LoadedAllTravelsState({required this.travels});
}

class EmptyTravelsListState extends TravelState {}
