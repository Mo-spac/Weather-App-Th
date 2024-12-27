import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_Weather/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({
    super.key,
    required this.weatherModel,
  });
  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    WeatherModel getweatherCubit =
        BlocProvider.of<GetweatherCubit>(context).weatherModel!;

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          getweatherCubit.getThemeColor(),
          getweatherCubit.getThemeColor()[300]!,
          getweatherCubit.getThemeColor()[50]!,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomName(),
            Text(
              'updated at ${getweatherCubit.date.hour} : ${getweatherCubit.date.minute}',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(getweatherCubit.getImage()),
                Text(
                  getweatherCubit.temp.round().toString(),
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: [
                    Text('maxTemp : ${getweatherCubit.maxTemp.round()}'),
                    Text('minTemp :${getweatherCubit.minTemp.round()}'),
                  ],
                ),
              ],
            ),
            Text(
              getweatherCubit.weatherCondition,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
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
    WeatherModel weatherModel =
        BlocProvider.of<GetweatherCubit>(context).weatherModel!;

    return Text(
      weatherModel.cityName,
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
