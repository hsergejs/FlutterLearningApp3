import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments; //receiving data from another scene

    String bgImage = data['isDay'] ? 'assets/day.jpg' : 'assets/night.jpg'; //setting backg image
    Color txtColor = data['isDay'] ? null : Colors.white;
    Color safeAreaColor = data['isDay'] ? Colors.blue[200] : Colors.indigo[900];

    return Scaffold(
      backgroundColor: safeAreaColor,
      body: SafeArea(
        child: Container( //to use stretched img required container
          decoration: BoxDecoration( //use of stretched image as bckg
            image: DecorationImage( //use os stretched image as bckg
              image: AssetImage(bgImage), //path to asset image
              fit: BoxFit.cover //set to cover entire scene, fit: describe how image will fit
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
            child: Column(
              children: [
                FlatButton.icon(
                    onPressed: () async {
                        dynamic result = await Navigator.pushNamed(context, '/location');
                        setState(() {
                          data = {
                            'time' : result['time'],
                            'location' : result['location'],
                            'flag' : result['flag'],
                            'isDay' : result['isDay']
                          };
                        });
                      },
                    icon: Icon(Icons.edit_location_outlined),
                    label: Text('Edit Your Location'),
                    color: txtColor,
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color: txtColor,
                        ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 62.0,
                    color: txtColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
