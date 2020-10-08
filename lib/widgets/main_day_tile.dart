import 'package:flutter/material.dart';
import 'package:forcast/screens/weather_details.dart';
import 'package:forcast/utils/fonts.dart';

class MainDayTile extends StatelessWidget {
  final String fullDate;
  final String weekDay;
  final List<Color> gradientColors;
  MainDayTile({this.fullDate, this.weekDay, this.gradientColors});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, WeatherDetailsScreen.routeName,arguments: this.weekDay);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Container(
            height: 170,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: gradientColors),
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            fullDate,
                            style: MONTESRRAT_MEDIUM.copyWith(
                                color: Colors.white, fontSize: 15),
                          ),
                          Text(
                            weekDay,
                            style: MONTESRRAT_BOLD.copyWith(
                                color: Colors.white, fontSize: 22),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                          Text(
                            'Dubai',
                            style: MONTESRRAT_BOLD.copyWith(
                                color: Colors.white, fontSize: 17),
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Learn more about the weather',
                        style: MONTESRRAT_REGULAR.copyWith(
                            color: Colors.white, fontSize: 13),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
