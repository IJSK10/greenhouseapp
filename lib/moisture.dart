/*import 'package:flutter/material.dart';

int moist=0;
void setm(int a) {
  moist = a;
}

class Moisture extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [Text("Moisture"),Text('${moist}')]),
    );
  }
}*/
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
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
  final int moist;
  LiveData(this.time, this.moist);
}

List<LiveData> _addDataPoint(int z) {
  final int length = chartData.length;
  chartData.add(LiveData(x++, z));
  return chartData;
}

int moist = 0, x = 6;
void setm(int a, BluetoothConnection connection) async {
  moist = a;
  chartData = _addDataPoint(moist);
  //_chartSeriesController.updateDataSource(
  //  addedDataIndexes: <int>[chartData.length - 1],
  //);
  if (a > 550) {
    String text = 'water';
    if (text.isNotEmpty) {
      try {
        connection.output.add(Uint8List.fromList(utf8.encode("$text\r\n")));
        await connection.output.allSent;
        print("Watered");
      } finally {
        print("Not Watered");
      }
    }
  }
}

class Moisture extends StatefulWidget {
  @override
  State<Moisture> createState() => Moisture1();
}

class Moisture1 extends State<Moisture> {
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
            Text("Mositure:"),
            Text('${moist}'),
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
                        yValueMapper: (LiveData sales, _) => sales.moist)
                  ])),
        ],
      ),
    );
  }
}
