import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_Weather/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({
    super.key,
    // required this.weatherModel,
  });
  // final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<GetweatherCubit>(context).weatherModel;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomName(),
          Text(
            'updated at ${weatherModel.date.hour} : ${weatherModel.date.minute}',
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(weatherModel.getImage()),
              Text(
                weatherModel.temp.round().toString(),
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  Text('maxTemp : ${weatherModel.maxTemp.round()}'),
                  Text('minTemp :${weatherModel.minTemp.round()}'),
                ],
              ),
            ],
          ),
          Text(
            weatherModel.weatherCondition,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomName extends StatelessWidget {
  const CustomName({
    super.key,
    // required this.weatherModel,
  });

  // final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<GetweatherCubit>(context).weatherModel;

    return Text(
      weatherModel.cityName,
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
