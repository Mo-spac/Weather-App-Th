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
            'updated at : 23 : 46',
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/images/cloudy.png'),
              Text(
                '${weatherModel.temp}',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  Text('maxTemp : 24'),
                  Text('minTemp :16'),
                ],
              ),
            ],
          ),
          Text(
            'Light Rain',
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
