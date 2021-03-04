import 'package:flutter/material.dart'
    show
        Alignment,
        Axis,
        BuildContext,
        Card,
        Colors,
        Column,
        EdgeInsets,
        Expanded,
        Key,
        Padding,
        Row,
        Stack,
        StatelessWidget,
        Text,
        TextStyle,
        Widget;
import 'package:provider/provider.dart';

import '../providers/calculator.dart' show Calculator;
import 'Shared/custom_scroll_wheel.dart' show CircularScrollWheel;

class HeightWeight extends StatelessWidget {
  const HeightWeight({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<Calculator>(
      builder: (_, value, __) => value.isMetric
          ? const MetricMeasurements()
          : const ImperialMeasurements(),
    );
  }
}

class MetricMeasurements extends StatelessWidget {
  const MetricMeasurements({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Expanded>[
        Expanded(
          child: Card(
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'KG',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                CircularScrollWheel(
                  direction: Axis.vertical,
                  onValChanged: (val) => context.read<Calculator>().updateKg(
                        val,
                      ),
                  maxValue: 300,
                  minValue: 0,
                  initialValue: context.select<Calculator, double>(
                    (value) => value.kg,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Card(
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'CM',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                CircularScrollWheel(
                  direction: Axis.vertical,
                  initialValue: context.select<Calculator, double>(
                    (value) => value.centimeters,
                  ),
                  minValue: 0,
                  maxValue: 300,
                  onValChanged: (val) =>
                      context.read<Calculator>().updateCentimeters(
                            val,
                          ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ImperialMeasurements extends StatelessWidget {
  const ImperialMeasurements({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Expanded>[
        Expanded(
          child: Card(
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'LB',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                CircularScrollWheel(
                  direction: Axis.vertical,
                  initialValue: context.select<Calculator, double>(
                    (value) => value.lb,
                  ),
                  onValChanged: (val) => context.read<Calculator>().updateLB(
                        val,
                      ),
                  maxValue: 300,
                  minValue: 0,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Card(
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          'FEET',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      CircularScrollWheel(
                        direction: Axis.horizontal,
                        initialValue: context.select<Calculator, double>(
                          (value) => value.feet,
                        ),
                        minValue: 0,
                        maxValue: 12,
                        onValChanged: (val) =>
                            context.read<Calculator>().updateFeet(
                                  val,
                                ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          'INCHES',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      CircularScrollWheel(
                        direction: Axis.horizontal,
                        maxValue: 11,
                        initialValue: context.select<Calculator, double>(
                            (value) => value.inches),
                        onValChanged: (val) =>
                            context.read<Calculator>().updateInches(
                                  val,
                                ),
                        minValue: 0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
