import 'package:flutter/material.dart';
import 'package:mms594_mobile_final/main.dart';
import 'customcard.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset("assets/icon.png", width: 400,),
        Padding(padding: EdgeInsets.all(30),
      child: Text("Welcome to the NHAA! A lightweight application to have an archived list of past hurricanes!",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),),
              Text("National Hurricane Archive App", style: TextStyle(
              color: const Color.fromARGB(255, 208, 185, 178),
              fontSize: 20)),
              ElevatedButton(
          child: const Text('Data Source'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DataSource()
            ));
          },)
      ],
    );
  }
}


class DataSource extends StatefulWidget {
  const DataSource({super.key});

  @override
  State<DataSource> createState() => _DataSourceState();
}

class _DataSourceState extends State<DataSource> {
  @override
  Widget build(BuildContext context) {
   return Column(
      children: <Widget>[
        Image.asset("assets/icon.png", width: 400,),
        Padding(padding: EdgeInsets.all(30),
      child: Text("All data was sourced from the official XML available from the National Hurricane Center",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),),
              Text("App by Mehdi", style: TextStyle(
              color: const Color.fromARGB(255, 147, 147, 147),
              fontSize: 20)),
              ElevatedButton(
          child: const Text('Home'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Weather()),
            );
          },)
      ],
    );
  }
}
 