import 'package:flutter/material.dart';
import 'package:forcast/models/weather_details.dart';
import 'package:forcast/providers/weather_provider.dart';
import 'package:forcast/screens/home_screen.dart';
import 'package:forcast/utils/fonts.dart';
import 'package:forcast/utils/theme.dart' as ThemeColors;
import 'package:provider/provider.dart';

class WeatherDetailsScreen extends StatefulWidget {
  static const routeName = '/weather-details';

  @override
  _WeatherDetailsScreenState createState() => _WeatherDetailsScreenState();
}

class _WeatherDetailsScreenState extends State<WeatherDetailsScreen> {
  var _isInit = true;
  var _isLoading = false;
  String _selectedDay;
  var selectedWeatherStatus;
  DailyWeather _selectedDailyDetails;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      _selectedDay = ModalRoute.of(context).settings.arguments as String;
      getSelecteDayDetails();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  getSelecteDayDetails() async {
    try {
      _selectedDailyDetails = await Provider.of<WeatherProvider>(context)
          .fetchWetherDetails(_selectedDay);

      setState(() {
        _isLoading = false;
      });
    } catch (error) {
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
            title: Text('An error occurred!'),
            content: Text('Please Try again later!'),
            actions: <Widget>[
              FlatButton(
                child: Text('Back to Home Screen'),
                onPressed: () =>
                    Navigator.pushNamed(context, HomeScreen.routeName),
              )
            ],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0))),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final dailyWeatherDetails =
        Provider.of<WeatherProvider>(context).dailyWeather;

    return Scaffold(
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              width: double.infinity,
              color: ((_selectedDailyDetails.temp - 273.15).toInt() == 29)
                  ? ThemeColors.kLightGreen
                  : (dailyWeatherDetails.temp - 273.15).toInt() > 29
                      ? ThemeColors.kLightOrange
                      : ThemeColors.kLightBlue,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40, left: 40, bottom: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          width: 120,
                          child: Text(
                            '${dailyWeatherDetails.description}',
                            style: MONTESRRAT_REGULAR.copyWith(
                                fontSize: 30, color: Colors.white),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                            padding: const EdgeInsets.only(right: 40.0),
                            child: Container(
                                width: 250,
                                height: screenHeight * 0.4,
                                child: Image(
                                    image: ((_selectedDailyDetails.temp -
                                                    273.15)
                                                .toInt() ==
                                            29)
                                        ? AssetImage('assets/images/cloudy.png')
                                        : ((dailyWeatherDetails.temp - 273.15)
                                                    .toInt() >
                                                29)
                                            ? AssetImage(
                                                'assets/images/sunny.png')
                                            : AssetImage(
                                                'assets/images/rainy.png',
                                              )))),
                      ),
                      Container(
                        height: screenHeight * 0.25,
                        child: Container(
                          width: double.infinity,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Dubai',
                                      style: MONTESRRAT_REGULAR.copyWith(
                                          color: Colors.white, fontSize: 37),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: screenWidth * 0.5 - 40,
                                        child: Text(
                                            '${(dailyWeatherDetails.temp - 273.15).toInt()}°',
                                            style: MONTESRRAT_MEDIUM.copyWith(
                                                color: Colors.white,
                                                fontSize: 75)),
                                      ),
                                      Container(
                                        width: screenWidth * 0.25,
                                        height: 70,
                                        color: Colors.white,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text('Wind',
                                                  style: MONTESRRAT_REGULAR
                                                      .copyWith(
                                                          color: ThemeColors
                                                              .kSubHeadColor,
                                                          fontSize: 15)),
                                              Text(
                                                '${dailyWeatherDetails.windSpeed} km/h',
                                                style:
                                                    MONTESRRAT_MEDIUM.copyWith(
                                                        color: ThemeColors
                                                            .kMainHeadColor,
                                                        fontSize: 15.5),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.04,
                                      ),
                                      Container(
                                        width: screenWidth * 0.21,
                                        height: 70,
                                        color: Colors.white,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text('Humidity',
                                                  style: MONTESRRAT_REGULAR
                                                      .copyWith(
                                                          color: ThemeColors
                                                              .kSubHeadColor,
                                                          fontSize: 15)),
                                              Text(
                                                '${dailyWeatherDetails.humidity}%',
                                                style:
                                                    MONTESRRAT_REGULAR.copyWith(
                                                        color: ThemeColors
                                                            .kMainHeadColor,
                                                        fontSize: 15.5),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
