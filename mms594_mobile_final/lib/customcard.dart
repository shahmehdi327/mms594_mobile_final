import 'package:flutter/material.dart';
import 'main.dart';
import 'package:url_launcher/url_launcher.dart';




class CustomCard extends StatefulWidget {
  final String storm;
  final String year;
  final String basin;
  const CustomCard(this.basin, this.storm, this.year, {super.key});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      color: Color.fromARGB(255, 129, 90, 90),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Text(widget.basin.isNotEmpty ? widget.basin : 'No Basin', 
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(widget.storm.isNotEmpty ? widget.storm : 'No Storm Name', 
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                  ),
                  SizedBox(height: 8),
                  Text(widget.year.isNotEmpty ? 'Year: ${widget.year}' : 'Year: Unknown',
                    style: TextStyle(fontSize: 16)
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}