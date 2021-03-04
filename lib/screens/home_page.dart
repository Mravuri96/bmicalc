import 'package:flutter/material.dart'
    show
        AppBarTheme,
        BoxConstraints,
        BuildContext,
        Center,
        Color,
        Colors,
        Column,
        ConstrainedBox,
        Expanded,
        Key,
        MaterialApp,
        SafeArea,
        Scaffold,
        SizedBox,
        StatelessWidget,
        ThemeData,
        ToggleButtonsThemeData,
        VisualDensity,
        Widget;

import '../widgets/app_bar.dart' show CustomSliverAppBar;
import '../widgets/bottom_app_bar.dart' show CalculateButton;
import '../widgets/gender.dart' show GenderRow;
import '../widgets/height_weight.dart' show HeightWeight;
import '../widgets/unit_type.dart' show UnitTypeSelector;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          cardColor: const Color(0xFF1D2033),
          appBarTheme: const AppBarTheme(
            color: Color(0xFF0A0c21),
          ),
          toggleButtonsTheme: const ToggleButtonsThemeData(
            color: Colors.white,
          ),
          bottomAppBarColor: const Color(0xFF1D2033),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const HomePageContent(),
      );
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0C21),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 760,
              minWidth: 350,
            ),
            child: Column(
              children: const <Widget>[
                CustomSliverAppBar(),
                GenderRow(),
                UnitTypeSelector(),
                Expanded(
                  child: HeightWeight(),
                ),
                SizedBox(
                  height: 64,
                  width: 760,
                  child: CalculateButton(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
