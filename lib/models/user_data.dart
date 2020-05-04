import 'package:hive/hive.dart';

part 'user_data.g.dart';

@HiveType(typeId: 0)
class UserData {
  UserData({
    this.bmi,
    this.colorValue,
    this.height,
    this.weight,
    this.dateRecorded,
  });
  @HiveField(0)
  double bmi;

  @HiveField(1)
  int colorValue;

  @HiveField(2)
  String height;

  @HiveField(3)
  String weight;

  @HiveField(4)
  DateTime dateRecorded;
}
