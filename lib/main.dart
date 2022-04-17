import 'package:flutter/material.dart';
import 'package:worldclock/routes/routes.dart';

void main() {
  runApp(MaterialApp(
    // home: Home(),
    initialRoute: Routes.loading,
    // routes: {
    //   '/': (context) => LoadingState(),
    //   '/home': (context) => Home(),
    //   '/location': (context) => ChooseLocation()
    // },

    onGenerateRoute: Routes.generateRoute,
  ));
}
