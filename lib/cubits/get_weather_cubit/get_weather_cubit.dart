import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_strate.dart';
import 'package:weather/models/weather_model.dart';


import '../../services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState>{
  GetWeatherCubit():super(InitialState());
getWeather({required String cityName}) async {
  try {
    WeatherModel weatherModel= await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
    emit(WeatherLoadedState());}  catch (e) {
    emit(WeatherFailureState());
  }

}
}