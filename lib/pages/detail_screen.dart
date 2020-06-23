import 'package:flutter/material.dart';
import 'package:aquamonitoring/models/lit_data.dart';
import 'package:intl/intl.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({Key key, this.lists, this.judul}) : super(key: key);
  final List<LitData> lists;
  final String judul;
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title : Text(widget.judul)),
       body: Container(
         child: ListView.builder(
           itemCount: widget.lists.length,
           itemBuilder:(BuildContext context, int index) {
             return ListTile(
               leading: Text(DateFormat('MMMMd').format(DateTime.fromMillisecondsSinceEpoch(widget.lists[index].timestamp)).toString()),
               title: Center(child : Text(widget.lists[index].data.toString())),
               trailing: Text(DateFormat('H:mm:s').format(DateTime.fromMillisecondsSinceEpoch(widget.lists[index].timestamp)).toString()),
             );
           }          
         )
       ),
    );
  }
}