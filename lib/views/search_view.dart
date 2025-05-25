import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/weather_service.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Search a City"),
      ),
      body:  Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16),
        child: Center(child:
        TextField(
onSubmitted: (value) async {
var getWeatherCubit=BlocProvider.of<GetWeatherCubit>(context);
getWeatherCubit.getWeather(cityName: value);
Navigator.pop(context);
 },
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 32),
            labelText: 'search',
            suffixIcon: Icon(Icons.search),
            hintText: 'Enter city name',
           border: OutlineInputBorder(
          borderSide:BorderSide(color: Colors.orange)
           ),

          ),
         ),
        ),
      ),
    );
  }
}
