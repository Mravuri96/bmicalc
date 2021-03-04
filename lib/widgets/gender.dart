import 'package:flutter/material.dart'
    show
        BorderRadius,
        BuildContext,
        Card,
        Color,
        Colors,
        Column,
        EdgeInsets,
        ElevatedButton,
        Expanded,
        Icon,
        Key,
        MainAxisAlignment,
        Padding,
        RoundedRectangleBorder,
        Row,
        StatelessWidget,
        Text,
        TextStyle,
        Widget;
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart' show FontAwesome5Solid;
import 'package:provider/provider.dart';

import '../providers/calculator.dart' show Calculator;

class GenderRow extends StatelessWidget {
  const GenderRow({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _settings = context.watch<Calculator>();
    return Row(
      children: <Widget>[
        Expanded(
          child: Card(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF1D1F33),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                onSurface: Colors.lightBlueAccent,
              ),
              onPressed: () {
                _settings.updateIsMale(x: true);
              },
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
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF1D1F33),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                onSurface: Colors.lightBlueAccent,
              ),
              onPressed: () {
                _settings.updateIsMale(x: false);
              },
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
