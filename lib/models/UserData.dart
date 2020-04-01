import 'package:hive/hive.dart';

part 'UserData.g.dart';

@HiveType(typeId: 0)
class UserData {
  @HiveField(0)
  final double bmi;

  @HiveField(1)
  final int colorValue;

  @HiveField(2)
  final String height;

  @HiveField(3)
  final String weight;

  @HiveField(4)
  final DateTime dateRecorded;

  UserData({
    this.bmi,
    this.colorValue,
    this.height,
    this.weight,
    this.dateRecorded,
  });
}
