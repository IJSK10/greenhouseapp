import 'package:flutter/material.dart';

int temp=0;
void sett(int a) {
  temp = a;
}

class Temp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text("Temperature:"),
        Text('${temp}'),
      ]),
    );
  }
}
