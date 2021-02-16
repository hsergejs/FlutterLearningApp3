import 'package:flutter/material.dart';
import 'package:learning_flutter_app_3/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(location: 'Riga', flag: 'latvia.jpg', url: 'Europe/Riga'),
    WorldTime(location: 'Dublin', flag: 'ire.jpg', url: 'Europe/Dublin'),
    WorldTime(location: 'Moscow', flag: 'rus.jpg', url: 'Europe/Moscow'),
    WorldTime(location: 'Sakhalin', flag: 'rus.jpg', url: 'Asia/Sakhalin'),
    WorldTime(location: 'Seoul', flag: 'korea.jpg', url: 'Asia/Seoul'),
  ];

  void updateTime(index) async{
    WorldTime worldTime = locations[index];
    await worldTime.getData();

    Navigator.pop(context, { //just remove from stack opened Scene/closing it and return to opened one in stack
      'location' : worldTime.location,
      'flag' : worldTime.flag,
      'time' : worldTime.time,
      'isDay' : worldTime.isDay
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder( //allow to build ListView, another way was Map
        itemCount: locations.length,
        itemBuilder: (context, index) { //actually building view in Scene
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card( //showing results as Card()
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
