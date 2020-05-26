import 'package:flutter/material.dart' show WidgetsFlutterBinding, runApp;
import 'package:hive/hive.dart' show Hive;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'models/user_data.dart' show UserData, UserDataAdapter;
import 'providers/calculator.dart' show Calculator;
import 'screens/home_page.dart' show HomePage;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter('BmiCalc');
  Hive.registerAdapter(
    UserDataAdapter(),
  );
  await Hive.openBox<UserData>(
    'userdata',
  );
  runApp(
    ChangeNotifierProvider(
      create: (_) => Calculator(),
      lazy: false,
      child: const HomePage(),
    ),
  );
}
