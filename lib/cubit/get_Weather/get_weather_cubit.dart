import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/service/weather_service.dart';
// import 'package:meta/meta.dart';

part 'get_weather_state.dart';

class GetweatherCubit extends Cubit<WeatherState> {
  GetweatherCubit() : super(WeatherInitialState());

  late WeatherModel weatherModel;

  getWeather({required String cityName}) async {
    try {
      weatherModel =
          await WeatherService(dio: Dio()).getCurrentWeathr(cityName: cityName);
      emit(WeatherLoadedState(
          // weatherModel: weatherModel,
          ));
    } on Exception catch (e) {
      emit(WeatherFailureState(errorMessage: e.toString()));
    }
  }
}
