class WeatherModel {
  final String cityName;
  final DateTime date;
  final String? image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;

  WeatherModel({
    required this.cityName,
    required this.date,
    this.image,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCondition,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
    );
  }

  String getImage() {
    if (weatherCondition == 'Sunny' ||
        weatherCondition == 'Clear' ||
        weatherCondition == 'partly cloudy') {
      return 'assets/images/clear.png';
    } else if (weatherCondition == 'Blizzard' ||
        weatherCondition == 'Patchy snow possible' ||
        weatherCondition == 'Patchy sleet possible' ||
        weatherCondition == 'Patchy freezing drizzle possible' ||
        weatherCondition == 'Blowing snow') {
      return 'assets/images/snow.png';
    } else if (weatherCondition == 'Freezing fog' ||
        weatherCondition == 'Fog' ||
        weatherCondition == 'Heavy Cloud' ||
        weatherCondition == 'Mist' ||
        weatherCondition == 'Fog') {
      return 'assets/images/cloudy.png';
    } else if (weatherCondition == 'Patchy rain possible' ||
        weatherCondition == 'Heavy Rain' ||
        weatherCondition == 'Showers	') {
      return 'assets/images/rainy.png';
    } else if (weatherCondition == 'Thundery outbreaks possible' ||
        weatherCondition == 'Moderate or heavy snow with thunder' ||
        weatherCondition == 'Patchy light snow with thunder' ||
        weatherCondition == 'Moderate or heavy rain with thunder' ||
        weatherCondition == 'Patchy light rain with thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }
}
