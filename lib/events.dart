import 'package:flutter/material.dart';
import 'main.dart';

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {

  List<String> images = [
    "assets/images/1.jpg",
    "assets/images/2.jpg"
  ];

  List<Widget> eventPics() {
    List<Widget> eventList = new List();

    for(int i = 0; i<1; i++) {
      var eventItem = Padding(
        padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0,),
        child: Container(
          height: 150.0,
          width: 270.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.transparent
          ),
          child: ClipRRect(
            child: Image.asset(
              images[i],
              fit: BoxFit.cover
            ),
          ),
        ),
      );
      eventList.add(eventItem);
    }

    return eventList;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff212334),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 50.0, left: 25.0),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white,),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: 20.0),
                    Text(
                      "Event erstellen",
                      style: TextStyle(
                        color: Color(0xffa53241),
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 220.0, 
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: eventPics(),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 35, top: 40),
                child: Text(
                  "Cycling to",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 35.0, top: 20.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.add_circle_outline,
                      color: Color(0xff9090a0),
                      size: 20,
                    ),
                    SizedBox(width: 5,),
                    Text(
                      "add description",
                      style: TextStyle(
                        color: Color(0xff9090a0),
                        fontSize: 20.0
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 35.0, top: 20.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 20,
                    ),
                    SizedBox(width: 5,),
                    Text(
                      "current location",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50.0),
            Container(
              child: Slider(),
            ),
            Padding(
              padding: EdgeInsets.only(left: 300.0, top: 20.0),
              child: SizedBox(
                height: 60.0,
                width: 80,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.all(Radius.circular(80.0))
                  ),
                  color: Color(0xffff3a41),
                  onPressed: () {},
                  child: Icon(
                    Icons.arrow_forward,
                    color: Color(0xff3b0003),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Slider extends StatefulWidget {
  @override
  _SliderState createState() => _SliderState();
}

class _SliderState extends State<Slider> {
  static double _lowerValue = 1.0;
  static double _upperValue = 10.0;

  RangeValues values = RangeValues(_lowerValue, _upperValue);
  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      min: _lowerValue,
      max: _upperValue,
      values: values,
      inactiveColor: Colors.black,
      onChanged: (val) {
        setState(() {
          values = val;
        });
      },
    );
  }
}