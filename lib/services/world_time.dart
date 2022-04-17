import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  bool isDay;
  String flag;
  String url;
  String time;
  WorldTime(
      {required this.location,
      required this.isDay,
      required this.flag,
      required this.url,
      required this.time});
  Future<void> getTime() async {
    // String moviename = await Future.delayed(Duration(seconds: 3), () {
    //   return "Rick and morty";
    // });

    // String movietype = await Future.delayed(Duration(seconds: 3), () {
    //   return "Type: Animation comedy series";
    // });
    // print('$moviename - $movietype');
    try {
      Uri urlx = Uri.parse('http://worldtimeapi.org/api/timezone/$url');
      var response = await http.get(urlx);
      Map data = jsonDecode(response.body);

      DateTime date = DateTime.parse(data['datetime']);
      String offset = data['utc_offset'].substring(1, 3);
      date = date.add(Duration(hours: int.parse(offset)));
      time = DateFormat.jm().format(date);
      isDay = date.hour > 6 && date.hour < 18 ? true : false;
      print(time);
    } catch (err) {
      time = 'Check your internet connection';
    }
  }
}
