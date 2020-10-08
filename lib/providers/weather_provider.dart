import 'package:flutter/material.dart';
import 'package:forcast/models/weather_details.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WeatherProvider with ChangeNotifier {
  List<DailyWeather> _weatherDetails = [];
  DailyWeather _selectedDayDetails;

  DailyWeather get dailyWeather => _selectedDayDetails;

  Future<DailyWeather> fetchWetherDetails(selectedDay) async {
    final url =
        'http://api.openweathermap.org/data/2.5/forecast?id=292223&appid=397faf3ce04e5b10358ac35c9388b6bd';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final extractedList = extractedData['list'] as List<dynamic>;
      final List<DailyWeather> loadedWeatherDetails = [];

      for (int i = 0; i < 25; i = i + 8) {
        loadedWeatherDetails.add(DailyWeather(
            id: 1,
            windSpeed: extractedList[i]['wind']['speed'],
            temp: extractedList[i]['main']['temp'],
            humidity: extractedList[i]['main']['humidity'],
            description: extractedList[i]['weather'][0]['description'],
            date: extractedList[i]['dt_txt'],
            day: DateFormat('EEEE')
                .format(DateTime.parse(extractedList[i]['dt_txt']))));
      }
      _selectedDayDetails = loadedWeatherDetails
          .firstWhere((element) => element.day == selectedDay);
      _weatherDetails = loadedWeatherDetails;
      notifyListeners();
      return _selectedDayDetails;
    } on Exception catch (error) {
      throw (error);
    }
  }
}
