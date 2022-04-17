import 'package:flutter/material.dart';
import 'package:worldclock/routes/routes.dart';
import 'package:worldclock/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingState extends StatefulWidget {
  const LoadingState({Key? key}) : super(key: key);
  @override
  State<LoadingState> createState() => _LoadingStateState();
}

class _LoadingStateState extends State<LoadingState> {
  @override
  void initState() {
    // TODO: implement initState
    setupWorldTime();
    super.initState();
  }

  void setupWorldTime() async {
    WorldTime instance = WorldTime(
      location: 'Nairobi',
      flag: 'Kenya.jpg',
      url: 'Africa/Nairobi',
      time: 'AM',
      isDay: true,
    );
    await instance.getTime();
    Navigator.pushReplacementNamed(context, Routes.homepage, arguments: {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDay': instance.isDay,
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: Center(
          child: Column(children: <Widget>[
            SizedBox(
              height: 300,
            ),
            Center(
              child: SpinKitRing(color: Colors.white, size: 50.0),
            ),
            Text(
              "Loading",
              style: TextStyle(fontSize: 28, letterSpacing: 2),
            )
          ]),
        )

        // Padding(padding: EdgeInsets.all(50), child: Text('Loading .......')),
        );
  }
}
