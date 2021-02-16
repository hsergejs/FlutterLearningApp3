import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String flag;
  String url;
  bool isDay;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getData() async { //Future provide a promise value will be in future, obligate to put on async function, to use await and sync in other class
    try {
      Response response = await get('http://worldtimeapi.org/api/timezone/$url'); //provided by http dependency
      Map data = jsonDecode(response.body); //provided by convert dependency
      time = data['datetime'];
      String offset = data['utc_offset'];
      DateTime now = DateTime.parse(time);
      offset = offset.substring(1, 3);
      now = now.add(Duration(hours: int.parse(offset)));
      //isDay = condition ? true : false; ---> ternary operator
      isDay = now.hour > 6 && now.hour < 19 ? true : false;
      time = DateFormat.Hm().format(now); //provide intl package dependency
    }
    catch(e){
      print('Error: $e');
      time = "Couldn't load date and time data!";
    }
  }
}