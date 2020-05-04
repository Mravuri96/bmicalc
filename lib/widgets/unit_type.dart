import 'package:flutter/material.dart'
    show
        BuildContext,
        Card,
        Colors,
        Icon,
        Key,
        ListTile,
        StatelessWidget,
        Text,
        TextStyle,
        ToggleButtons,
        Widget;
import 'package:flutter_icons/flutter_icons.dart' show MaterialCommunityIcons;
import 'package:provider/provider.dart' show Provider;

import '../providers/calculator.dart' show Calculator;

class UnitTypeSelector extends StatelessWidget {
  const UnitTypeSelector({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: ListTile(
        leading: Icon(
          MaterialCommunityIcons.scale_bathroom,
          color: Colors.white,
        ),
        title: Text(
          'Weight',
          style: TextStyle(color: Colors.white),
        ),
        trailing: WeightSelector(),
      ),
    );
  }
}

class WeightSelector extends StatelessWidget {
  const WeightSelector({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final val = Provider.of<Calculator>(context);
    return ToggleButtons(
      isSelected: val.units,
      selectedColor: val.isMale ? Colors.lightBlueAccent : Colors.pinkAccent,
      onPressed: (index) {
        val.updateUnitMeasuremensts([
          false,
          false,
        ]);
        val.units[index] = !val.units[index];
        index == 0 ? val.updateIsMetric(x: true) : val.updateIsMetric(x: false);
      },
      children: const <Widget>[
        Icon(
          MaterialCommunityIcons.weight_kilogram,
        ),
        Icon(
          MaterialCommunityIcons.weight_pound,
        ),
      ],
    );
  }
}
