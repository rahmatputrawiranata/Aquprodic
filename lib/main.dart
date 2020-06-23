import 'dart:ui';

import 'package:aquamonitoring/pages/setting_screen.dart';
import 'package:aquamonitoring/pages/wrapper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPage = 0;
  
  @override
  Widget child = Container(child: Center(child: Text('Page Not Found'),),);
  
  Widget build(BuildContext context) {

    switch(_selectedPage) {
      case 0:
        child = Wrapper(judul: 'Temperature', page: 'chart', param: 'Temperature',);
        break;
      case 1:
        child = Wrapper(judul: 'Turbidity', page: 'chart', param: 'Turbidity',);
        break;
      case 2:
        child = Wrapper(judul: 'pH', page: 'chart', param: 'pH',);
        break;
      case 3:
        child = Wrapper(judul: 'Humidity', page: 'chart', param: 'Humidity',);
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Aquaponic'),),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings), 
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => SettingScreen()
                )
              );
            },
          )
        ],
        
      ),
      body: SafeArea(
        child: child,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedPage,
        onTap: (int index) => setState(() => _selectedPage = index),
        selectedItemColor: Colors.blue[800],
        unselectedItemColor: Colors.blue[300],
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: new Image.asset('assets/icon/temperature.png', height: 25, width: 25,),
            title: Text('Temperature')
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: new Image.asset('assets/icon/turbiditiy.png', height: 25, width: 25,),
            title: Text('Turbidity')
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: new Image.asset('assets/icon/ph-1.png', height: 25, width: 25,),
            title: Text('pH')
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: new Image.asset('assets/icon/humidity.png', height: 25, width: 25,),
            title: Text('Humidity')
          ),
        ]),
    );
  }
}