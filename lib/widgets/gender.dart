import 'package:flutter/material.dart'
    show
        BorderRadius,
        BuildContext,
        Card,
        Color,
        Colors,
        Column,
        EdgeInsets,
        Expanded,
        Icon,
        Key,
        MainAxisAlignment,
        Padding,
        RaisedButton,
        RoundedRectangleBorder,
        Row,
        StatelessWidget,
        Text,
        TextStyle,
        Widget;
import 'package:flutter_icons/flutter_icons.dart' show FontAwesome5Solid;
import 'package:provider/provider.dart' show Provider;

import '../providers/calculator.dart' show Calculator;

class GenderRow extends StatelessWidget {
  const GenderRow({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _settings = Provider.of<Calculator>(context);
    return Row(
      children: <Widget>[
        Expanded(
          child: Card(
            child: RaisedButton(
              splashColor: Colors.lightBlueAccent,
              color: const Color(0xFF1D2033),
              onPressed: () {
                _settings.updateIsMale(x: true);
                // _settings.updateAppColor(
                //   Colors.lightBlueAccent,
                // );
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding: const EdgeInsets.all(32),
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
              color: const Color(0xFF1D2033),
              onPressed: () {
                _settings.updateIsMale(x: false);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding: const EdgeInsets.all(32),
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
