import 'package:flutter/material.dart';
import 'package:mms594_mobile_final/main.dart';
import 'customcard.dart';

class Dashboard2 extends StatefulWidget {
  const Dashboard2({super.key});

  @override
  State<Dashboard2> createState() => _Dashboard2State();
}

class _Dashboard2State extends State<Dashboard2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset("storm.png", width: 400,),
        Padding(padding: EdgeInsets.all(30))
      ],
    );
  }
}


