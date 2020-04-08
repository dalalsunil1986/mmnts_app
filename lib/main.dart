import 'package:flutter/material.dart';
import 'events.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MMNTS',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> images = [
    "assets/images/deephouse.jpg",
    "assets/images/coworking.jpg",
  ];

  List<String> titles = ["Deep House\nim Park", "Coworking\nWeWork"];
  List<String> uppertitles = ["Frohnhauser Park, Essen", "Baker Street, London"];
  List<String> subtitles = ["live since 13 minutes", "live since 30 minutes"];

  List<Widget> events() {
    List<Widget> eventList = new List();
    for(int i = 0; i< 2; i++){
      var eventitem = Padding(
        padding: EdgeInsets.symmetric(vertical: 25.0),
        child: Container(
          height: 350.0,
          width: 180.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.transparent
          ),
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image.asset(images[i], fit: BoxFit.cover,),
              new DecoratedBox(decoration: new BoxDecoration(
                gradient: new LinearGradient(
                  begin: FractionalOffset.bottomCenter,
                  end: FractionalOffset.topCenter,
                  colors: [
                    Colors.black87,
                    Colors.transparent
                  ]
                ),
              )),
              Center(
                child: Text(
                  titles[i],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Positioned(
                top: 280.0, left: 90.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      uppertitles[i],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      subtitles[i],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w200
                      ),
                    ),
                  ],
                ),
              ),
            ],
            overflow: Overflow.clip,
          ),
        ),
      );
      eventList.add(eventitem);
    }
    return eventList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff212334),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 100.0, left: 280.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage("https://i.pravatar.cc/400"),
              radius: 20.0
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 10.0, left: 25),
              child: Text(
                "MMNTS",
                style: TextStyle(
                  color: Color(0xfff43c66),
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 10.0, left: 25),
              child: Text(
                "Around You",
                style: TextStyle(
                  color: Color(0xffe0dfe2),
                  fontSize: 40.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 25.0, right: 25.0),
                child: Container(
                  height: 440.0,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: events(),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 70.0,
                child: SizedBox(
                  height: 60.0,
                  width: 220,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.only(
                        bottomLeft: Radius.circular(80.0),
                        topLeft: Radius.circular(80.0)
                      )
                    ),
                    color: Color(0xffff3a41),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => Events()
                      ));
                    },
                    child: Container(
                      constraints: const BoxConstraints(
                        minWidth: 200.0, minHeight: 36.0,
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "share a moment",
                        style: TextStyle(
                          color: Color(0xff3b0003),
                          fontSize: 24
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}