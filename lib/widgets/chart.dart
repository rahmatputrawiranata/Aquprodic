import 'package:aquamonitoring/pages/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:aquamonitoring/models/lit_data.dart';

class ChartWidget extends StatefulWidget {
  ChartWidget({Key key, this.lists, this.judul, this.param}) : super(key: key);

  final List<LitData> lists;
  final String judul;
  final String param;

  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {

  double maxVal(data)
  {
    dynamic max = data.first;
    data.forEach((e) {
      if (e.data > max.data) max = e;
    });
    
    print(max.data);
    return max.data;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 6/7,
          child: Container(
            decoration: const BoxDecoration(
              ),
            child: Padding(
              padding: const EdgeInsets.only(right: 18.0, left: 12.0, top: 24, bottom: 12),
              child: LineChart(
                mainData()
              )
            ),
          ),
        ),
        RaisedButton(
          onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => Wrapper(judul: widget.judul, param: widget.param, page : 'details')
                )
              );
          },
          padding: const EdgeInsets.all(0.0),
          color: Color(0xff2196f3),
          child: Text('Detail'),
          textColor: Color(0xffffffff),
        ),
      ],
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: false,
        drawVerticalLine: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        leftTitles: SideTitles(
          showTitles: true,
          reservedSize: 28,
          margin: 12,
          interval: (maxVal(widget.lists) * 1.5) / 5
        ),
        bottomTitles: SideTitles(
          showTitles: true,
          getTitles: (value) {
            switch(value.toInt()) {
              case 1:
                return DateFormat('H:mm:s').format(DateTime.fromMillisecondsSinceEpoch(widget.lists[0].timestamp));
              case 15:
                return DateFormat('H:mm:s').format(DateTime.fromMillisecondsSinceEpoch(widget.lists[14].timestamp));
              case 28:
                return DateFormat('H:mm:s').format(DateTime.fromMillisecondsSinceEpoch(widget.lists[29].timestamp));
            }

            return '';
          }
        )
      ),
      borderData:
      FlBorderData(show: true, border: Border.all(color: const Color(0xaaddaaff), width: 1)),
      minX: 0,
      maxX: 30,
      minY: 0,
      maxY: maxVal(widget.lists) * 1.5,
      lineBarsData: [
        LineChartBarData(
          spots: widget.lists.asMap().entries.map((e) {
            return FlSpot(e.key.toDouble(), e.value.data.toDouble());
          }).toList(),
          isCurved: true,
          curveSmoothness : 0,
          dotData: FlDotData(show: false),
          barWidth: 4,
          isStrokeCapRound: false,
          belowBarData: BarAreaData(
            show: true,
          ),
        ),
      ],
    );
  }
}