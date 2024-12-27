import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_Weather/get_weather_cubit.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetweatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetweatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                appBarTheme: AppBarTheme(
                  color: BlocProvider.of<GetweatherCubit>(context)
                      .weatherModel
                      ?.getThemeColor(),
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: HomeView(),
            );
          },
        );
      }),
    );
  }
}
