import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:async';

class LiveData {
  final int time;
  final int temp1;
  LiveData(this.time, this.temp1);
}

int temp=0,x=6;
void sett(int a) async {
  temp = a;
  chartData = _addDataPoint(temp);
}

List<LiveData> chartData = <LiveData>[
  LiveData(1, 5),
  LiveData(2, 5),
  LiveData(3, 5),
  LiveData(4, 5),
  LiveData(5, 5)
];



List<LiveData> _addDataPoint(int z) {
  chartData.add(LiveData(x++, z));
  return chartData;
}

class Temp extends StatefulWidget {
  @override
  State<Temp> createState() => Temp1();
}

class Temp1 extends State<Temp> {

  Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(Duration(milliseconds: 5000), (_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(children: [
            SizedBox(
              width: 150,
              height: 100,
            ),
            Text(
              " Temperature ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  background: Paint()
                    ..color = Colors.purple
                    ..strokeWidth = 23
                    ..strokeJoin = StrokeJoin.round
                    ..strokeCap = StrokeCap.round
                    ..style = PaintingStyle.stroke,
                  color: Colors.white),
            ),
          ]),
          SizedBox(height: 30),
          Text(
                " Value: $temp ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    background: Paint()
                      ..color = Colors.orange
                      ..strokeWidth = 20
                      ..strokeJoin = StrokeJoin.round
                      ..strokeCap = StrokeCap.round
                      ..style = PaintingStyle.stroke,
                    color: Colors.white),
              ),
              SizedBox(height: 30),
         Container(
              height: 300,
              width: 300,
              //color: Colors.purple,
              decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.yellow
      ),
              child: SfCartesianChart(
                  primaryXAxis: NumericAxis(isVisible: false),
                  primaryYAxis: NumericAxis(borderColor: Colors.black,labelStyle: TextStyle(color: Colors.black)),
                  series: <ChartSeries>[
                    // Renders line chart
                    LineSeries<LiveData, int>(
                        dataSource: chartData,
                        xValueMapper: (LiveData sales, _) => sales.time,
                        yValueMapper: (LiveData sales, _) => sales.temp1,
                        markerSettings: MarkerSettings(
                                    isVisible: true,
                                    shape: DataMarkerType.diamond
                                )
                        )

                  ])),
        ],
      ),
    );
  }
}
