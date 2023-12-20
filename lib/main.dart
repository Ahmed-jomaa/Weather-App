import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/weather_provider.dart';
import './pages/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // WeatherModel? weather;
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return WeatherProvider();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.red),
        home: const MyHomePage(),
      ),
    );
  }
}
