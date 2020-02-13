import 'package:BmiCalcSource/models/UserData.dart';
import 'package:BmiCalcSource/providers/Calculator.dart';
import 'package:BmiCalcSource/screens/Records.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Calculator cal = Provider.of<Calculator>(
      context,
      listen: true,
    );
    return InkWell(
      splashColor: cal.isMale ? Colors.lightBlueAccent : Colors.pinkAccent,
      onTap: () => cal.isMetric
          ? Provider.of<Calculator>(
              context,
              listen: false,
            ).calculateKgBmi()
          : Provider.of<Calculator>(
              context,
              listen: false,
            ).calculateLbBmi(),
      child: Card(
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          color: const Color(0xcFF1D2033),
          onPressed: () => showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor:
                  cal.isMale ? Colors.lightBlueAccent : Colors.pinkAccent,
              title: Center(
                child: const Text(
                  'Your Body Mass Index',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              content:
                  // const Text(
                  //   'Your Bmi',
                  //   style: TextStyle(
                  //     fontFamily: 'Raleway',
                  //   ),
                  // ),
                  Container(
                child: SingleChildScrollView(
                  child: Card(
                    color: Color(0xcFF1D1F33),
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
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Montserrat-regular',
                                    ),
                                  )
                                : Text(
                                    cal
                                        .calculateLbBmi()
                                        .toString()
                                        .substring(0, 5),
                                    textScaleFactor: 2,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Montserrat-regular',
                                    ),
                                  ),
                          ),
                        ),
                        Divider(
                          color: Colors.white,
                          endIndent: 5,
                          indent: 5,
                        ),
                        ListTile(
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
                              fontFamily: 'Montserrat-regular',
                            ),
                          ),
                        ),
                        ListTile(
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
                              fontFamily: 'Montserrat-regular',
                            ),
                          ),
                        ),
                        ListTile(
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
                              fontFamily: 'Montserrat-regular',
                            ),
                          ),
                        ),
                        ListTile(
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
                              fontFamily: 'Montserrat-regular',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              actions: <Widget>[
                RaisedButton(
                  color: Color(0xcFF1D1F33),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                RaisedButton(
                  color: Color(0xcFF1D1F33),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                    ),
                  ),
                  onPressed: () async {
                    final DateTime _recordedTime = DateTime.now();
                    await Hive.box<UserData>('UserData').add(
                      // Hive.lazyBox<UserData>('UserData').length,
                      cal.isMetric
                          ? UserData(
                              cal.calculateKgBmi(),
                              cal.isMale
                                  ? Colors.lightBlueAccent.value
                                  : Colors.pinkAccent.value,
                              // : cal.appColor.value,
                              '${cal.centimeters} Cm',
                              '${cal.kg} Kg',
                              _recordedTime,
                            )
                          : UserData(
                              cal.calculateLbBmi(),
                              cal.isMale
                                  ? Colors.lightBlueAccent.value
                                  : Colors.pinkAccent.value,
                              // : cal.appColor.value,
                              '${cal.feet} Ft ${cal.inches} In',
                              '${cal.lb} Lb',
                              _recordedTime,
                            ),
                    );

                    Navigator.pop(context);
                    // cal.isSmallScreen
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Records(),
                        maintainState: true,
                        fullscreenDialog: true,
                      ),
                    );
                    // : null;
                  },
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
