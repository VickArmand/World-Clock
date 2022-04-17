import 'package:flutter/material.dart';
import 'package:worldclock/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDay': instance.isDay,
    });
  }

  List<WorldTime> locations = [
    WorldTime(
      url: 'Europe/London',
      location: 'London',
      flag: 'uk.png',
      time: '',
      isDay: true,
    ),
    WorldTime(
      url: 'Europe/Berlin',
      location: 'Athens',
      flag: 'greece.png',
      time: '',
      isDay: true,
    ),
    WorldTime(
      url: 'Africa/Cairo',
      location: 'Cairo',
      flag: 'egypt.png',
      time: '',
      isDay: true,
    ),
    WorldTime(
      url: 'Africa/Nairobi',
      location: 'Nairobi',
      flag: 'kenya.png',
      time: '',
      isDay: true,
    ),
    WorldTime(
      url: 'America/Chicago',
      location: 'Chicago',
      flag: 'usa.png',
      time: '',
      isDay: true,
    ),
    WorldTime(
      url: 'America/New_York',
      location: 'New_York',
      flag: 'uk.png',
      time: '',
      isDay: true,
    ),
    WorldTime(
      url: 'Asia/Seoul',
      location: 'Seoul',
      flag: 'south_korea.png',
      time: '',
      isDay: true,
    ),
    WorldTime(
      url: 'Asia/Jakarta',
      location: 'Jakarta',
      flag: 'indonesia.png',
      time: '',
      isDay: true,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose a location"),
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
              child: Card(
                  child: ListTile(
                      onTap: () {
                        updateTime(index);
                      },
                      title: Text(locations[index].location),
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/${locations[index].flag}"),
                      ))),
            );
          }),
    );
  }
}
