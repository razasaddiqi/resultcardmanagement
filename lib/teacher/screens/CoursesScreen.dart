import 'package:fyp/home.dart';
import 'package:fyp/teacher/screens/library/constant.dart';
import 'package:fyp/teacher/screens/models/Courses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_villains/villains/villains.dart';
class CoursesScreen extends StatefulWidget {
  final Future<List<Courses>> courses;
  CoursesScreen({this.courses});

  _CoursesScreenState createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
                height: 250,
                decoration: BoxDecoration(

                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.centerLeft,
                      colors: [Color(0xFF42A5F5),Color(0xFF6A1B9A),Color(0xFF6A1B9A),Color(0xFF6A1B9A),Color(0xFF42A5F5),]
                  ),
                ),
                // color: Color(0xFFF55C20),
                child: null),
          ),
          Villain(
            villainAnimation: VillainAnimation.fromTop(
              // relativeOffset: 0.4,
              from: Duration(milliseconds: 200),
              to: Duration(milliseconds: 400),
            ),
            child: Container(
              margin: EdgeInsets.only(top: 35),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      SimpleLineIcons.getIconData("arrow-left"),
                      color: white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Text(
                    'Select Section to Take Attendence',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: white, fontSize: 15.0),
                  ),
                  SizedBox(
                    width: 50,
                  )
                ],
              ),
            ),
          ),
          Center(
              child: Container(
                margin: EdgeInsets.only(top: 150),
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.height * 0.60,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFF6A1B9A), //                   <--- border color
                        width: 5.0,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF42A5F5),
                          blurRadius: 10.0,
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(40.0),
                          bottomLeft: const Radius.circular(40.0),
                          bottomRight: const Radius.circular(40.0),
                          topRight: const Radius.circular(40.0)
                      )
                  ),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          height: 50,
                          width: 400,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.bottomRight,
                              colors: [Color(0xFF6A1B9A),Color(0xFF42A5F5),]
                          ),
                            borderRadius: new BorderRadius.only(
                                topLeft: const Radius.circular(30.0),
                                topRight: const Radius.circular(30.0)
                            )
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 4.0,
                            ),
                            Text(
                              ' Details',
                              style: TextStyle( fontSize: 20,
                                  color: Colors.white, fontWeight: FontWeight.w700),
                            )
                          ],
                        ),

                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Wrap(
                          spacing: 10.0,
                          runSpacing: 15.0,
                          direction: Axis.horizontal,
                          children: <Widget>[
                            //subjects details
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.0),
                                topRight: Radius.circular(15.0),
                                bottomRight: Radius.circular(15.0),
                              ),
                              child: Container(
                                height: 100.0,
                                width: 112.0,
                                color: redLight,
                                child: InkWell(
                                  onTap: () {

                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[

                                      Text(
                                        ' CS Batch-14\n \tSection -',
                                        style: TextStyle( fontSize: 15,
                                            color: red, fontWeight: FontWeight.w700),
                                      ),
                                      SizedBox(
                                        height: 2.0,
                                      ),
                                      Text(

                                            ' Mobile Application\n   Development',
                                        style: TextStyle( fontSize: 12,
                                            color: red, fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.0),
                                topRight: Radius.circular(15.0),
                                bottomRight: Radius.circular(15.0),
                              ),
                              child: Container(
                                height: 100.0,
                                width: 112.0,
                                color: greenLight,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(

                                        )
                                    );
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        ' Section Detail',
                                        style: TextStyle( fontSize: 15,
                                            color: green, fontWeight: FontWeight.w800),
                                      ),
                                      SizedBox(
                                        height: 4.0,
                                      ),
                                      Text(
                                        ' Subject Name',
                                        style: TextStyle( fontSize: 12,
                                            color: green, fontWeight: FontWeight.w800),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.0),
                                topRight: Radius.circular(15.0),
                                bottomRight: Radius.circular(15.0),
                              ),
                              child: Container(
                                height: 100.0,
                                width: 112.0,
                                color: greenLight,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(

                                        )
                                    );
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        ' Section Detail',
                                        style: TextStyle( fontSize: 15,
                                            color: green, fontWeight: FontWeight.w800),
                                      ),
                                      SizedBox(
                                        height: 4.0,
                                      ),
                                      Text(
                                        ' Subject Name',
                                        style: TextStyle( fontSize: 12,
                                            color: green, fontWeight: FontWeight.w800),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.0),
                                topRight: Radius.circular(15.0),
                                bottomRight: Radius.circular(15.0),
                              ),
                              child: Container(
                                height: 100.0,
                                width: 112.0,
                                color: redLight,
                                child: InkWell(
                                  onTap: () {

                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[

                                      Text(
                                        ' CS Batch-14\n \tSection -',
                                        style: TextStyle( fontSize: 15,
                                            color: red, fontWeight: FontWeight.w700),
                                      ),
                                      SizedBox(
                                        height: 2.0,
                                      ),
                                      Text(

                                        ' Mobile Application\n   Development',
                                        style: TextStyle( fontSize: 12,
                                            color: red, fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),






                          ],
                        ),
                      ),
                    ],
                  )
              ),


          ),

        ],
      ),
    )
    );
  }
}
