import 'package:flutter/material.dart';
import 'package:learning_flutter_app_3/pages/choose_location.dart';
import 'package:learning_flutter_app_3/pages/home.dart';
import 'package:learning_flutter_app_3/pages/loading_screen.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/' : (context) => Loading(),
    '/home' : (context) => Home(),
    '/location' : (context) => ChooseLocation(),
  },
));


