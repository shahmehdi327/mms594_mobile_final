import 'package:flutter/material.dart';
import 'package:mms594_mobile_final/dashboard.dart';
import 'customcard.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<String> fetchXML(String url) async {
  final output = await http.get(Uri.parse(url));
  return (output.body);
}

Future<String> loadXMLFromAsset(String path) async {
  return await rootBundle.loadString(path);
}

void main() {
  runApp(const Weather());
}

int currentIndex = 0;

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  List<Widget> myNews = [];
  List<Widget> myNews2 = [];
  List<Widget> myNews3 = [];

  @override
  void initState() {
    super.initState();
    loadXMLFromAsset('TCR_StormReportsIndex.xml').then((data) {
      print("Raw XML data received:");
      print(data);

      final document = XmlDocument.parse(data);
      final stormReports = document.findAllElements('row');

      setState(() {
        stormReports.forEach((row) {
          var stormName = row.findElements('StormName').first.innerText;
          var year = row.findElements('Year').first.innerText;
          var basin = row.findElements('Basin').first.innerText;
          var link = row.findElements('StormReportURL').first.innerText;

          print("Found storm: $stormName, year: $year, basin: $basin");
          myNews.add(CustomCard(basin, stormName, year));
        });
      });
    }).catchError((error) {
      print("Error fetching XML: $error");
    });

    fetchXML('https://news.miami.edu/sonhs/feeds/student-stories-feed.xml')
        .then((data) {
      //data was recieved
      print(data);
      final document = XmlDocument.parse(data);
      final newsitems = document.findAllElements('newsitem');

      newsitems.forEach((newsitem) {
        //we access to newsitem
        var img = newsitem.getElement('imageSmall')?.innerText;
        print(img);
        var title = newsitem.getElement('title')?.innerText;
        print(title);
        var summary = newsitem.getElement('abstract')?.innerText;
        print(summary);
        //to add items to a list or collection, we use the .add method
        myNews2.add(CustomCard(img!, title!, summary!));
      });
    }).catchError((error) {
      print("error");
    });

    fetchXML('https://news.miami.edu/frost/feeds/all-news-15.xml').then((data) {
      //data was recieved
      print(data);
      final document = XmlDocument.parse(data);
      final newsitems = document.findAllElements('newsitem');

      newsitems.forEach((newsitem) {
        //we access to newsitem
        var img = newsitem.getElement('imageSmall')?.innerText;
        print(img);
        var title = newsitem.getElement('title')?.innerText;
        print(title);
        var summary = newsitem.getElement('abstract')?.innerText;
        print(summary);
        //to add items to a list or collection, we use the .add method
        myNews3.add(CustomCard(img!, title!, summary!));
      });
    }).catchError((error) {
      print("error");
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 19, 0, 1),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white),
            bodySmall: TextStyle(color: Colors.white),
            titleLarge: TextStyle(color: Colors.white),
            titleMedium: TextStyle(color: Colors.white),
            titleSmall: TextStyle(color: Colors.white),
          )),
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 15,
          title: Text(
            "Hurricane Archive",
            style: TextStyle(fontSize: 10),
          ),
          backgroundColor: const Color.fromARGB(255, 5, 1, 46),
        ),
        body: Center(
          child: <Widget>[
            Dashboard(),
            ListView(children: myNews),
            ListView(children: myNews2),
            Text('wdedwdw'),
          ][currentIndex],
        ),
        bottomNavigationBar: NavigationBar(
          height: 55,
          selectedIndex: currentIndex,
          backgroundColor: const Color.fromARGB(255, 27, 0, 7),
          onDestinationSelected: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          destinations: const <Widget>[
            NavigationDestination(icon: Icon(Icons.dashboard, color: Colors.white), label: "Dashboard"),
            NavigationDestination(icon: Icon(Icons.newspaper, color: Colors.white), label: "News"),
            NavigationDestination(icon: Icon(Icons.event, color: Colors.white), label: "Events"),
            NavigationDestination(icon: Icon(Icons.contact_page, color: Colors.white), label: "Contact"),
          ],
        ),
      ),
    );
  }
}

