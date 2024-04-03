part of 'travel_bloc.dart';

@immutable
abstract class TravelEvent {}

class GetAllTravelsEvent extends TravelEvent {}

class AddTravelEvent extends TravelEvent {
  final TravelModel travel;

  AddTravelEvent({required this.travel});
}

class DeleteTravelEvent extends TravelEvent {
  final TravelModel travel;

  DeleteTravelEvent({required this.travel});
}