import 'package:flutter/material.dart';
import 'package:worldclock/pages/chooselocation.dart';
import 'package:worldclock/pages/home.dart';
import 'package:worldclock/pages/loading.dart';

class Routes {
  static const String homepage = '/';
  static const String loading = '/loading';
  static const String location = '/location';
  static const String worldtime = '/world';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    var data;
    if (settings.arguments != null) {
      data = settings.arguments as Map<String, dynamic>;
      print(data);
    }
    switch (settings.name) {
      case homepage:
        return MaterialPageRoute(
            builder: (context) => Home(
                location: data['location'],
                flag: data['flag'],
                time: data['time'],
                isDay: data['isDay']));

      case loading:
        return MaterialPageRoute(builder: (context) => LoadingState());

      case location:
        return MaterialPageRoute(builder: (context) => ChooseLocation());

      default:
        throw FormatException("Route not found");
    }
  }
}
