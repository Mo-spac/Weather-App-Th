import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';

  WeatherService({required this.dio});
  Future<WeatherModel> getCurrentWeathr({required String cityName}) async {
    Response response = await dio.get(
      '$baseUrl/forecast.json?key=34477d772d904839a9015003242612&q=$cityName&days=10',
    );
    WeatherModel weatherModel = WeatherModel.fromJson(response.data);
    return weatherModel;
  }
}
