import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xml/xml.dart';
import 'customcard.dart';

Future<String> loadXMLFromAsset(String path) async {
  return await rootBundle.loadString(path);
}

class Hurricane extends StatefulWidget {
  const Hurricane({super.key});

  @override
  State<Hurricane> createState() => _HurricaneState();
}

class _HurricaneState extends State<Hurricane> {

List<Widget> myNews = [];
List<Widget> myNews2 = [];
List<Widget> myNews3 = [];

  @override

  void initState() {
    super.initState();
    loadXMLFromAsset('assets/TCR_StormReportsIndex.xml').then((data) {
      final document = XmlDocument.parse(data);
      final newsitems = document.findAllElements('row');

      newsitems.forEach((newsitem){
        var img = newsitem.getElement('StormName')?.innerText;
        var title = newsitem.getElement('Year')?.innerText;
        var summary = newsitem.getElement('Basin')?.innerText;
        setState(() {
          myNews.add(CustomCard(img!,title!,summary!));
        });
      });
    }).catchError((error){
      print("Error loading XML: $error");
    });

    loadXMLFromAsset('assets/student-stories-feed.xml').then((data) {
      final document = XmlDocument.parse(data);
      final newsitems = document.findAllElements('newsitem');

      newsitems.forEach((newsitem){
        var img = newsitem.getElement('imageSmall')?.innerText;
        var title = newsitem.getElement('title')?.innerText;
        var summary = newsitem.getElement('abstract')?.innerText;
        setState(() {
          myNews2.add(CustomCard(img!,title!,summary!));
        });
      });
    }).catchError((error){
      print("Error loading XML: $error");
    });

    loadXMLFromAsset('assets/all-news-15.xml').then((data) {
      final document = XmlDocument.parse(data);
      final newsitems = document.findAllElements('newsitem');

      newsitems.forEach((newsitem){
        var img = newsitem.getElement('imageSmall')?.innerText;
        var title = newsitem.getElement('title')?.innerText;
        var summary = newsitem.getElement('abstract')?.innerText;
        setState(() {
          myNews3.add(CustomCard(img!,title!,summary!));
        });
      });
    }).catchError((error){
      print("Error loading XML: $error");
    });
  }

  Widget build(BuildContext context) {
    return const Placeholder();
  }
}