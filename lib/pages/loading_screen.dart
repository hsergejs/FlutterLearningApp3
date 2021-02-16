import 'package:flutter/material.dart';
import 'package:learning_flutter_app_3/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime () async { //async to use await, await provide timing to complete function before proceed further
    WorldTime worldTime = WorldTime(location: 'Riga', flag: 'latvia.jpg', url: 'Europe/Riga');
    await worldTime.getData();

    Navigator.pushReplacementNamed(context, '/home', arguments: { //sending data to another scene and closing this scene
      'location' : worldTime.location,
      'flag' : worldTime.flag,
      'time' : worldTime.time,
      'isDay' : worldTime.isDay
    });

  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Center(
        child: SpinKitFadingCube( //provided by flutter_spinkit
          color: Colors.blue[900],
          size: 50.0,
        ),
      ),
    );
  }
}
