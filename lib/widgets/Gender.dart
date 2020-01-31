import 'package:BmiCalculator/providers/Calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

class GenderRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _settings = Provider.of<Calculator>(context);
    return Row(
      children: <Widget>[
        Expanded(
          child: Card(
            child: RaisedButton(
              splashColor: Colors.lightBlueAccent,
              color: Color(0xcFF1D2033),
              onPressed: () {
                _settings.updateIsMale(true);
                // _settings.updateAppColor(
                //   Colors.lightBlueAccent,
                // );
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(
                      FontAwesome5Solid.mars,
                      size: 100,
                      color: _settings.isMale
                          ? Colors.lightBlueAccent
                          : Colors.white,
                    ),
                    const Text(
                      'MALE',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Card(
            child: RaisedButton(
              splashColor: Colors.pinkAccent,
              color: Color(0xcFF1D2033),
              onPressed: () {
                _settings.updateIsMale(false);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: <Widget>[
                    Icon(
                      FontAwesome5Solid.venus,
                      size: 100,
                      color:
                          _settings.isMale ? Colors.white : Colors.pinkAccent,
                    ),
                    const Text(
                      'FEMALE',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
