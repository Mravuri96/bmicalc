import 'package:BmiCalc/models/UserData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class Records extends StatelessWidget {
  const Records({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xcFF0A0C21),
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
            icon: Icon(
              Icons.clear_all,
              color: Colors.white,
            ),
            tooltip: 'Clear all Items',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: const Color(0xcFF0A0c21),
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
                    RaisedButton(
                      color: Theme.of(context).cardColor,
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    RaisedButton(
                      color: Theme.of(context).cardColor,
                      child: const Text(
                        'Confirm',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                        ),
                      ),
                      onPressed: () async {
                        Hive.box<UserData>('UserData').clear();
                        // await _bannerAd?.dispose();
                        // _bannerAd = null;
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<UserData>('UserData').listenable(),
        builder: (BuildContext context, Box<UserData> value, _) {
          return value.isEmpty
              ? Container(
                  color: const Color(0xcFF0A0C21),
                  child: Center(
                    child: const Text(
                      'It\'s empty in here . . . .',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              : Container(
                  color: const Color(0xcFF0A0C21),
                  child: AnimationLimiter(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: value.length,
                      itemBuilder: (context, index) {
                        final UserData _data =
                            Hive.box<UserData>('UserData').getAt(index);

                        return AnimationConfiguration.staggeredList(
                          position: index,
                          child: ScaleAnimation(
                            scale: 2,
                            child: FadeInAnimation(
                              child: Dismissible(
                                background: Container(
                                  color: Colors.redAccent,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Align(
                                      child: Icon(
                                        Icons.delete_forever,
                                        color: Colors.white,
                                      ),
                                      alignment: Alignment.centerLeft,
                                    ),
                                  ),
                                ),
                                secondaryBackground: Container(
                                  color: Colors.redAccent,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Align(
                                      child: Icon(
                                        Icons.delete_forever,
                                        color: Colors.white,
                                      ),
                                      alignment: Alignment.centerRight,
                                    ),
                                  ),
                                ),
                                key: ValueKey(_data.dateRecorded),
                                onDismissed: (direction) {
                                  // snapshot.data;
                                  Hive.box<UserData>('UserData')
                                      .deleteAt(index);
                                },
                                child: Card(
                                  color: Color(
                                    _data.colorValue,
                                  ),
                                  child: ExpansionTile(
                                    title: Text(
                                      _data.bmi.toString().substring(0, 5),
                                      style: TextStyle(
                                        color: Colors.white,
                                        shadows: <Shadow>[
                                          Shadow(
                                            color: Colors.black54,blurRadius: 4
                                          ),
                                        ],
                                      ),
                                    ),
                                    children: <Widget>[
                                      ListTile(
                                        leading: Icon(
                                          _data.colorValue ==
                                                  Colors.lightBlueAccent.value
                                              ? FontAwesome5Solid.mars
                                              : FontAwesome5Solid.venus,
                                          color: Colors.white,
                                        ),
                                        title: const Text('Gender'),
                                        trailing: Text(_data.colorValue ==
                                                Colors.lightBlueAccent.value
                                            ? 'Male'
                                            : 'Female'),
                                      ),
                                      ListTile(
                                        leading: Icon(
                                          MaterialCommunityIcons
                                              .human_male_height_variant,
                                          color: Colors.white,
                                        ),
                                        title: const Text('Height'),
                                        trailing: Text(_data.height),
                                      ),
                                      ListTile(
                                        leading: Icon(
                                          MaterialCommunityIcons.scale_bathroom,
                                          color: Colors.white,
                                        ),
                                        title: const Text('Weight'),
                                        trailing: Text(_data.weight),
                                      ),
                                      ListTile(
                                        leading: Icon(
                                          MaterialCommunityIcons.timer,
                                          color: Colors.white,
                                        ),
                                        title: const Text('Date Recorded'),
                                        trailing: Text(DateFormat.yMMMd()
                                            .format(_data.dateRecorded)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
        },
      ),
    );
  }
}
