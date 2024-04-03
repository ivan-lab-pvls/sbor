import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:travel_planner_app/models/travel_model.dart';

part 'travel_event.dart';
part 'travel_state.dart';

class TravelBloc extends Bloc<TravelEvent, TravelState> {
  TravelBloc() : super(TravelInitial()) {
    on<GetAllTravelsEvent>(_GetAllTravelsHandler);
    on<AddTravelEvent>(_addTravelHandler);
    on<DeleteTravelEvent>(_deleteTravelHandler);
  }

  void _GetAllTravelsHandler(
      GetAllTravelsEvent event, Emitter<TravelState> emit) async {
    List<TravelModel> travels = [];

    final travelBox = Hive.box('travels');

    if (travelBox.isNotEmpty) {
      for (int i = 0; i < travelBox.length; i++) {
        travels.add(travelBox.getAt(i));
      }

      emit(LoadedAllTravelsState(
          travels: travels.reversed.toList()));
    } else {
      emit(EmptyTravelsListState());
    }
  }

  void _addTravelHandler(
      AddTravelEvent event, Emitter<TravelState> emit) async {
    final travelBox = Hive.box('travels');
    travelBox.add(event.travel);
  }

  void _deleteTravelHandler(
      DeleteTravelEvent event, Emitter<TravelState> emit) async {

    List<TravelModel> travels = [];

    final travelBox = Hive.box('travels');

    if (travelBox.isNotEmpty) {
      for (int i = 0; i < travelBox.length; i++) {
        travels.add(travelBox.getAt(i));
      }

      final int _foundIndex = travels.indexOf(event.travel);
      travelBox.deleteAt(_foundIndex);
    }
  }
}
