import 'package:flutter/material.dart'
    show
        AlertDialog,
        BorderRadius,
        BuildContext,
        Card,
        Center,
        Color,
        Colors,
        Column,
        Divider,
        FlatButton,
        InkWell,
        Key,
        ListTile,
        MaterialPageRoute,
        Navigator,
        RaisedButton,
        RoundedRectangleBorder,
        SingleChildScrollView,
        StatelessWidget,
        Text,
        TextStyle,
        Widget,
        showDialog;
import 'package:hive/hive.dart' show Hive;
import 'package:provider/provider.dart';

import '../models/user_data.dart' show UserData;
import '../providers/calculator.dart' show Calculator;
import '../screens/records.dart' show Records;

class CalculateButton extends StatelessWidget {
  const CalculateButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cal = context.watch<Calculator>();
    return InkWell(
      splashColor: cal.isMale ? Colors.lightBlueAccent : Colors.pinkAccent,
      onTap: () => cal.isMetric
          ? context.read<Calculator>().calculateKgBmi()
          : context.read<Calculator>().calculateLbBmi(),
      child: Card(
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          color: const Color(0xFF1D2033),
          onPressed: () => showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor:
                  cal.isMale ? Colors.lightBlueAccent : Colors.pinkAccent,
              title: const Center(
                child: Text(
                  'Your Body Mass Index',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              content:
                  // const Text(
                  //   'Your Bmi',
                  //   style: const TextStyle(
                  //     fontFamily: 'Raleway',
                  //   ),
                  // ),
                  SingleChildScrollView(
                child: Card(
                  color: const Color(0xFF1D1F33),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Center(
                          child: cal.isMetric
                              ? Text(
                                  cal
                                      .calculateKgBmi()
                                      .toString()
                                      .substring(0, 5),
                                  textScaleFactor: 2,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                )
                              : Text(
                                  cal
                                      .calculateLbBmi()
                                      .toString()
                                      .substring(0, 5),
                                  textScaleFactor: 2,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
                      const Divider(
                        color: Colors.white,
                        endIndent: 5,
                        indent: 5,
                      ),
                      const ListTile(
                        leading: Text(
                          'Underweight',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        trailing: Text(
                          '< 18.4',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const ListTile(
                        leading: Text(
                          'Normal',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        trailing: Text(
                          '18.5 - 24.9',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const ListTile(
                        leading: Text(
                          'OverWeight',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        trailing: Text(
                          '25 - 29.9',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const ListTile(
                        leading: Text(
                          'Obese',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        trailing: Text(
                          '> 30',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              actions: <Widget>[
                RaisedButton(
                  color: const Color(0xFF1D1F33),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                    ),
                  ),
                ),
                RaisedButton(
                  color: const Color(0xFF1D1F33),
                  onPressed: () async {
                    final _recordedTime = DateTime.now();
                    await Hive.box<UserData>('userdata').add(
                      // Hive.lazyBox<UserData>('userdata').length,
                      cal.isMetric
                          ? UserData(
                              bmi: cal.calculateKgBmi(),
                              colorValue: cal.isMale
                                  ? Colors.lightBlueAccent.value
                                  : Colors.pinkAccent.value,
                              // : cal.appColor.value,
                              height: '${cal.centimeters} Cm',
                              weight: '${cal.kg} Kg',
                              dateRecorded: _recordedTime,
                            )
                          : UserData(
                              bmi: cal.calculateLbBmi(),
                              colorValue: cal.isMale
                                  ? Colors.lightBlueAccent.value
                                  : Colors.pinkAccent.value,
                              // : cal.appColor.value,
                              height: '${cal.feet} Ft ${cal.inches} In',
                              weight: '${cal.lb} Lb',
                              dateRecorded: _recordedTime,
                            ),
                    );

                    Navigator.pop(context);
                    // cal.isSmallScreen
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Records(),
                        maintainState: true,
                        fullscreenDialog: true,
                      ),
                    );
                    // : null;
                  },
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                    ),
                  ),
                ),
              ],
            ),
          ),
          child: const Text(
            'CALCULATE',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
