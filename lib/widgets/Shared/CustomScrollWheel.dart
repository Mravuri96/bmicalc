import 'package:BmiCalcSource/providers/Calculator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  final num minValue, maxValue, initialValue;

  @override
  _CircularScrollWheelState createState() => _CircularScrollWheelState();

  final Function(dynamic) onValChanged;
}

class _CircularScrollWheelState extends State<CircularScrollWheel> {
  num _currentPosition;
  FixedExtentScrollController _fixedExtentScrollController;

  @override
  void initState() {
    _currentPosition = widget.initialValue;
    _fixedExtentScrollController = FixedExtentScrollController(
      initialItem: _currentPosition,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _settings = Provider.of<Calculator>(context, listen: true);
    return RotatedBox(
      quarterTurns: widget.direction == Axis.horizontal ? 3 : 0,
      child: ListWheelScrollView.useDelegate(
        itemExtent: widget.direction == Axis.horizontal ? 23 : 48,
        overAndUnderCenterOpacity: .75,
        physics: const FixedExtentScrollPhysics(),
        controller: _fixedExtentScrollController,
        clipToSize: true,
        perspective: 0.0099,
        onSelectedItemChanged: (value) {
          _currentPosition = value;
          widget.onValChanged(_currentPosition + widget.minValue);
        },
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (_, index) => RotatedBox(
            quarterTurns: widget.direction == Axis.horizontal ? 1 : 0,
            child: Text(
              '${widget.minValue + index}',
              style: TextStyle(
                color: index == _currentPosition
                    ? _settings.isMale
                        ? Colors.lightBlueAccent
                        : Colors.pinkAccent
                    : Colors.white,
              ),
            ),
          ),
          childCount: widget.maxValue + 1 - widget.minValue,
        ),
      ),
    );
  }
}
