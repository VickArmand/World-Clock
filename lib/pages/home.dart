import 'package:flutter/material.dart';
import 'package:worldclock/routes/routes.dart';

class Home extends StatefulWidget {
  final String location;
  final String time;
  final bool isDay;
  const Home(
      {Key? key,
      required this.location,
      required this.time,
      required this.isDay,
      flag})
      : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    late String bgimage = widget.isDay ? 'day.jpg' : 'night.jpg';
    print('Image isday is $bgimage');
    Color? bgcolor = widget.isDay ? Colors.blue : Colors.indigo[700];
    return Scaffold(
        backgroundColor: bgcolor,
        body: SafeArea(
            child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$bgimage'), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, Routes.location);
                    setState(() {
                      var data = {
                        'location': result['location'],
                        'time': result['time'],
                        'flag': result['flag'],
                        'isDay': result['isDay'],
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[500],
                  ),
                  label: Text(
                    "Edit Location",
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      widget.location,
                      style: TextStyle(
                          fontSize: 28, letterSpacing: 2, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(widget.time,
                    style: TextStyle(fontSize: 50, color: Colors.white))
              ],
            ),
          ),
        )));
  }
}
