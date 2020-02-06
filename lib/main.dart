import 'package:BmiCalcSource/models/UserData.dart';
import 'package:BmiCalcSource/providers/Calculator.dart';
import 'package:BmiCalcSource/screens/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter()
      .whenComplete(
        () => Hive.registerAdapter(
          UserDataAdapter(),
        ),
      )
      .whenComplete(
        () async => await Hive.openBox<UserData>(
          'UserData',
          crashRecovery: true,
        ),
      )
      .whenComplete(
        () async => Hive.openBox(
          'settings',
          crashRecovery: true,
        ),
      );
  runApp(
    ChangeNotifierProvider(
      create: (_) => Calculator(),
      child: HomePage(),
      lazy: true,
    ),
  );
}
