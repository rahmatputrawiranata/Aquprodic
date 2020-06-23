import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({Key key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text('Setting')
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            InputForm(),
            InputForm()
          ],
        ),
      ),
    );
  }
}

class InputForm extends StatelessWidget {
  const InputForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text('1'),
        Container(
          width: 30.0,
          height: 30.0,
          decoration: BoxDecoration(
            color : Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          child: Icon(
            Icons.add,
            color : Colors.white,
            size: 25.0,
          ),
        )
      ],
    );
  }
}