import 'package:flutter/material.dart';
import 'package:fyp/student/stdntlogin.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
var green = Color(0xFF4caf6a);
var greenLight = Color(0xFFd8ebde);

var red = Color(0xFFf36169);
var redLight = Color(0xFFf2dcdf);

var blue = Color(0xFF398bcf);
var blueLight = Color(0xFFc1dbee);

class marks extends StatefulWidget {
  String subject_id;
  String student_name;
  String teacher_name;
  String photo_url;
  String course_name;
  String course_credit;
  String course_code;
  User user;
  // Student(this.auth,this.user, {Key key}): super(key: key);
  marks({Key key, @required this.subject_id,this.user,this.student_name,this.teacher_name,this.photo_url,this.course_code,this.course_credit,this.course_name}) : super(key: key);

  @override
  _marksState createState() => _marksState();
}

class _marksState extends State<marks> {
  final databaseReference = FirebaseDatabase.instance.reference();
  var data_student = new Map();
  List<Widget> quiz =[ClipRRect(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(8.0),
      topRight: Radius.circular(8.0),
    ),
    child: Container(
      height: 50.0,
      width: 82.0,
      decoration: BoxDecoration(
        color: greenLight,
        border: Border.all(width: 1, color: green
        ),
      ),

      child: InkWell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text(
              'Title',
              style: TextStyle( fontSize: 15,
                  color: green, fontWeight: FontWeight.w800),
            )
          ],
        ),
      ),
    ),
  ),
    ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8.0),
        topRight: Radius.circular(8.0),
      ),
      child: Container(
        height: 50.0,
        width: 82.0,
        decoration: BoxDecoration(
          color: greenLight,
          border: Border.all(width: 1, color: green
          ),
        ),

        child: InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Text(
                'Obtained\n\tMarks',
                style: TextStyle( fontSize: 15,
                    color: green, fontWeight: FontWeight.w800),
              )
            ],
          ),
        ),
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8.0),
        topRight: Radius.circular(8.0),
      ),
      child: Container(
        height: 50.0,
        width: 82.0,
        decoration: BoxDecoration(
          color: greenLight,
          border: Border.all(width: 1, color: green
          ),
        ),

        child: InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Text(
                '\tTotal\n\tMarks',
                style: TextStyle( fontSize: 15,
                    color: green, fontWeight: FontWeight.w800),
              )
            ],
          ),
        ),
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8.0),
        topRight: Radius.circular(8.0),
      ),
      child: Container(
        height: 50.0,
        width: 82.0,
        decoration: BoxDecoration(
          color: greenLight,
          border: Border.all(width: 1, color: green
          ),
        ),

        child: InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Text(
                'Date Time',
                style: TextStyle( fontSize: 15,
                    color: green, fontWeight: FontWeight.w800),
              )
            ],
          ),
        ),
      ),
    ),
    ];
  List<Widget> assignment=[ClipRRect(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(8.0),
      topRight: Radius.circular(8.0),
    ),
    child: Container(
      height: 50.0,
      width: 82.0,
      decoration: BoxDecoration(
        color: redLight,
        border: Border.all(width: 1, color: red
        ),
      ),

      child: InkWell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text(
              'Title',
              style: TextStyle( fontSize: 15,
                  color: red, fontWeight: FontWeight.w800),
            )
          ],
        ),
      ),
    ),
  ),
    ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8.0),
        topRight: Radius.circular(8.0),
      ),
      child: Container(
        height: 50.0,
        width: 82.0,
        decoration: BoxDecoration(
          color: redLight,
          border: Border.all(width: 1, color: red
          ),
        ),

        child: InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Text(
                'Obtained\n\tMarks',
                style: TextStyle( fontSize: 15,
                    color: red, fontWeight: FontWeight.w800),
              )
            ],
          ),
        ),
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8.0),
        topRight: Radius.circular(8.0),
      ),
      child: Container(
        height: 50.0,
        width: 82.0,
        decoration: BoxDecoration(
          color: redLight,
          border: Border.all(width: 1, color: red
          ),
        ),

        child: InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Text(
                '\tTotal\n\tMarks',
                style: TextStyle( fontSize: 15,
                    color: red, fontWeight: FontWeight.w800),
              )
            ],
          ),
        ),
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8.0),
        topRight: Radius.circular(8.0),
      ),
      child: Container(
        height: 50.0,
        width: 82.0,
        decoration: BoxDecoration(
          color: redLight,
          border: Border.all(width: 1, color: red
          ),
        ),

        child: InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Text(
                'Date Time',
                style: TextStyle( fontSize: 15,
                    color:red, fontWeight: FontWeight.w800),
              )
            ],
          ),
        ),
      ),
    ),
    ];
  List<Widget> sessional1=[ClipRRect(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(8.0),
      topRight: Radius.circular(8.0),
    ),
    child: Container(
      height: 50.0,
      width: 82.0,
      decoration: BoxDecoration(
        color: greenLight,
        border: Border.all(width: 1, color: green
        ),
      ),

      child: InkWell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text(
              'Title',
              style: TextStyle( fontSize: 15,
                  color: green, fontWeight: FontWeight.w800),
            )
          ],
        ),
      ),
    ),
  ),
    ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8.0),
        topRight: Radius.circular(8.0),
      ),
      child: Container(
        height: 50.0,
        width: 82.0,
        decoration: BoxDecoration(
          color: greenLight,
          border: Border.all(width: 1, color: green
          ),
        ),

        child: InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Text(
                'Obtained\n\tMarks',
                style: TextStyle( fontSize: 15,
                    color: green, fontWeight: FontWeight.w800),
              )
            ],
          ),
        ),
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8.0),
        topRight: Radius.circular(8.0),
      ),
      child: Container(
        height: 50.0,
        width: 82.0,
        decoration: BoxDecoration(
          color: greenLight,
          border: Border.all(width: 1, color: green
          ),
        ),

        child: InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Text(
                '\tTotal\n\tMarks',
                style: TextStyle( fontSize: 15,
                    color: green, fontWeight: FontWeight.w800),
              )
            ],
          ),
        ),
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8.0),
        topRight: Radius.circular(8.0),
      ),
      child: Container(
        height: 50.0,
        width: 82.0,
        decoration: BoxDecoration(
          color: greenLight,
          border: Border.all(width: 1, color: green
          ),
        ),

        child: InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Text(
                'Date Time',
                style: TextStyle( fontSize: 15,
                    color: green, fontWeight: FontWeight.w800),
              )
            ],
          ),
        ),
      ),
    ),
   ];
  List<Widget> sessional2=[ ClipRRect(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(8.0),
      topRight: Radius.circular(8.0),
    ),
    child: Container(
      height: 50.0,
      width: 82.0,
      decoration: BoxDecoration(
        color: redLight,
        border: Border.all(width: 1, color: red
        ),
      ),

      child: InkWell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text(
              'Title',
              style: TextStyle( fontSize: 15,
                  color: red, fontWeight: FontWeight.w800),
            )
          ],
        ),
      ),
    ),
  ),
    ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8.0),
        topRight: Radius.circular(8.0),
      ),
      child: Container(
        height: 50.0,
        width: 82.0,
        decoration: BoxDecoration(
          color: redLight,
          border: Border.all(width: 1, color: red
          ),
        ),

        child: InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Text(
                'Obtained\n\tMarks',
                style: TextStyle( fontSize: 15,
                    color: red, fontWeight: FontWeight.w800),
              )
            ],
          ),
        ),
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8.0),
        topRight: Radius.circular(8.0),
      ),
      child: Container(
        height: 50.0,
        width: 82.0,
        decoration: BoxDecoration(
          color: redLight,
          border: Border.all(width: 1, color: red
          ),
        ),

        child: InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Text(
                '\tTotal\n\tMarks',
                style: TextStyle( fontSize: 15,
                    color: red, fontWeight: FontWeight.w800),
              )
            ],
          ),
        ),
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8.0),
        topRight: Radius.circular(8.0),
      ),
      child: Container(
        height: 50.0,
        width: 82.0,
        decoration: BoxDecoration(
          color: redLight,
          border: Border.all(width: 1, color: red
          ),
        ),

        child: InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Text(
                'Date Time',
                style: TextStyle( fontSize: 15,
                    color:red, fontWeight: FontWeight.w800),
              )
            ],
          ),
        ),
      ),
    ),

  ];
  List<Widget> final_=[ClipRRect(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(8.0),
      topRight: Radius.circular(8.0),
    ),
    child: Container(
      height: 50.0,
      width: 82.0,
      decoration: BoxDecoration(
        color: greenLight,
        border: Border.all(width: 1, color: green
        ),
      ),

      child: InkWell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text(
              'Title',
              style: TextStyle( fontSize: 15,
                  color: green, fontWeight: FontWeight.w800),
            )
          ],
        ),
      ),
    ),
  ),
    ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8.0),
        topRight: Radius.circular(8.0),
      ),
      child: Container(
        height: 50.0,
        width: 82.0,
        decoration: BoxDecoration(
          color: greenLight,
          border: Border.all(width: 1, color: green
          ),
        ),

        child: InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Text(
                'Obtained\n\tMarks',
                style: TextStyle( fontSize: 15,
                    color: green, fontWeight: FontWeight.w800),
              )
            ],
          ),
        ),
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8.0),
        topRight: Radius.circular(8.0),
      ),
      child: Container(
        height: 50.0,
        width: 82.0,
        decoration: BoxDecoration(
          color: greenLight,
          border: Border.all(width: 1, color: green
          ),
        ),

        child: InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Text(
                '\tTotal\n\tMarks',
                style: TextStyle( fontSize: 15,
                    color: green, fontWeight: FontWeight.w800),
              )
            ],
          ),
        ),
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8.0),
        topRight: Radius.circular(8.0),
      ),
      child: Container(
        height: 50.0,
        width: 82.0,
        decoration: BoxDecoration(
          color: greenLight,
          border: Border.all(width: 1, color: green
          ),
        ),

        child: InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Text(
                'Date Time',
                style: TextStyle( fontSize: 15,
                    color: green, fontWeight: FontWeight.w800),
              )
            ],
          ),
        ),
      ),
    ),

  ];
  bool collect_data=true;
  @override
  void initState() {
    super.initState();
  getData();
  }
  Future<bool> getData() async{
    var snapshot = await databaseReference.child('marks/${widget.user.uid}/${widget.subject_id}');
    snapshot.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      try{
      var total_objects = values.length;
      var index = 0;
      values.forEach((key, values) {
        if (key == "quiz") {
          for (int i = 0; i < values.length; i++) {
            setState(() {
              quiz.add(ClipRRect(

                child: Container(
                  height: 50.0,
                  width: 82.0,
                  decoration: BoxDecoration(

                    border: Border.all(width: 1, color: green
                    ),
                  ),

                  child: InkWell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Text(
                          'Quiz ${i + 1}',
                          style: TextStyle(fontSize: 15,
                              color: Colors.black, fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                  ),
                ),
              ));
              quiz.add(ClipRRect(

                child: Container(
                  height: 50.0,
                  width: 82.0,
                  decoration: BoxDecoration(

                    border: Border.all(width: 1, color: green
                    ),
                  ),

                  child: InkWell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Text(
                          '${values[i]['obtained_marks']}',
                          style: TextStyle(fontSize: 15,
                              color: Colors.black, fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                  ),
                ),
              ),);
              quiz.add(ClipRRect(

                child: Container(
                  height: 50.0,
                  width: 82.0,
                  decoration: BoxDecoration(

                    border: Border.all(width: 1, color: green
                    ),
                  ),

                  child: InkWell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Text(
                          '${values[i]['total_marks']}',
                          style: TextStyle(fontSize: 15,
                              color: Colors.black, fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                  ),
                ),
              ),);
              quiz.add(ClipRRect(

                child: Container(
                  height: 50.0,
                  width: 82.0,
                  decoration: BoxDecoration(

                    border: Border.all(width: 1, color: green
                    ),
                  ),

                  child: InkWell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Text(
                          '${values[i]['date']}',
                          style: TextStyle(fontSize: 15,
                              color: Colors.black, fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                  ),
                ),
              ),);
            });
          }
        }
        if (key == "assignment") {
          for (int i = 0; i < values.length; i++) {
            setState(() {
              assignment.add(ClipRRect(

                child: Container(
                  height: 50.0,
                  width: 82.0,
                  decoration: BoxDecoration(

                    border: Border.all(width: 1, color: red
                    ),
                  ),

                  child: InkWell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Text(
                          'Assign ${i + 1}',
                          style: TextStyle(fontSize: 15,
                              color: Colors.black, fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                  ),
                ),
              ));
              assignment.add(ClipRRect(

                child: Container(
                  height: 50.0,
                  width: 82.0,
                  decoration: BoxDecoration(

                    border: Border.all(width: 1, color: red
                    ),
                  ),

                  child: InkWell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Text(
                          '${values[i]['obtained_marks']}',
                          style: TextStyle(fontSize: 15,
                              color: Colors.black, fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                  ),
                ),
              ));
              assignment.add(ClipRRect(

                child: Container(
                  height: 50.0,
                  width: 82.0,
                  decoration: BoxDecoration(

                    border: Border.all(width: 1, color: red
                    ),
                  ),

                  child: InkWell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Text(
                          '${values[i]['total_marks']}',
                          style: TextStyle(fontSize: 15,
                              color: Colors.black, fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                  ),
                ),
              ));
              assignment.add(ClipRRect(

                child: Container(
                  height: 50.0,
                  width: 82.0,
                  decoration: BoxDecoration(

                    border: Border.all(width: 1, color: red
                    ),
                  ),

                  child: InkWell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Text(
                          '${values[i]['date']}',
                          style: TextStyle(fontSize: 15,
                              color: Colors.black, fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                  ),
                ),
              ));
            });
          }
        }
        if (key == "sessional1") {
          for (int i = 0; i < values.length; i++) {
            setState(() {
              sessional1.add(ClipRRect(

                child: Container(
                  height: 50.0,
                  width: 82.0,
                  decoration: BoxDecoration(

                    border: Border.all(width: 1, color: green
                    ),
                  ),

                  child: InkWell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Text(
                          'Sessional I',
                          style: TextStyle(fontSize: 15,
                              color: Colors.black, fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                  ),
                ),
              ));
              sessional1.add(ClipRRect(

                child: Container(
                  height: 50.0,
                  width: 82.0,
                  decoration: BoxDecoration(

                    border: Border.all(width: 1, color: green
                    ),
                  ),

                  child: InkWell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Text(
                          '${values[i]['obtained_marks']}',
                          style: TextStyle(fontSize: 15,
                              color: Colors.black, fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                  ),
                ),
              ));
              sessional1.add(ClipRRect(

                child: Container(
                  height: 50.0,
                  width: 82.0,
                  decoration: BoxDecoration(

                    border: Border.all(width: 1, color: green
                    ),
                  ),

                  child: InkWell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Text(
                          '${values[i]['total_marks']}',
                          style: TextStyle(fontSize: 15,
                              color: Colors.black, fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                  ),
                ),
              ));
              sessional1.add(ClipRRect(

                child: Container(
                  height: 50.0,
                  width: 82.0,
                  decoration: BoxDecoration(

                    border: Border.all(width: 1, color: green
                    ),
                  ),

                  child: InkWell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Text(
                          '${values[i]['date']}',
                          style: TextStyle(fontSize: 15,
                              color: Colors.black, fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                  ),
                ),
              ));
            });
          }
        }
        if (key == "sessional2") {
          for (int i = 0; i < values.length; i++) {
            setState(() {
              sessional2.add(ClipRRect(

                child: Container(
                  height: 50.0,
                  width: 82.0,
                  decoration: BoxDecoration(

                    border: Border.all(width: 1, color: red
                    ),
                  ),

                  child: InkWell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Text(
                          'Sessional\n\t\t\t\t\t II',
                          style: TextStyle(fontSize: 15,
                              color: Colors.black, fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                  ),
                ),
              ));
              sessional2.add(ClipRRect(

                child: Container(
                  height: 50.0,
                  width: 82.0,
                  decoration: BoxDecoration(

                    border: Border.all(width: 1, color: red
                    ),
                  ),

                  child: InkWell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Text(
                          '${values[i]['obtained_marks']}',
                          style: TextStyle(fontSize: 15,
                              color: Colors.black, fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                  ),
                ),
              ));
              sessional2.add(ClipRRect(

                child: Container(
                  height: 50.0,
                  width: 82.0,
                  decoration: BoxDecoration(

                    border: Border.all(width: 1, color: red
                    ),
                  ),

                  child: InkWell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Text(
                          '${values[i]['total_marks']}',
                          style: TextStyle(fontSize: 15,
                              color: Colors.black, fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                  ),
                ),
              ));
              sessional2.add(ClipRRect(

                child: Container(
                  height: 50.0,
                  width: 82.0,
                  decoration: BoxDecoration(

                    border: Border.all(width: 1, color: red
                    ),
                  ),

                  child: InkWell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Text(
                          '${values[i]['date']}',
                          style: TextStyle(fontSize: 15,
                              color: Colors.black, fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                  ),
                ),
              ));
            });
          }
        }
        if (key == "final") {
          for (int i = 0; i < values.length; i++) {
            setState(() {
              final_.add(ClipRRect(

                child: Container(
                  height: 50.0,
                  width: 82.0,
                  decoration: BoxDecoration(

                    border: Border.all(width: 1, color: green
                    ),
                  ),

                  child: InkWell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Text(
                          'Final',
                          style: TextStyle(fontSize: 15,
                              color: Colors.black, fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                  ),
                ),
              ),);
              final_.add(ClipRRect(

                child: Container(
                  height: 50.0,
                  width: 82.0,
                  decoration: BoxDecoration(

                    border: Border.all(width: 1, color: green
                    ),
                  ),

                  child: InkWell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Text(
                          '${values[i]['obtained_marks']}',
                          style: TextStyle(fontSize: 15,
                              color: Colors.black, fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                  ),
                ),
              ),);
              final_.add(ClipRRect(

                child: Container(
                  height: 50.0,
                  width: 82.0,
                  decoration: BoxDecoration(

                    border: Border.all(width: 1, color: green
                    ),
                  ),

                  child: InkWell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Text(
                          '${values[i]['total_marks']}',
                          style: TextStyle(fontSize: 15,
                              color: Colors.black, fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                  ),
                ),
              ),);
              final_.add(ClipRRect(

                child: Container(
                  height: 50.0,
                  width: 82.0,
                  decoration: BoxDecoration(

                    border: Border.all(width: 1, color: green
                    ),
                  ),

                  child: InkWell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Text(
                          '${values[i]['date']}',
                          style: TextStyle(fontSize: 15,
                              color: Colors.black, fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                  ),
                ),
              ),);
            });
          }
        }

        setState(() {
          data_student[key] = values;
        });

        print(key);
        print(values);
        index += 1;
        if (index == total_objects) {
          setState(() {
            collect_data = false;
          });
        }
      });
    }
    catch(e){
      setState(() {
        collect_data = false;
      });
    }
    });
    return true;
  }
  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marks Summary'),
        elevation: 2.0,
        flexibleSpace:Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF6A1B9A),Color(0xFF6A1B9A),Color(0xFF6A1B9A),Color(0xFF42A5F5),]
            ),
            borderRadius: BorderRadius.all(Radius.elliptical(5,7)),
          ),

        ),
      ),
      body:
          collect_data?Center(child: CircularProgressIndicator() ,)
         :
      Column(
        children:<Widget>[
          Container(
              height: 320,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60)
                ),
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.centerLeft,
                    colors: [Color(0xFF42A5F5),Color(0xFF6A1B9A),Color(0xFF6A1B9A),Color(0xFF6A1B9A),Color(0xFF42A5F5),]
                ),
              ),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Wrap(
                      spacing: 40.0,
                      runSpacing: 8.0,
                      direction: Axis.horizontal,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0),
                            bottomRight: Radius.circular(15.0),
                          ),
                          child: Container(
                            height: 92.0,
                            width: 200.0,
                            child: InkWell(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Name: ${widget.student_name}' '\nSubject: ${widget.course_name}',
                                    style: TextStyle(
                                        color: Colors.white, fontWeight: FontWeight.w500),
                                  ),

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
                            width: 100.0,
                            child: InkWell(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                      height: 100,
                                      width: 100,

                                      decoration: new BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          image: new DecorationImage(
                                            image: new NetworkImage(widget.photo_url),
                                            fit: BoxFit.fill,
                                          )
                                      )

                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Wrap(
                      spacing: 5.0,
                      runSpacing: 10.0,
                      direction: Axis.horizontal,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0),
                            bottomRight: Radius.circular(15.0),
                          ),
                          child: Container(
                            height: 70.0,
                            width: 82.0,
                            color: redLight,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => LoginaPage()));
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.menu_book,
                                    color: red,
                                  ),
                                  SizedBox(
                                    height: 4.0,
                                  ),
                                  Text(
                                    ' Learning\nResources',
                                    style: TextStyle( fontSize: 10,
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
                            height: 70.0,
                            width: 82.0,
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
                                  Icon(
                                    Icons.notification_important,
                                    color: green,
                                  ),
                                  SizedBox(
                                    height: 4.0,
                                  ),
                                  Text(
                                    '  \t Course\nNotification',
                                    style: TextStyle( fontSize: 10,
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
                            height: 70.0,
                            width: 82.0,
                            color: redLight,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => LoginaPage()));
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.check_circle,
                                    color: red,
                                  ),
                                  SizedBox(
                                    height: 4.0,
                                  ),
                                  Text(
                                    'Attendence',
                                    style: TextStyle( fontSize: 10,
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
                            height: 70.0,
                            width: 82.0,
                            color: greenLight,
                            child: InkWell(
                              onTap: () {

                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.bookmarks,
                                    color: green,
                                  ),
                                  SizedBox(
                                    height: 4.0,
                                  ),
                                  Text(
                                    ' \t Marks\n Summery',
                                    style: TextStyle(fontSize: 10,
                                        color: green, fontWeight: FontWeight.w700),
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
                            height: 70.0,
                            width: 82.0,
                            color: greenLight,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                    ));
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.card_membership,
                                    color: green,
                                  ),
                                  SizedBox(
                                    height: 4.0,
                                  ),
                                  Text(
                                    'Assignments',
                                    style: TextStyle(fontSize: 10,
                                        color: green, fontWeight: FontWeight.w700),
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
                            height: 70.0,
                            width: 82.0,
                            color: redLight,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(


                                    ));
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.library_books,
                                    color: red,
                                  ),
                                  SizedBox(
                                    height: 4.0,
                                  ),
                                  Text(
                                    'Quiz',
                                    style: TextStyle(fontSize: 10,
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
                            height: 70.0,
                            width: 82.0,
                            color: greenLight,
                            child: InkWell(
                              onTap: () {

                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.home,
                                    color: green,
                                  ),
                                  SizedBox(
                                    height: 4.0,
                                  ),
                                  Text(
                                    'Dashboard',
                                    style: TextStyle(fontSize: 10,
                                        color: green, fontWeight: FontWeight.w700),
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
// Marks container
//         SingleChildScrollView(
//           child:
//         ),
          Expanded(
            child: SingleChildScrollView(
              child:Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0)),
                    child: Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width / 1.029,
                      //color: Colors.amber,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFF6A1B9A),Color(0xFF6A1B9A),Color(0xFF42A5F5),]
                        ),
                        borderRadius: BorderRadius.all(Radius.elliptical(5,7)),
                      ),
                      child: Center(
                          child: Text(
                            'Quizzes',
                            style: TextStyle(fontSize: 20.0, color: Colors.white),
                          )),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Wrap(
                      direction: Axis.horizontal,
                      children: quiz,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0)),
                    child: Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width / 1.029,
                      //color: Colors.amber,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFF6A1B9A),Color(0xFF6A1B9A),Color(0xFF42A5F5),]
                        ),
                        borderRadius: BorderRadius.all(Radius.elliptical(5,7)),
                      ),
                      child: Center(
                          child: Text(
                            'Assignments',
                            style: TextStyle(fontSize: 20.0, color: Colors.white),
                          )),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Wrap(
                        direction: Axis.horizontal,
                        children: assignment
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0)),
                    child: Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width / 1.029,
                      //color: Colors.amber,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFF6A1B9A),Color(0xFF6A1B9A),Color(0xFF42A5F5),]
                        ),
                        borderRadius: BorderRadius.all(Radius.elliptical(5,7)),
                      ),
                      child: Center(
                          child: Text(
                            'Sessional I',
                            style: TextStyle(fontSize: 20.0, color: Colors.white),
                          )),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child:Wrap(
                      direction: Axis.horizontal,
                      children: sessional1,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0)),
                    child: Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width / 1.029,
                      //color: Colors.amber,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFF6A1B9A),Color(0xFF6A1B9A),Color(0xFF42A5F5),]
                        ),
                        borderRadius: BorderRadius.all(Radius.elliptical(5,7)),
                      ),
                      child: Center(
                          child: Text(
                            'Sessional II',
                            style: TextStyle(fontSize: 20.0, color: Colors.white),
                          )),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Wrap(
                      direction: Axis.horizontal,
                      children: sessional2,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0)),
                    child: Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width / 1.029,
                      //color: Colors.amber,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFF6A1B9A),Color(0xFF6A1B9A),Color(0xFF42A5F5),]
                        ),
                        borderRadius: BorderRadius.all(Radius.elliptical(5,7)),
                      ),
                      child: Center(
                          child: Text(
                            'Final',
                            style: TextStyle(fontSize: 20.0, color: Colors.white),
                          )),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Wrap(
                      direction: Axis.horizontal,
                      children: final_,
                    ),
                  ),

                ],
              ),
            )

          ),
          // Container(
          //   // height: 800,
          //   //color: Colors.red,
          //
          //   child: SingleChildScrollView(
          //     child:Column(
          //       children: <Widget>[
          //         Expanded(
          //           child:
          //           ListView(
          //             children: <Widget>[
          //               Padding(
          //                 padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
          //               ),
          //               ClipRRect(
          //                 borderRadius: BorderRadius.only(
          //                     topLeft: Radius.circular(15.0),
          //                     topRight: Radius.circular(15.0),
          //                     bottomRight: Radius.circular(15.0),
          //                     bottomLeft: Radius.circular(15.0)),
          //                 child: Container(
          //                   height: 50.0,
          //                   width: MediaQuery.of(context).size.width / 1.029,
          //                   //color: Colors.amber,
          //                   decoration: BoxDecoration(
          //                     gradient: LinearGradient(
          //                         begin: Alignment.bottomLeft,
          //                         end: Alignment.bottomRight,
          //                         colors: [Color(0xFF6A1B9A),Color(0xFF6A1B9A),Color(0xFF42A5F5),]
          //                     ),
          //                     borderRadius: BorderRadius.all(Radius.elliptical(5,7)),
          //                   ),
          //                   child: Center(
          //                       child: Text(
          //                         'Quizzes',
          //                         style: TextStyle(fontSize: 20.0, color: Colors.white),
          //                       )),
          //
          //                 ),
          //               ),
          //               Padding(
          //                 padding: const EdgeInsets.symmetric(horizontal: 10.0),
          //                 child: Wrap(
          //                   direction: Axis.horizontal,
          //                   children: quiz,
          //                 ),
          //               ),
          //               ClipRRect(
          //                 borderRadius: BorderRadius.only(
          //                     topLeft: Radius.circular(15.0),
          //                     topRight: Radius.circular(15.0),
          //                     bottomRight: Radius.circular(15.0),
          //                     bottomLeft: Radius.circular(15.0)),
          //                 child: Container(
          //                   height: 50.0,
          //                   width: MediaQuery.of(context).size.width / 1.029,
          //                   //color: Colors.amber,
          //                   decoration: BoxDecoration(
          //                     gradient: LinearGradient(
          //                         begin: Alignment.bottomLeft,
          //                         end: Alignment.bottomRight,
          //                         colors: [Color(0xFF6A1B9A),Color(0xFF6A1B9A),Color(0xFF42A5F5),]
          //                     ),
          //                     borderRadius: BorderRadius.all(Radius.elliptical(5,7)),
          //                   ),
          //                   child: Center(
          //                       child: Text(
          //                         'Assignments',
          //                         style: TextStyle(fontSize: 20.0, color: Colors.white),
          //                       )),
          //
          //                 ),
          //               ),
          //               Padding(
          //                 padding: const EdgeInsets.symmetric(horizontal: 10.0),
          //                 child: Wrap(
          //                     direction: Axis.horizontal,
          //                     children: assignment
          //                 ),
          //               ),
          //               ClipRRect(
          //                 borderRadius: BorderRadius.only(
          //                     topLeft: Radius.circular(15.0),
          //                     topRight: Radius.circular(15.0),
          //                     bottomRight: Radius.circular(15.0),
          //                     bottomLeft: Radius.circular(15.0)),
          //                 child: Container(
          //                   height: 50.0,
          //                   width: MediaQuery.of(context).size.width / 1.029,
          //                   //color: Colors.amber,
          //                   decoration: BoxDecoration(
          //                     gradient: LinearGradient(
          //                         begin: Alignment.bottomLeft,
          //                         end: Alignment.bottomRight,
          //                         colors: [Color(0xFF6A1B9A),Color(0xFF6A1B9A),Color(0xFF42A5F5),]
          //                     ),
          //                     borderRadius: BorderRadius.all(Radius.elliptical(5,7)),
          //                   ),
          //                   child: Center(
          //                       child: Text(
          //                         'Sessional I',
          //                         style: TextStyle(fontSize: 20.0, color: Colors.white),
          //                       )),
          //
          //                 ),
          //               ),
          //               Padding(
          //                 padding: const EdgeInsets.symmetric(horizontal: 10.0),
          //                 child:Wrap(
          //                   direction: Axis.horizontal,
          //                   children: sessional1,
          //                 ),
          //               ),
          //               ClipRRect(
          //                 borderRadius: BorderRadius.only(
          //                     topLeft: Radius.circular(15.0),
          //                     topRight: Radius.circular(15.0),
          //                     bottomRight: Radius.circular(15.0),
          //                     bottomLeft: Radius.circular(15.0)),
          //                 child: Container(
          //                   height: 50.0,
          //                   width: MediaQuery.of(context).size.width / 1.029,
          //                   //color: Colors.amber,
          //                   decoration: BoxDecoration(
          //                     gradient: LinearGradient(
          //                         begin: Alignment.bottomLeft,
          //                         end: Alignment.bottomRight,
          //                         colors: [Color(0xFF6A1B9A),Color(0xFF6A1B9A),Color(0xFF42A5F5),]
          //                     ),
          //                     borderRadius: BorderRadius.all(Radius.elliptical(5,7)),
          //                   ),
          //                   child: Center(
          //                       child: Text(
          //                         'Sessional II',
          //                         style: TextStyle(fontSize: 20.0, color: Colors.white),
          //                       )),
          //
          //                 ),
          //               ),
          //               Padding(
          //                 padding: const EdgeInsets.symmetric(horizontal: 10.0),
          //                 child: Wrap(
          //                   direction: Axis.horizontal,
          //                   children: sessional2,
          //                 ),
          //               ),
          //               ClipRRect(
          //                 borderRadius: BorderRadius.only(
          //                     topLeft: Radius.circular(15.0),
          //                     topRight: Radius.circular(15.0),
          //                     bottomRight: Radius.circular(15.0),
          //                     bottomLeft: Radius.circular(15.0)),
          //                 child: Container(
          //                   height: 50.0,
          //                   width: MediaQuery.of(context).size.width / 1.029,
          //                   //color: Colors.amber,
          //                   decoration: BoxDecoration(
          //                     gradient: LinearGradient(
          //                         begin: Alignment.bottomLeft,
          //                         end: Alignment.bottomRight,
          //                         colors: [Color(0xFF6A1B9A),Color(0xFF6A1B9A),Color(0xFF42A5F5),]
          //                     ),
          //                     borderRadius: BorderRadius.all(Radius.elliptical(5,7)),
          //                   ),
          //                   child: Center(
          //                       child: Text(
          //                         'Final',
          //                         style: TextStyle(fontSize: 20.0, color: Colors.white),
          //                       )),
          //
          //                 ),
          //               ),
          //               Padding(
          //                 padding: const EdgeInsets.symmetric(horizontal: 10.0),
          //                 child: Wrap(
          //                   direction: Axis.horizontal,
          //                   children: final_,
          //                 ),
          //               ),
          //
          //             ],
          //           ),
          //         )
          //       ],
          //     ),
          //   )
          //
          //
          // ),



        ],
      ),


    );
  }
}
