import 'package:BmiCalc/widgets/AppBar.dart';
import 'package:BmiCalc/widgets/BottomAppBar.dart';
import 'package:BmiCalc/widgets/Gender.dart';
import 'package:BmiCalc/widgets/Height_Weight.dart';
import 'package:BmiCalc/widgets/UnitType.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        themeMode: ThemeMode.system,
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          cardColor: const Color(0xcFF1D2033),
          appBarTheme: AppBarTheme(
            color: const Color(0xcFF0A0c21),
          ),
          toggleButtonsTheme: ToggleButtonsThemeData(
            color: Colors.white,
          ),
          bottomAppBarColor: const Color(0xcFF1D2033),
        ),
        home: HomePageContent(),
      );
}

class HomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xcFF0A0C21),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 760,
              minWidth: 350,
            ),
            child: CustomScrollView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              slivers: <Widget>[
                CustomSliverAppBar(),
                SliverToBoxAdapter(
                  child: GenderRow(),
                ),
                SliverToBoxAdapter(
                  child: UnitTypeSelector(),
                ),
                SliverFillRemaining(
                  hasScrollBody: true,
                  child: HeightWeight(),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CalculateButton(),
    );
  }
}
