import 'package:flutter/material.dart'
    show
        AppBar,
        BorderRadius,
        BuildContext,
        Color,
        Colors,
        EdgeInsets,
        Icon,
        IconButton,
        Key,
        MaterialPageRoute,
        Navigator,
        Padding,
        RoundedRectangleBorder,
        StatelessWidget,
        Text,
        TextStyle,
        Widget;
import 'package:flutter_icons/flutter_icons.dart' show MaterialCommunityIcons;

import '../screens/records.dart' show Records;

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 4,
        right: 4,
        bottom: 4,
      ),
      child: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        backgroundColor: const Color(0xFF1D2033),
        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              MaterialCommunityIcons.view_list,
              color: Colors.white,
            ),
            onPressed: () async => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Records(),
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
