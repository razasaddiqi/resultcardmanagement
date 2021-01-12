import 'package:fyp/home.dart';
import 'package:fyp/teacher/screens/library/constant.dart';
import 'package:fyp/teacher/screens/QAM.dart';
import 'package:fyp/teacher/screens/models/Courses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_villains/villains/villains.dart';
class marksScreen extends StatefulWidget {
  // final Future<List<Cours/es>> courses;
  List subjects;
  // User user;
  // Student(this.auth,this.user, {Key key}): super(key: key);
  marksScreen({Key key, @required this.subjects}) : super(key: key);
  // marksScreen({this.courses});

  _marksScreenState createState() => _marksScreenState();
}

class _marksScreenState extends State<marksScreen> {
  @override
  void initState() {
    super.initState();
    set_subject();
  }

List<Widget> subjects_teach = [];
  void set_subject(){
    print(widget.subjects);
    for(int i=0; i<widget.subjects.length;i++){

      subjects_teach.add(ClipRRect(
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => QAM(subject_id:widget.subjects[i]['subject_id'],batch: widget.subjects[i]['batch'],)));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Text(
                  'Batch-${widget.subjects[i]['batch']}',
                  style: TextStyle( fontSize: 15,
                      color: red, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 2.0,
                ),
                Text(

                  ' ${widget.subjects[i]['subject_name']}',
                  style: TextStyle( fontSize: 12,
                      color: red, fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
        ),
      ),);
    }
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
                        "Select Section to Upload Marks",
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
                            children: subjects_teach,
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
