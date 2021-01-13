import 'package:fyp/home.dart';
import 'package:fyp/teacher/screens/library/constant.dart';
import 'package:fyp/teacher/screens/QAM.dart';
import 'package:fyp/teacher/screens/models/Courses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_villains/villains/villains.dart';
import 'package:firebase_database/firebase_database.dart';
class declareresult extends StatefulWidget {
  // final Future<List<Cours/es>> courses;
  List subjects;
  String user_id;

  // User user;
  // Student(this.auth,this.user, {Key key}): super(key: key);
  declareresult({Key key, @required this.subjects,this.user_id}) : super(key: key);
  // marksScreen({this.courses});

  _declareresultScreenState createState() => _declareresultScreenState();
}

class _declareresultScreenState extends State<declareresult> {
  final databaseReference = FirebaseDatabase.instance.reference();
  @override
  void initState() {
    super.initState();
    set_subject();
  }
  Map calculate_gp(number){
    String Grade="";
    double CGPA=0;
    if(number>=90){
      Grade="A";
      CGPA=4.0;
    }
    else if(number>=85 && number<=89){
      Grade="A-";
      CGPA=3.7;
    }
    else if(number>=80 && number<=84){
      Grade="B+";
      CGPA=3.3;
    }
    else if(number>=75 && number<=79){
      Grade="B";
      CGPA=3.0;
    }
    else if(number>=70 && number<=74){
      Grade="B-";
      CGPA=2.7;
    }
    else if(number>=65 && number<=69){
      Grade="C+";
      CGPA=2.3;
    }
    else if(number>=60 && number<=64){
      Grade="C";
      CGPA=2.0;
    }
    else if(number>=55 && number<=59){
      Grade="C-";
      CGPA=1.7;
    }
    else if(number>=50 && number<=54){
      Grade="D";
      CGPA=1.3;
    }
    else if(number<50){
      Grade="F";
      CGPA=0;
    }
    return {"grade":Grade,"gp":CGPA};
  }
  showAlertDialog(BuildContext context) {

    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () { Navigator.pop(context);},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Result Declared"),
      content: Text("Result has been Uploaded"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
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
            onTap: () async{
              print("hell\n\n\n");
              print(widget.subjects[i]);
              var snapshot = await databaseReference.child('batch/${widget.subjects[i]['batch']}');
              snapshot.once().then((DataSnapshot snapshot){
                var values = snapshot.value;
                // print("values");
                // print(values);
                var total_objects=values.length;
                var index=0;
                values['students'].forEach((element) async{
                  var snapshot = await databaseReference.child('marks/${element.toString()}/${widget.subjects[i]['subject_id']}/');
                  snapshot.once().then((DataSnapshot snapshot) async{
                    Map<dynamic, dynamic> values = snapshot.value;
                    var total_objects=values.length;
                    var total_quiz=0;
                    var obt_quiz=0;
                    double final_quiz=0;
                    var total_assignment=0;
                    var obt_assignment=0;
                    double final_assignment=0;
                    var total_ses1=0;
                    var obt_ses1=0;
                    double final_ses1=0;

                    var total_ses2=0;
                    var obt_ses2=0;
                    double final_ses2=0;
                    var total_final=0;
                    var obt_final=0;
                    double final_final=0;

                    var index=0;
                    values.forEach((key,values) async{
                      if(key=="quiz"){
                        print("QUIZ\n\n\n");
                        print(values);
                        for(int i=0;i<values.length;i++){
                        total_quiz+=int.parse(values[i]['total_marks']);
                        obt_quiz+=int.parse(values[i]['obtained_marks']);
                        }
                        final_quiz=double.parse(((obt_quiz/total_quiz)*15).toStringAsFixed(2));
                        // print(((obt_quiz/total_quiz)*15).toStringAsFixed(2));
                      }
                      else if(key=="assignment"){
                        for(int i=0;i<values.length;i++){
                          total_assignment+=int.parse(values[i]['total_marks']);
                          obt_assignment+=int.parse(values[i]['obtained_marks']);
                        }
                        final_assignment=double.parse(((obt_assignment/total_assignment)*10).toStringAsFixed(2));
                        // print(((obt_assignment/total_assignment)*10).toStringAsFixed(2));

                      }
                      else if(key=="sessional1"){
                        for(int i=0;i<values.length;i++){
                          total_ses1+=int.parse(values[i]['total_marks']);
                          obt_ses1+=int.parse(values[i]['obtained_marks']);
                        }
                        final_ses1=double.parse(((obt_ses1/total_ses1)*10).toStringAsFixed(2));
                        // print(((obt_ses1/total_ses1)*10).toStringAsFixed(2));
                      }
                      else if(key=="sessional2"){
                        for(int i=0;i<values.length;i++){
                          total_ses2+=int.parse(values[i]['total_marks']);
                          obt_ses2+=int.parse(values[i]['obtained_marks']);
                        }
                        final_ses2=double.parse(((obt_ses2/total_ses2)*15).toStringAsFixed(2));
                        // print(((obt_ses2/total_ses2)*15).toStringAsFixed(2));
                      }
                      else if(key=="final"){
                        for(int i=0;i<values.length;i++){
                          total_final+=int.parse(values[i]['total_marks']);
                          obt_final+=int.parse(values[i]['obtained_marks']);
                        }
                        final_final=double.parse(((obt_final/total_final)*50).toStringAsFixed(2));
                        // print(((obt_final/total_final)*50).toStringAsFixed(2));
                      }

                    });
                    final number=final_quiz+final_assignment+final_ses1+final_ses2+final_final;
                    print("number\n\n\n");
                    print(number);
                    var gp_=calculate_gp(number);
                    // print(calculate_gp(number));
                    DataSnapshot dataSnapshot2 =  await databaseReference.child('student/${element.toString()}/semester_no').once();
                    var semester=dataSnapshot2.value;
                    DataSnapshot dataSnapshot3 =  await databaseReference.child('result/${element.toString()}/Semester ${semester}/').once();
                    var semester_count_result;
                    if(dataSnapshot3.value!=null){
                      semester_count_result = dataSnapshot3.value.length;
                    }
                    else {
                       semester_count_result = 0;
                    }

                    await databaseReference.child('result/${element.toString()}/Semester ${semester}/${semester_count_result}').update({
                      "GP":gp_['gp'],
                      "grade":gp_['grade'],
                      "Marks":number,
                      "subject_name":widget.subjects[i]['subject_name'],
                      "credit":widget.subjects[i]['credit'],
                      "course_no":widget.subjects[i]['course_code']
                    });


                  });
                  // setState(() {
                  //   data_student[key]=values;
                  //
                  // });
                  // get_name(element);
                  // get_subjet(element);
                  // student_id.add(element);
                  // print(element);
                  // // print(values);
                  // index+=1;
                  // if(index==total_objects){
                  //   setState(() {
                  //     collect_data=false;
                  //   });
                  // }
                });
              });
              showAlertDialog(context);
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
