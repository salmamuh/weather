

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather/models/weather_model.dart';

class WeatherService
{
  final Dio dio;
  final String baseUrl ='https://api.weatherapi.com/v1';
  final String key='cb7d78c082e34b1aace162237231508';
  WeatherService(this.dio);
Future<WeatherModel> getCurrentWeather({required String cityName})async{
 try {
   Response response=await dio.get("$baseUrl/forecast.json?key=$key&q=$cityName&days=1");
   WeatherModel weatherModel=WeatherModel.fromJson(response.data);
   return weatherModel;
 }on DioException  catch (e) {
   final String errorMessage =e.response?.data['error']['message']??'oops there was an error try later';

   throw Exception(errorMessage);
 }catch(e){
   log(e.toString());
   throw('oops there was a user error, try later');
 }
}
}