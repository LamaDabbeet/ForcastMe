import 'package:flutter/material.dart';
import 'package:forcast/widgets/main_day_tile.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final daysList = [
    {
      'fullDate': DateFormat.yMMMMd('en_US').format(new DateTime.now()),
      'weekDay': DateFormat('EEEE').format(DateTime.now()),
      'gradientColors': [Color(0xff2296ff), Color(0xff57b5fd)]
    },
    {
      'fullDate': DateFormat.yMMMMd('en_US').format(DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day + 1)),
      'weekDay': DateFormat('EEEE').format(DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day + 1)),
      'gradientColors': [Color(0xff2d61f1), Color(0xff9d78dc)]
    },
    {
      'fullDate': DateFormat.yMMMMd('en_US').format(DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day + 2)),
      'weekDay': DateFormat('EEEE').format(DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day + 2)),
      'gradientColors': [Color(0xff10b194), Color(0xff54d595)]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Color(0xffddefff),
      child: Padding(
        padding: const EdgeInsets.only(top:80),
        child: ListView.separated(
          separatorBuilder: (context, i) => Divider(
            height: 20,
          ),
          itemCount: daysList.length,
          itemBuilder: (BuildContext context, i) {
            return MainDayTile(
              fullDate: daysList[i]['fullDate'],
              weekDay: daysList[i]['weekDay'],
              gradientColors: daysList[i]['gradientColors'],
            );
          },
        ),
      ),
    ));
  }
}
