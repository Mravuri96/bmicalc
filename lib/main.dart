import 'package:BmiCalc/models/UserData.dart';
import 'package:BmiCalc/providers/Calculator.dart';
import 'package:BmiCalc/screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(
    UserDataAdapter(),
  );
  await Hive.openBox<UserData>(
    'UserData',
    crashRecovery: true,
  );
  await Hive.openBox(
    'settings',
    crashRecovery: true,
  );
  runApp(
    ChangeNotifierProvider(
      create: (_) => Calculator(),
      child: HomePage(),
      lazy: true,
    ),
  );
}
