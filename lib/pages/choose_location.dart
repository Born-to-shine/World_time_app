import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Bangkok', location: 'Bangkok'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin'),
    WorldTime(url: 'Atlantic/Bermuda', location: 'Bermuda'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo'),
    WorldTime(url: 'America/Cambridge_Bay', location: 'Cambridge Bay'),
    WorldTime(url: 'Indian/Chagos', location: 'Chagos'),
    WorldTime(url: 'America/Chicago', location: 'Chicago'),
    WorldTime(url: 'Asia/Colombo', location: 'Colombo'),
    WorldTime(url: 'Europe/Copenhagen', location: 'Copenhagen'),
    WorldTime(url: 'Asia/Dubai', location: 'Dubai'),
    WorldTime(url: 'Europe/London', location: 'London'),
    WorldTime(url: 'America/Havana', location: 'Havana'),
    WorldTime(url: 'Asia/Hong_Kong', location: 'Hong Kong'),
    WorldTime(url: 'Asia/Kolkata', location: 'India'),
    WorldTime(url: 'America/Indiana/Indianapolis', location: 'Indianapolis'),
    WorldTime(url: 'Europe/Istanbul', location: 'Istanbul'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta'),
    WorldTime(url: 'Asia/Jerusalem', location: 'Jerusalem'),
    WorldTime(url: 'Asia/Karachi', location: 'Karachi'),
    WorldTime(url: 'America/Los_Angeles', location: 'Los Angeles'),
    WorldTime(url: 'Indian/Maldives', location: 'Maldives'),
    WorldTime(url: 'Indian/Mauritius', location: 'Mauritius'),
    WorldTime(url: 'America/Mexico_City', location: 'Mexico'),
    WorldTime(url: 'Europe/Monaco', location: 'Monaco'),
    WorldTime(url: 'Europe/Moscow', location: 'Moscow'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi'),
    WorldTime(url: 'America/New_York', location: 'New York'),
    WorldTime(url: 'Europe/Paris', location: 'Paris'),
    WorldTime(url: 'America/Indiana/Petersburg', location: 'Petersburg'),
    WorldTime(url: 'Europe/Prague', location: 'Prague'),
    WorldTime(url: 'Asia/Pyongyang', location: 'Pyongyang'),
    WorldTime(url: 'Asia/Qatar', location: 'Qatar'),
    WorldTime(url: 'Europe/Riga', location: 'Riga'),
    WorldTime(url: 'Europe/Rome', location: 'Rome'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul'),
    WorldTime(url: 'Asia/Shanghai', location: 'Shanghai'),
    WorldTime(url: 'Asia/Singapore', location: 'Singapore'),
    WorldTime(url: 'Australia/Sydney', location: 'Sydney'),
    WorldTime(url: 'Asia/Tokyo', location: 'Tokyo'),
    WorldTime(url: 'Europe/Vienna', location: 'Vienna'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    //navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
      'dateformat': instance.dateformat,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[800],
          title: Text('Choose a location',
              style: TextStyle(
                color: Colors.white,
              )),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/crop.jpg'),
              colorFilter: new ColorFilter.mode(
                  Colors.white.withOpacity(0.7), BlendMode.dstATop),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                child: Card(
                  color: Colors.transparent,
                  child: ListTile(
                      onTap: () {
                        updateTime(index);
                      },
                      title: Text(
                        locations[index].location,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      leading: Icon(
                        Icons.place,
                        color: Colors.white,
                      )),
                ),
              );
            },
          ),
        ));
  }
}
