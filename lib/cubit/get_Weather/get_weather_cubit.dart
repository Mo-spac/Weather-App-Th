import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/service/weather_service.dart';
// import 'package:meta/meta.dart';

part 'get_weather_state.dart';

class GetweatherCubit extends Cubit<WeatherState> {
  GetweatherCubit() : super(WeatherInitialState());

  getWeather({required String cityName}) async {
    try {
      WeatherModel weatherModel =
          await WeatherService(dio: Dio()).getCurrentWeathr(cityName: cityName);
      emit(WeatherLoadedState());
    } on Exception catch (e) {
      emit(WeatherFailureState());
    }
  }
}
