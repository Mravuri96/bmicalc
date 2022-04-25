import 'package:flutter/material.dart'
    show
        AlertDialog,
        Align,
        Alignment,
        AppBar,
        BouncingScrollPhysics,
        BoxConstraints,
        BuildContext,
        Card,
        Center,
        Color,
        Colors,
        ConstrainedBox,
        Container,
        Dismissible,
        EdgeInsets,
        ElevatedButton,
        ExpansionTile,
        Icon,
        IconButton,
        Icons,
        Key,
        ListTile,
        ListView,
        Navigator,
        Padding,
        Scaffold,
        Scrollbar,
        Shadow,
        StatelessWidget,
        Text,
        TextStyle,
        ValueKey,
        ValueListenableBuilder,
        Widget,
        showDialog;
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_font_icons/flutter_font_icons.dart'
    show FontAwesome5Solid, MaterialCommunityIcons;
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart'
    show
        AnimationConfiguration,
        AnimationLimiter,
        FadeInAnimation,
        ScaleAnimation,
        SlideAnimation;
import 'package:hive/hive.dart' show Box, Hive;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart' show DateFormat;

import '../models/user_data.dart' show UserData;

class Records extends StatelessWidget {
  const Records({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFF0A0C21),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () async {
              Navigator.pop(context);
            },
            tooltip: 'Go back',
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.clear_all,
                color: Colors.white,
              ),
              tooltip: 'Clear all Items',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: const Color(0xFF0A0c21),
                    title: const Text(
                      'Warning',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    content: const Text(
                      'This will remove all bmi records \nthis action is irreversable.',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    actions: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF1D1F33),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF1D1F33),
                        ),
                        onPressed: () async {
                          await Hive.box<UserData>('userdata').clear();
                          // await _bannerAd?.dispose();
                          // _bannerAd = null;
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Confirm',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 760,
              minWidth: 350,
            ),
            child: ValueListenableBuilder(
              valueListenable: Hive.box<UserData>('userdata').listenable(),
              builder: (BuildContext context, Box<UserData> value, _) {
                return value.isEmpty
                    ? Container(
                        color: const Color(0xFF0A0C21),
                        child: const Center(
                          child: Text(
                            "It's empty in here . . . .",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    : Container(
                        color: const Color(0xFF0A0C21),
                        child: AnimationLimiter(
                          child: Scrollbar(
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: value.length,
                              itemBuilder: (context, index) =>
                                  AnimationConfiguration.staggeredList(
                                position: index,
                                child: ScaleAnimation(
                                  scale: 2,
                                  child: SlideAnimation(
                                    horizontalOffset: -50,
                                    duration: Duration(
                                        milliseconds: index == value.length - 1
                                            ? 320
                                            : 1),
                                    child: FadeInAnimation(
                                      child: Dismissible(
                                        background: Container(
                                          color: Colors.redAccent,
                                          child: const Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Icon(
                                                Icons.delete_forever,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        secondaryBackground: Container(
                                          color: Colors.redAccent,
                                          child: const Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Align(
                                              alignment: Alignment.centerRight,
                                              child: Icon(
                                                Icons.delete_forever,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        key: ValueKey(
                                            value.getAt(index)!.dateRecorded),
                                        onDismissed: (direction) {
                                          // snapshot.data;
                                          Hive.box<UserData>('userdata')
                                              .deleteAt(index);
                                        },
                                        child: Card(
                                          color: Color(
                                            value.getAt(index)!.colorValue,
                                          ),
                                          child: ExpansionTile(
                                            initiallyExpanded:
                                                index == value.length - 1,
                                            title: Text(
                                              value
                                                  .getAt(index)!
                                                  .bmi
                                                  .toString()
                                                  .substring(0, 5),
                                              style: const TextStyle(
                                                color: Colors.white,
                                                shadows: <Shadow>[
                                                  Shadow(
                                                      color: Colors.black54,
                                                      blurRadius: 4),
                                                ],
                                              ),
                                            ),
                                            children: <Widget>[
                                              ListTile(
                                                leading: Icon(
                                                  value
                                                              .getAt(index)!
                                                              .colorValue ==
                                                          Colors.lightBlueAccent
                                                              .value
                                                      ? FontAwesome5Solid.mars
                                                      : FontAwesome5Solid.venus,
                                                  color: Colors.white,
                                                ),
                                                title: const Text('Gender'),
                                                trailing: Text(value
                                                            .getAt(index)!
                                                            .colorValue ==
                                                        Colors.lightBlueAccent
                                                            .value
                                                    ? 'Male'
                                                    : 'Female'),
                                              ),
                                              ListTile(
                                                leading: const Icon(
                                                  MaterialCommunityIcons
                                                      .human_male_height_variant,
                                                  color: Colors.white,
                                                ),
                                                title: const Text('Height'),
                                                trailing: Text(
                                                    value.getAt(index)!.height),
                                              ),
                                              ListTile(
                                                leading: const Icon(
                                                  MaterialCommunityIcons
                                                      .scale_bathroom,
                                                  color: Colors.white,
                                                ),
                                                title: const Text('Weight'),
                                                trailing: Text(
                                                    value.getAt(index)!.weight),
                                              ),
                                              ListTile(
                                                leading: const Icon(
                                                  MaterialCommunityIcons.timer,
                                                  color: Colors.white,
                                                ),
                                                title:
                                                    const Text('Date Recorded'),
                                                trailing: Text(
                                                    DateFormat.yMMMd().format(
                                                        value
                                                            .getAt(index)!
                                                            .dateRecorded)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
              },
            ),
          ),
        ),
      );
}
