import 'package:BmiCalculator/models/UserData.dart';
import 'package:BmiCalculator/providers/Calculator.dart';
import 'package:BmiCalculator/screens/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter()
      .whenComplete(
        () async => await Hive.openBox<UserData>(
          'UserData',
          crashRecovery: true,
          encryptionKey: Hive.generateSecureKey(),
        ),
      )
      .whenComplete(
        () async => Hive.openBox(
          'settings',
          crashRecovery: true,
        ),
      )
      .whenComplete(
        () => Hive.registerAdapter(
          UserDataAdapter(),
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
