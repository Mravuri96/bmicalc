import 'package:BmiCalcSource/screens/Records.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(
        left: 4,
        right: 4,
        bottom: 4,
      ),
      sliver: SliverAppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        backgroundColor: const Color(0xcFF1D2033),
        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              MaterialCommunityIcons.view_list,
              color: Colors.white,
            ),
            onPressed: () async => await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Records(),
                maintainState: true,
                fullscreenDialog: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
