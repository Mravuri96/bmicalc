import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'models/user_data.dart';
import 'providers/calculator.dart';
import 'screens/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter('BmiCalc');
  Hive.registerAdapter(
    UserDataAdapter(),
  );
  await Hive.openBox<UserData>(
    'userdata',
  );
  // await Hive.openBox(
  //   'settings',
  //   crashRecovery: true,
  // );
  runApp(
    ChangeNotifierProvider(
      create: (_) => Calculator(),
      lazy: false,
      child: const HomePage(),
    ),
  );
}
