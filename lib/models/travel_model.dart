import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'travel_model.g.dart';

@HiveType(typeId: 0)
class TravelModel {
  @HiveField(0)
  final String country;
  @HiveField(1)
  final String type;
  @HiveField(2)
  final DateTime date;
  @HiveField(3)
  final String fellowPerson;
  @HiveField(4)
  final String comment;

  TravelModel(
      {required this.country,
      required this.type,
      required this.date,
      required this.fellowPerson,
      required this.comment});
}
