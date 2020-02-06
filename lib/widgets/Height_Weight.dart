import 'package:BmiCalcSource/providers/Calculator.dart';
import 'package:BmiCalcSource/widgets/Shared/CustomScrollWheel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeightWeight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Calculator>(
      builder: (_, value, __) =>
          value.isMetric ? MetricMeasurements() : ImperialMeasurements(),
    );
  }
}

class MetricMeasurements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Expanded>[
        Expanded(
          flex: 1,
          child: Card(
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'KG',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                CircularScrollWheel(
                    direction: Axis.vertical,
                    onValChanged: (val) =>
                        Provider.of<Calculator>(context, listen: false)
                            .updateKg(
                          val,
                        ),
                    maxValue: 300,
                    minValue: 0,
                    initialValue:
                        Provider.of<Calculator>(context, listen: true).kg),
              ],
            ),
          ),
        ),
        Expanded(
          child: Card(
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'CM',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                CircularScrollWheel(
                  direction: Axis.vertical,
                  initialValue: Provider.of<Calculator>(
                    context,
                    listen: true,
                  ).centimeters,
                  minValue: 0,
                  maxValue: 300,
                  onValChanged: (val) =>
                      Provider.of<Calculator>(context, listen: false)
                          .updateCentimeters(
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
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Expanded>[
        Expanded(
          flex: 1,
          child: Card(
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'LB',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                CircularScrollWheel(
                  direction: Axis.vertical,
                  initialValue: Provider.of<Calculator>(
                    context,
                    listen: true,
                  ).lb,
                  onValChanged: (val) =>
                      Provider.of<Calculator>(context, listen: false).updateLB(
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'FEET',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      CircularScrollWheel(
                        direction: Axis.horizontal,
                        initialValue: Provider.of<Calculator>(
                          context,
                          listen: true,
                        ).feet,
                        minValue: 0,
                        maxValue: 12,
                        onValChanged: (val) =>
                            Provider.of<Calculator>(context, listen: false)
                                .updateFeet(
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
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
                        initialValue: Provider.of<Calculator>(
                          context,
                          listen: true,
                        ).inches,
                        onValChanged: (val) =>
                            Provider.of<Calculator>(context, listen: false)
                                .updateInches(
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
