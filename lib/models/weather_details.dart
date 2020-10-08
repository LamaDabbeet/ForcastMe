import 'package:flutter/foundation.dart';


class DailyWeather with ChangeNotifier {
  final int id;
  final int humidity;
  final double windSpeed;
  final double temp;
  final String date;
  final String description;
  final String day;


  DailyWeather({
    @required this.id,
    @required this.humidity,
    @required this.windSpeed,
    @required this.temp,
    @required this.date,
    @required this.description,
    @required this.day
  });
}
