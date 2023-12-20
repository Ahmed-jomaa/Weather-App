// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously
// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/weather_model.dart';
import '/providers/weather_provider.dart';
import '/services/weather_servies.dart';

class SearchPage extends StatelessWidget {
  String? cityName;
  SearchPage({
    this.updateScreen,
  });
  VoidCallback? updateScreen;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Search'),
      //   centerTitle: true,
      // ),
      body: Container(
        color: const Color.fromARGB(255, 93, 93, 93),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Search',
                      style: TextStyle(fontSize: 20),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 14),
                      margin: const EdgeInsets.only(top: 8),
                      width: double.infinity,
                      height: 52,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              onChanged: (data) {
                                cityName = data;
                              },
                              onFieldSubmitted: (data) async {
                                cityName = data;
                                WeatherService service = WeatherService();
                                WeatherModel? weather = await service
                                    .getWeather(cityName: cityName!);

                                Provider.of<WeatherProvider>(context,
                                        listen: false)
                                    .weatherData = weather;
                                Provider.of<WeatherProvider>(context,
                                        listen: false)
                                    .cityName = cityName;
                                Navigator.pop(context);
                              },
                              autofocus: false,
                              cursorColor: Colors.black,
                              cursorWidth: 1.0,
                              decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 0,
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Icon(Icons.search),
                          const SizedBox(width: 10)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
