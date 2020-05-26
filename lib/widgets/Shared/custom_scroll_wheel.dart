import 'package:flutter/material.dart'
    show
        Axis,
        BuildContext,
        Colors,
        FixedExtentScrollController,
        FixedExtentScrollPhysics,
        Key,
        ListWheelChildBuilderDelegate,
        ListWheelScrollView,
        RotatedBox,
        State,
        StatefulWidget,
        Text,
        TextStyle,
        Widget,
        required;
import 'package:provider/provider.dart';

import '../../providers/calculator.dart' show Calculator;

class CircularScrollWheel extends StatefulWidget {
  const CircularScrollWheel({
    @required this.direction,
    @required this.minValue,
    @required this.maxValue,
    @required this.onValChanged,
    @required this.initialValue,
    Key key,
  }) : super(key: key);

  final Axis direction;
  final double minValue, maxValue, initialValue;

  @override
  _CircularScrollWheelState createState() => _CircularScrollWheelState();

  final Function(dynamic) onValChanged;
}

class _CircularScrollWheelState extends State<CircularScrollWheel> {
  double _currentPosition;
  FixedExtentScrollController _fixedExtentScrollController;

  @override
  void initState() {
    _currentPosition = widget.initialValue;
    _fixedExtentScrollController = FixedExtentScrollController(
      initialItem: _currentPosition.toInt(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _isMale = context.select<Calculator, bool>((value) => value.isMale);
    return RotatedBox(
      quarterTurns: widget.direction == Axis.horizontal ? 3 : 0,
      child: ListWheelScrollView.useDelegate(
        itemExtent: widget.direction == Axis.horizontal ? 23 : 48,
        overAndUnderCenterOpacity: .75,
        physics: const FixedExtentScrollPhysics(),
        controller: _fixedExtentScrollController,
        perspective: 0.0099,
        onSelectedItemChanged: (value) {
          _currentPosition = value.toDouble();
          widget.onValChanged(_currentPosition + widget.minValue);
        },
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) => RotatedBox(
            quarterTurns: widget.direction == Axis.horizontal ? 1 : 0,
            child: Text(
              '${(widget.minValue + index).toInt()}',
              style: TextStyle(
                color: index == _currentPosition
                    ? _isMale ? Colors.lightBlueAccent : Colors.pinkAccent
                    : Colors.white,
              ),
            ),
          ),
          childCount: (widget.maxValue + 1 - widget.minValue).toInt(),
        ),
      ),
    );
  }
}
