import 'package:flutter/material.dart';

int gas=0;
void setg(int a) {
  gas = a;
}

class Gas extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [Text("Gas"),Text('${gas}')]),
    );
  }
}
