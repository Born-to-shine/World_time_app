import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name for the UI
  String time; //time in that location
  String flag; //url to an asset flag  icon
  String url; //location url for API endpoint
  bool isDayTime; //true or false if day time or not
  String dateformat;

  WorldTime({this.location, this.url});

  Future<void> getTime() async {
    try {
      //make the request
      Response response =
          await get('https://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      //get properties from data
      String datetime = data['datetime'];
      String offsethours = data['utc_offset'].substring(1, 3);
      String offsetminutes = data['utc_offset'].substring(4, 6);
      String temp, year = "", date = "", month = "";
      temp = data['datetime'].substring(0, 4);
      for (int i = temp.length - 1; i >= 0; i--) year = temp[i] + year;
      temp = data['datetime'].substring(5, 7);
      for (int i = temp.length - 1; i >= 0; i--) month = temp[i] + month;
      temp = data['datetime'].substring(8, 10);
      for (int i = temp.length - 1; i >= 0; i--) date = temp[i] + date;
      dateformat = date + " / " + month + " / " + year;

      // //create DateTime object
      DateTime now = DateTime.parse(datetime);
      String sign = data['utc_offset'].substring(0, 1);
      now = (sign == "-")
          ? now.subtract(Duration(
              hours: int.parse(offsethours), minutes: int.parse(offsetminutes)))
          : now.add(Duration(
              hours: int.parse(offsethours),
              minutes: int.parse(offsetminutes)));

      //set time property
      time = DateFormat.jm().format(now);
      isDayTime = now.hour > 6 && now.hour < 19 ? true : false;
    } catch (e) {
      print('Caught error: $e');
      time = 'Could not get the time data';
    }
  }
}
