import 'package:flutter/material.dart';
import 'package:forcast/providers/weather_provider.dart';
import 'package:forcast/screens/home_screen.dart';
import 'package:forcast/screens/weather_details.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(ForcastApp());
}

class ForcastApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return 
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: WeatherProvider()),
      ],
      child: MaterialApp(
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          WeatherDetailsScreen.routeName: (context) => WeatherDetailsScreen(),
        }, 
        home:HomeScreen()
      ),
     
    );
  }
}
