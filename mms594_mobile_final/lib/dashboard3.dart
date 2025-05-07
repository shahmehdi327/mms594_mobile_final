import 'package:flutter/material.dart';
import 'package:mms594_mobile_final/main.dart';
import 'customcard.dart';
import 'package:url_launcher/url_launcher.dart';

class Dashboard3 extends StatefulWidget {
  const Dashboard3({super.key});

  @override
  State<Dashboard3> createState() => _Dashboard3State();
}

class _Dashboard3State extends State<Dashboard3> {
  void _openChecklistUrl() async {
    const url = 'https://www.floridadisaster.org/globalassets/plan--prepare/disaster-supply-checklist.pdf';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.picture_as_pdf, size: 400, color: const Color.fromARGB(255, 0, 0, 0)),
          onPressed: _openChecklistUrl,
        ),
        Padding(padding: EdgeInsets.all(30)),
        Text(
          "Click the icon to view the official disaster supply checklist from the Florida Department of Emergency Management!",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
        ),
      ],
    );
  }
}


