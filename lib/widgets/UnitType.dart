import 'package:BmiCalc/providers/Calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

class UnitTypeSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
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
        index == 0 ? val.updateIsMetric(true) : val.updateIsMetric(false);
      },
      children: <Widget>[
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
