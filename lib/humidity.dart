import 'package:flutter/material.dart';
import 'dart:async';
import 'package:syncfusion_flutter_charts/charts.dart';

ChartSeriesController _chartSeriesController;
List<LiveData> chartData = <LiveData>[
  LiveData(1, 0),
  LiveData(2, 0),
  LiveData(3, 0),
  LiveData(4, 0),
  LiveData(5, 0)
];

class LiveData {
  final int time;
  final int humid;
  LiveData(this.time, this.humid);
}

List<LiveData> _addDataPoint(int z) {
  final int length = chartData.length;
  chartData.add(LiveData(x++, z));
  return chartData;
}

int hum = 0, x = 6;
void seth(int a) async {
  hum = a;
  chartData = await _addDataPoint(hum);
  //_chartSeriesController.updateDataSource(
  //  addedDataIndexes: <int>[chartData.length - 1],
  //);
}

class Humidity extends StatefulWidget {
  @override
  State<Humidity> createState() => Humidity1();
}

class Humidity1 extends State<Humidity> {
  Timer timer;

  /*@override
  void initState() {
    timer = Timer.periodic(Duration(milliseconds: 500), (_) {
      setState(() {});
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(children: [
            Text("Humidity:"),
            Text('${hum}'),
          ]),
          SizedBox(height: 20),
          Container(
              height: 250,
              width: 250,
              child: SfCartesianChart(
                  primaryXAxis: NumericAxis(isVisible: false),
                  series: <ChartSeries>[
                    // Renders line chart
                    LineSeries<LiveData, int>(
                        dataSource: chartData,
                        xValueMapper: (LiveData sales, _) => sales.time,
                        yValueMapper: (LiveData sales, _) => sales.humid)
                  ])),
        ],
      ),
    );
  }
}
