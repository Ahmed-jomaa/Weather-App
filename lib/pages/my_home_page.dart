// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '/pages/search_page.dart';
import '/providers/weather_provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void updateScreen() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Weather App'),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0.0,
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         Navigator.push(context, MaterialPageRoute(builder: (context) {
      //           return SearchPage(
      //             updateScreen: updateScreen,
      //           );
      //         }));
      //       },
      //       icon: const Icon(Icons.search_rounded),
      //     )
      //   ],
      // ),
      body: weatherData == null
          ? Container(
              color: Color.fromARGB(255, 93, 93, 93),
              child: const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'There is no weather 😔 start',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      'searching now 🔍',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    )
                  ],
                ),
              ),
            )
          : Container(
              color: Color.fromARGB(255, 93, 93, 93),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Spacer(flex: 3),
                    Lottie.asset('assets/images/thunder.json'),
                    Spacer(flex: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          Provider.of<WeatherProvider>(context).cityName!,
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${weatherData.temp.toInt()}',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Spacer(flex: 1),
                    Text(
                      weatherData.weather_state,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('max temp : ${weatherData.max_temp.toInt()}'),
                        SizedBox(width: 10),
                        Text('min temp : ${weatherData.min_temp.toInt()}'),
                      ],
                    ),
                    Spacer(flex: 3),
                  ],
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return SearchPage(updateScreen: updateScreen);
              },
            ),
          );
        },
        backgroundColor: Colors.black54,
        child: Icon(
          Icons.search_rounded,
          color: Colors.grey,
        ),
      ),
    );
  }
}
