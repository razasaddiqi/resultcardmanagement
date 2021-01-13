import 'package:flutter/material.dart';
import 'package:fyp/subjetinfo/infos.dart';
import 'package:fyp/student/stdntlogin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/src/painting/basic_types.dart' as my_axis;
// import 'package:flutter/ .dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_firestore/firebase_firestore.dart';
// import 'package:resultcardmanagement/facultyloginPage.dart';
var green = Color(0xFF4caf6a);
var greenLight = Color(0xFFd8ebde);

var red = Color(0xFFf36169);
var redLight = Color(0xFFf2dcdf);

var blue = Color(0xFF398bcf);
var blueLight = Color(0xFFc1dbee);

class result extends StatefulWidget {
  FirebaseAuth auth;
  User user;
  // Student(this.auth,this.user, {Key key}): super(key: key);
  result({Key key, @required this.auth,this.user}) : super(key: key);
  @override
  _resultState createState() => _resultState();
}

class _resultState extends State<result> {
  bool collect_data=true;
  var data_student = new Map();
  var season='';
  var year='';
  var program='';
  final databaseReference = FirebaseDatabase.instance.reference();
  List<String> credit=[];
  List<String> code=[];
  List<String> subject=[];
  List<String> teacher=[];
  // FirebaseAuth auth;
  // User user;
  // _StudentState({Key key, @required this.auth,this.user});
  // final Student todo;
  // todo.user;
  // widget.auth;
  @override
  // TODO: implement widget
  // Student  widget;
  // TODO: implement widget
  // var auth;
  // var data;
  // Student get widget {
  //   auth=super.widget.auth;
  //   auth.si
  // }
  // TODO: implement widget
  // Student get widget => super.widget;
  List<DataRow> subjects=[];
  // widget.us
  @override
  void initState() {

    super.initState();
    getData();

    // get_subjet();
    // print(subjects);
    // collect_data=false;
  }
  Future<bool> getData() async{
    var snapshot = await databaseReference.child('student/${widget.user.uid}');
    snapshot.once().then((DataSnapshot snapshot){
      Map<dynamic, dynamic> values = snapshot.value;
      var total_objects=values.length;
      var index=0;
      values.forEach((key,values) {
        if(key=='season' && values=='Spring'){
          season="SP";
        }
        else{
          season ="FA";
        }
        setState(() {
          data_student[key]=values;

        });

        // print(key);
        // print(values);
        index+=1;
        if(index==total_objects){
          setState(() {
            collect_data=false;
          });
        }
      });
    });
    return true;
  }

  // Future<String> getEmail() async {
  //
  //   data_student['subjects'].forEach((element)  {
  //     var snapshot =   databaseReference.child('subjects/subject_name/${element}');
  //     snapshot.once().then((DataSnapshot snapshot){
  //       Map<dynamic, dynamic> values = snapshot.value;
  //       values.forEach((key,values) {
  //         // if(key=='season' && values=='Spring'){
  //         //   season="SP";
  //         // }
  //         // else{
  //         //   season ="FA";
  //         // }
  //         //
  //         // setState(() {
  //         //   data_student[key]=values;
  //         //   collect_data=false;
  //         // });
  //         setState(() {
  //           subjects.add(ClipRRect(
  //             borderRadius: BorderRadius.only(
  //               topLeft: Radius.circular(8.0),
  //               topRight: Radius.circular(8.0),
  //             ),
  //             child: Container(
  //               height: 70.0,
  //               width: 82.0,
  //               decoration: BoxDecoration(
  //                 color: Colors.blue,
  //                 border: Border.all(width: 2, color: Colors.grey
  //                 ),
  //               ),
  //
  //               child: InkWell(
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: <Widget>[
  //
  //                     Text(
  //                       '${values}',
  //                       style: TextStyle( fontSize: 15,
  //                           color: Colors.white, fontWeight: FontWeight.w800),
  //                     )
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ),);
  //         });
  //
  //         print(key);
  //         print(values);
  //       });
  //     });
  //   });
  // }
// void get_subjet(var values) {
//
//   values.forEach((element)  {
//   var snapshot =   databaseReference.child('subjects/subject_name/${element}');
//   snapshot.once().then((DataSnapshot snapshot){
//     Map<dynamic, dynamic> values = snapshot.value;
//     values.forEach((key,values) {
//       // if(key=='season' && values=='Spring'){
//       //   season="SP";
//       // }
//       // else{
//       //   season ="FA";
//       // }
//       //
//       // setState(() {
//       //   data_student[key]=values;
//       //   collect_data=false;
//       // });
//       setState(() {
//         subjects.add(               ClipRRect(
//           child: Container(
//             height: 70.0,
//             width: 82.0,
//             decoration: BoxDecoration(
//               border: Border.all(width: 2, color: Colors.grey
//               ),
//             ),
//
//             child: InkWell(
//
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//
//                   Text(
//                     '${values}',
//                     style: TextStyle( fontSize: 15,
//                         color: Colors.black, fontWeight: FontWeight.w800),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),);
//       });
//
//       // print(key);
//       // print(values);
//     });
//   });
// });
// // for(int i=0;i<data_student['subjects'].length,i++){
// //   print(data_student[i]);
// // }
// // return subjects;
//
// }
  var total_credit=0;
  double over_allgp=0;
  DataRow _getDataRow(result) {
    // if(result['CGPA'])
    total_credit+=int.parse(result['credit']);
    print(double.parse(result['GP'].toString()));
    over_allgp+=double.parse(result['GP'].toString())*int.parse(result['credit']);
    return DataRow(
      cells: <DataCell>[
        // DataCell( Text('${result['course_code']}',style: TextStyle(fontSize: 20),)),
        DataCell(Container(width: MediaQuery.of(context).size.width/3 ,child:Text('${result['subject_name']}',style: TextStyle(fontSize: 20),))  ),
        DataCell(Container(width:50,child:Text('${result['credit']}',style: TextStyle(fontSize: 20,),textAlign: TextAlign.center,))  ),
        DataCell(Text('${result['Marks']}',style: TextStyle(fontSize: 20),textAlign: TextAlign.center,)),
        DataCell(Container(width:50,child:Text('${result['GP']}',style: TextStyle(fontSize: 20,),textAlign: TextAlign.center,))  ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
      collect_data? Center(child:CircularProgressIndicator()):
      Column(
        children:<Widget>[
          Container(
              height: 420,
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
                  Container(
                      margin: EdgeInsets.only(top:30,left:20,right: 100),
                      height: 80,
                      width: 300,

                      decoration: new BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: new DecorationImage(
                            image: new AssetImage("images/logo3.png"),
                            fit: BoxFit.fill,
                          )
                      )

                  ),
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
                                    'Name: ${data_student['name']}' '\nRegistraion: ${season+data_student['year']+"-"+data_student['program']+"-"+data_student['regno'].toString()}' '\nProgram: ${data_student['program']}',
                                    style: TextStyle(
                                        color: Colors.white, fontWeight: FontWeight.w500),
                                  ),

                                  SizedBox(
                                    height: 10.0,
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
                                            image: new NetworkImage(data_student['photo']),
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
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Wrap(
                      spacing: 8.0,
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
                            color: greenLight,
                            child: InkWell(
                              onTap: (){
                                Navigator.pop(context);
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
                                    Icons.person,
                                    color: red,
                                  ),
                                  SizedBox(
                                    height: 4.0,
                                  ),
                                  Text(
                                    'Registraion\n  \t\tCard',
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
                                    Icons.account_balance,
                                    color: green,
                                  ),
                                  SizedBox(
                                    height: 4.0,
                                  ),
                                  Text(
                                    'Fee',
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
                                    'Result Card',
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

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.person_pin,
                                    color: red,
                                  ),
                                  SizedBox(
                                    height: 4.0,
                                  ),
                                  Text(
                                    'Profile',
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
                                widget.auth.signOut();
                                // Navigation
                                Navigator.pushReplacement(
                                    context, MaterialPageRoute(builder: (context) => LoginaPage()));
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.logout,
                                    color: green,
                                  ),
                                  SizedBox(
                                    height: 4.0,
                                  ),
                                  Text(
                                    'LogOut',
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
          SizedBox(
            height: 50,
          ),
          StreamBuilder(
            stream: databaseReference.child("result/${widget.user.uid}").onValue,
            builder: (context, snap) {
              print("IDDDDD");
              print(widget.user.uid);
              if (snap.hasData &&
                  !snap.hasError &&
                  snap.data.snapshot.value != null) {
                print(snap.data.snapshot.value);
                Map data = snap.data.snapshot.value;
                List item = [];

                // data.forEach(
                //         (index, data) => item.add({"key": index, ...data}));
                print("Recorddddd00");
                print(data['Semester 1']);
                return Expanded(
                  child: ListView.builder(
                    // padding: EdgeInsets.symmetric(horizontal: 50),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      total_credit=0;
                      over_allgp=0;
                      return Column(
                        
                        children:[
                          index>0?SizedBox(height: 20,):SizedBox(height: 0,),
                          Text("Semester ${index+1}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold), ),
                        SingleChildScrollView(

                          child: DataTable(
                            horizontalMargin: 5,
                            // columnSpacing: 500,
                            showBottomBorder: true,
                            dividerThickness: 1,
                            headingRowColor:
                            MaterialStateColor.resolveWith((states) => Colors.blue),
                            showCheckboxColumn: false,
                            columns: [
                              // DataColumn(label: Text(
                              //     'Code',
                              //     style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)
                              // )),
                              DataColumn(label: Text(
                                  'Name',
                                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)
                              )),
                              DataColumn(label: Text(
                                'Credit',
                                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              )),
                              DataColumn(

                                  label: Text(
                                    'Marks',
                                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  )),
                              DataColumn(
                                  label: Text(
                                    'GP',
                                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  )),
                            ],
                            rows: List.generate(
                                data['Semester ${index+1}'].length, (index_) => _getDataRow(data['Semester ${index+1}'][index_])),
                          ),
                          scrollDirection: my_axis.Axis.horizontal,
                        ),

                            Text("CGPA: ${over_allgp/total_credit}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                        ]
                      );
                    },
                  ),
                );
              } else
                return Center(child: Text("No data"));
            },
          ),
          // Row(
          //
          //   children: [
          //     Expanded(child: SingleChildScrollView(
          //       scrollDirection: Axis.horizontal,
          //       child: DataTable(
          //         // horizontalMargin: 0,
          //         // columnSpacing: 5,
          //         showBottomBorder: true,
          //         dividerThickness: 1,
          //         headingRowColor:
          //         MaterialStateColor.resolveWith((states) => Colors.blue),
          //         showCheckboxColumn: false,
          //         columns: [
          //           // DataColumn(label: Text(
          //           //     'Code',
          //           //     style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)
          //           // )),
          //           DataColumn(label: Text(
          //               'Course Name',
          //               style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)
          //           )),
          //           DataColumn(label: Text(
          //               'Credit',
          //               style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)
          //           )),
          //           DataColumn(
          //
          //               label: Text(
          //                   'Teacher Name',
          //                   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)
          //               )),
          //         ],
          //         rows: List.generate(
          //             data_student['subjects'].length, (index) => _getDataRow(data_student['subjects'][index])),
          //       ),
          //     )
          //     ),
          //   ],
          // ),


          // Container(
          //     height: 320,
          //     width: MediaQuery.of(context).size.width,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.only(
          //           bottomLeft: Radius.circular(60),
          //           bottomRight: Radius.circular(60)
          //
          //       ),
          //
          //     ),
          //     child:SingleChildScrollView(
          //         child:Flexible(child:Column(
          //           mainAxisAlignment: MainAxisAlignment.start,
          //           children: <Widget>[
          //             Padding(
          //               padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
          //             ),
          //             Padding(
          //               padding:  EdgeInsets.all(10.0),
          //               child: SingleChildScrollView(
          //                 //spacing: 8.0,
          //                 //runSpacing: 10.0,
          //                 child:Wrap(
          //                   direction: Axis.horizontal,
          //
          //                   children: subjects,
          //                   // <Widget>[
          //                   //   ClipRRect(
          //                   //     borderRadius: BorderRadius.only(
          //                   //       topLeft: Radius.circular(8.0),
          //                   //       topRight: Radius.circular(8.0),
          //                   //     ),
          //                   //     child: Container(
          //                   //       height: 70.0,
          //                   //       width: 82.0,
          //                   //       decoration: BoxDecoration(
          //                   //         color: Colors.blue,
          //                   //         border: Border.all(width: 2, color: Colors.grey
          //                   //         ),
          //                   //       ),
          //                   //
          //                   //       child: InkWell(
          //                   //         child: Column(
          //                   //           mainAxisAlignment: MainAxisAlignment.center,
          //                   //           children: <Widget>[
          //                   //
          //                   //             Text(
          //                   //               'Course No',
          //                   //               style: TextStyle( fontSize: 15,
          //                   //                   color: Colors.white, fontWeight: FontWeight.w800),
          //                   //             )
          //                   //           ],
          //                   //         ),
          //                   //       ),
          //                   //     ),
          //                   //   ),
          //                   //   ClipRRect(
          //                   //     borderRadius: BorderRadius.only(
          //                   //       topLeft: Radius.circular(8.0),
          //                   //       topRight: Radius.circular(8.0),
          //                   //     ),
          //                   //     child: Container(
          //                   //       height: 70.0,
          //                   //       width: 82.0,
          //                   //       decoration: BoxDecoration(
          //                   //         color: Colors.blue,
          //                   //         border: Border.all(width: 2, color: Colors.grey
          //                   //         ),
          //                   //       ),
          //                   //
          //                   //       child: InkWell(
          //                   //         child: Column(
          //                   //           mainAxisAlignment: MainAxisAlignment.center,
          //                   //           children: <Widget>[
          //                   //
          //                   //             Text(
          //                   //               'Course\n Name',
          //                   //               style: TextStyle( fontSize: 15,
          //                   //                   color: Colors.white, fontWeight: FontWeight.w800),
          //                   //             )
          //                   //           ],
          //                   //         ),
          //                   //       ),
          //                   //     ),
          //                   //   ),
          //                   //   ClipRRect(
          //                   //     borderRadius: BorderRadius.only(
          //                   //       topLeft: Radius.circular(8.0),
          //                   //       topRight: Radius.circular(8.0),
          //                   //     ),
          //                   //     child: Container(
          //                   //       height: 70.0,
          //                   //       width: 82.0,
          //                   //       decoration: BoxDecoration(
          //                   //         color: Colors.blue,
          //                   //         border: Border.all(width: 2, color: Colors.grey
          //                   //         ),
          //                   //       ),
          //                   //
          //                   //       child: InkWell(
          //                   //         child: Column(
          //                   //           mainAxisAlignment: MainAxisAlignment.center,
          //                   //           children: <Widget>[
          //                   //
          //                   //             Text(
          //                   //               'Credits',
          //                   //               style: TextStyle( fontSize: 15,
          //                   //                   color: Colors.white, fontWeight: FontWeight.w800),
          //                   //             )
          //                   //           ],
          //                   //         ),
          //                   //       ),
          //                   //     ),
          //                   //   ),
          //                   //   ClipRRect(
          //                   //     borderRadius: BorderRadius.only(
          //                   //       topLeft: Radius.circular(8.0),
          //                   //       topRight: Radius.circular(8.0),
          //                   //     ),
          //                   //     child: Container(
          //                   //       height: 70.0,
          //                   //       width: 82.0,
          //                   //       decoration: BoxDecoration(
          //                   //         color: Colors.blue,
          //                   //         border: Border.all(width: 2, color: Colors.grey
          //                   //         ),
          //                   //       ),
          //                   //
          //                   //       child: InkWell(
          //                   //
          //                   //         child: Column(
          //                   //           mainAxisAlignment: MainAxisAlignment.center,
          //                   //           children: <Widget>[
          //                   //
          //                   //             Text(
          //                   //               'Teacher',
          //                   //               style: TextStyle( fontSize: 15,
          //                   //                   color: Colors.white, fontWeight: FontWeight.w800),
          //                   //             )
          //                   //           ],
          //                   //         ),
          //                   //       ),
          //                   //     ),
          //                   //   ),
          //                   //   ClipRRect(
          //                   //     child: Container(
          //                   //       height: 70.0,
          //                   //       width: 82.0,
          //                   //       decoration: BoxDecoration(
          //                   //         border: Border.all(width: 2, color: Colors.grey
          //                   //         ),
          //                   //       ),
          //                   //
          //                   //       child: InkWell(
          //                   //
          //                   //         child: Column(
          //                   //           mainAxisAlignment: MainAxisAlignment.center,
          //                   //           children: <Widget>[
          //                   //
          //                   //             Text(
          //                   //               ' MGT131 ',
          //                   //               style: TextStyle( fontSize: 15,
          //                   //                   color: Colors.black, fontWeight: FontWeight.w800),
          //                   //             )
          //                   //           ],
          //                   //         ),
          //                   //       ),
          //                   //     ),
          //                   //   ),
          //                   //   ClipRRect(
          //                   //     child: Container(
          //                   //       height: 70.0,
          //                   //       width: 82.0,
          //                   //       decoration: BoxDecoration(
          //                   //         border: Border.all(width: 2, color: Colors.grey
          //                   //         ),
          //                   //       ),
          //                   //
          //                   //       child: InkWell(
          //                   //         onTap: () {
          //                   //           Navigator.push(
          //                   //               context,
          //                   //               MaterialPageRoute(
          //                   //                   builder: (context) => info()));
          //                   //         },
          //                   //
          //                   //         child: Column(
          //                   //           mainAxisAlignment: MainAxisAlignment.center,
          //                   //           children: <Widget>[
          //                   //
          //                   //             Text(
          //                   //               ' Accounting\n\t\tFinance',
          //                   //               style: TextStyle( fontSize: 12,
          //                   //                   color: Colors.black, fontWeight: FontWeight.w800),
          //                   //             )
          //                   //           ],
          //                   //         ),
          //                   //       ),
          //                   //     ),
          //                   //   ),
          //                   //   ClipRRect(
          //                   //     child: Container(
          //                   //       height: 70.0,
          //                   //       width: 82.0,
          //                   //       decoration: BoxDecoration(
          //                   //         border: Border.all(width: 2, color: Colors.grey
          //                   //         ),
          //                   //       ),
          //                   //
          //                   //       child: InkWell(
          //                   //
          //                   //         child: Column(
          //                   //           mainAxisAlignment: MainAxisAlignment.center,
          //                   //           children: <Widget>[
          //                   //
          //                   //             Text(
          //                   //               ' 3 ',
          //                   //               style: TextStyle( fontSize: 15,
          //                   //                   color: Colors.black, fontWeight: FontWeight.w800),
          //                   //             )
          //                   //           ],
          //                   //         ),
          //                   //       ),
          //                   //     ),
          //                   //   ),
          //                   //   ClipRRect(
          //                   //     child: Container(
          //                   //       height: 70.0,
          //                   //       width: 82.0,
          //                   //       decoration: BoxDecoration(
          //                   //         border: Border.all(width: 2, color: Colors.grey
          //                   //         ),
          //                   //       ),
          //                   //
          //                   //       child: InkWell(
          //                   //
          //                   //         child: Column(
          //                   //           mainAxisAlignment: MainAxisAlignment.center,
          //                   //           children: <Widget>[
          //                   //
          //                   //             Text(
          //                   //               ' Ishfaq\nAhmad ',
          //                   //               style: TextStyle( fontSize: 15,
          //                   //                   color: Colors.black, fontWeight: FontWeight.w800),
          //                   //             )
          //                   //           ],
          //                   //         ),
          //                   //       ),
          //                   //     ),
          //                   //   ),
          //                   //   ClipRRect(
          //                   //     child: Container(
          //                   //       height: 70.0,
          //                   //       width: 82.0,
          //                   //       decoration: BoxDecoration(
          //                   //         border: Border.all(width: 2, color: Colors.grey
          //                   //         ),
          //                   //       ),
          //                   //
          //                   //       child: InkWell(
          //                   //
          //                   //         child: Column(
          //                   //           mainAxisAlignment: MainAxisAlignment.center,
          //                   //           children: <Widget>[
          //                   //
          //                   //             Text(
          //                   //               ' CSC495  ',
          //                   //               style: TextStyle( fontSize: 15,
          //                   //                   color: Colors.black, fontWeight: FontWeight.w800),
          //                   //             )
          //                   //           ],
          //                   //         ),
          //                   //       ),
          //                   //     ),
          //                   //   ),
          //                   //   ClipRRect(
          //                   //     child: Container(
          //                   //       height: 70.0,
          //                   //       width: 82.0,
          //                   //       decoration: BoxDecoration(
          //                   //         border: Border.all(width: 2, color: Colors.grey
          //                   //         ),
          //                   //       ),
          //                   //
          //                   //       child: InkWell(
          //                   //         onTap: () {
          //                   //           Navigator.push(
          //                   //               context,
          //                   //               MaterialPageRoute(
          //                   //                   builder: (context) => info()));
          //                   //         },
          //                   //
          //                   //         child: Column(
          //                   //           mainAxisAlignment: MainAxisAlignment.center,
          //                   //           children: <Widget>[
          //                   //
          //                   //             Text(
          //                   //               'MAD',
          //                   //               style: TextStyle( fontSize: 15,
          //                   //                   color: Colors.black, fontWeight: FontWeight.w800),
          //                   //             )
          //                   //           ],
          //                   //         ),
          //                   //       ),
          //                   //     ),
          //                   //   ),
          //                   //   ClipRRect(
          //                   //     child: Container(
          //                   //       height: 70.0,
          //                   //       width: 82.0,
          //                   //       decoration: BoxDecoration(
          //                   //         border: Border.all(width: 2, color: Colors.grey
          //                   //         ),
          //                   //       ),
          //                   //
          //                   //       child: InkWell(
          //                   //
          //                   //         child: Column(
          //                   //           mainAxisAlignment: MainAxisAlignment.center,
          //                   //           children: <Widget>[
          //                   //
          //                   //             Text(
          //                   //               ' 3 ',
          //                   //               style: TextStyle( fontSize: 15,
          //                   //                   color: Colors.black, fontWeight: FontWeight.w800),
          //                   //             )
          //                   //           ],
          //                   //         ),
          //                   //       ),
          //                   //     ),
          //                   //   ),
          //                   //   ClipRRect(
          //                   //     child: Container(
          //                   //       height: 70.0,
          //                   //       width: 82.0,
          //                   //       decoration: BoxDecoration(
          //                   //         border: Border.all(width: 2, color: Colors.grey
          //                   //         ),
          //                   //       ),
          //                   //
          //                   //       child: InkWell(
          //                   //
          //                   //         child: Column(
          //                   //           mainAxisAlignment: MainAxisAlignment.center,
          //                   //           children: <Widget>[
          //                   //
          //                   //             Text(
          //                   //               'Muhammad\n\t Abdullah ',
          //                   //               style: TextStyle( fontSize: 13,
          //                   //                   color: Colors.black, fontWeight: FontWeight.w800),
          //                   //             )
          //                   //           ],
          //                   //         ),
          //                   //       ),
          //                   //     ),
          //                   //   ),
          //                   //   ClipRRect(
          //                   //     child: Container(
          //                   //       height: 70.0,
          //                   //       width: 82.0,
          //                   //       decoration: BoxDecoration(
          //                   //         border: Border.all(width: 2, color: Colors.grey
          //                   //         ),
          //                   //       ),
          //                   //
          //                   //       child: InkWell(
          //                   //
          //                   //         child: Column(
          //                   //           mainAxisAlignment: MainAxisAlignment.center,
          //                   //           children: <Widget>[
          //                   //
          //                   //             Text(
          //                   //               ' CSC303',
          //                   //               style: TextStyle( fontSize: 15,
          //                   //                   color: Colors.black, fontWeight: FontWeight.w800),
          //                   //             )
          //                   //           ],
          //                   //         ),
          //                   //       ),
          //                   //     ),
          //                   //   ),
          //                   //   ClipRRect(
          //                   //     child: Container(
          //                   //       height: 70.0,
          //                   //       width: 82.0,
          //                   //       decoration: BoxDecoration(
          //                   //         border: Border.all(width: 2, color: Colors.grey
          //                   //         ),
          //                   //       ),
          //                   //
          //                   //       child: InkWell(
          //                   //         onTap: () {
          //                   //           Navigator.push(
          //                   //               context,
          //                   //               MaterialPageRoute(
          //                   //                   builder: (context) => info()));
          //                   //         },
          //                   //
          //                   //         child: Column(
          //                   //           mainAxisAlignment: MainAxisAlignment.center,
          //                   //           children: <Widget>[
          //                   //
          //                   //             Text(
          //                   //               ' Unity 3d',
          //                   //               style: TextStyle( fontSize: 15,
          //                   //                   color: Colors.black, fontWeight: FontWeight.w800),
          //                   //             )
          //                   //           ],
          //                   //         ),
          //                   //       ),
          //                   //     ),
          //                   //   ),
          //                   //   ClipRRect(
          //                   //     child: Container(
          //                   //       height: 70.0,
          //                   //       width: 82.0,
          //                   //       decoration: BoxDecoration(
          //                   //         border: Border.all(width: 2, color: Colors.grey
          //                   //         ),
          //                   //       ),
          //                   //
          //                   //       child: InkWell(
          //                   //
          //                   //         child: Column(
          //                   //           mainAxisAlignment: MainAxisAlignment.center,
          //                   //           children: <Widget>[
          //                   //
          //                   //             Text(
          //                   //               ' 3 ',
          //                   //               style: TextStyle( fontSize: 15,
          //                   //                   color: Colors.black, fontWeight: FontWeight.w800),
          //                   //             )
          //                   //           ],
          //                   //         ),
          //                   //       ),
          //                   //     ),
          //                   //   ),
          //                   //   ClipRRect(
          //                   //     child: Container(
          //                   //       height: 70.0,
          //                   //       width: 82.0,
          //                   //       decoration: BoxDecoration(
          //                   //         border: Border.all(width: 2, color: Colors.grey
          //                   //         ),
          //                   //       ),
          //                   //
          //                   //       child: InkWell(
          //                   //
          //                   //         child: Column(
          //                   //           mainAxisAlignment: MainAxisAlignment.center,
          //                   //           children: <Widget>[
          //                   //
          //                   //             Text(
          //                   //               'Rashid\nJhangir ',
          //                   //               style: TextStyle( fontSize: 15,
          //                   //                   color: Colors.black, fontWeight: FontWeight.w800),
          //                   //             )
          //                   //           ],
          //                   //         ),
          //                   //       ),
          //                   //     ),
          //                   //   ),
          //                   //
          //                   //
          //                   //
          //                   //
          //                   // ],
          //                 ),
          //               ),
          //             ),
          //           ],
          //         )))
          //
          //
          // ),


        ],
      ),



    );
  }
}
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: Container(
//       child: StreamBuilder(
//         stream:  databaseReference. collection("posts").snapshots(),
//         builder:
//             (BuildContext context,  snapshot) {
//           if (snapshot.hasError) {
//             return new Text('Error: ${snapshot.error}');
//           }
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Text("Loading..."),
//                   SizedBox(
//                     height: 50.0,
//                   ),
//                   CircularProgressIndicator()
//                 ],
//               ),
//             );
//           } else {
//             return ListView.builder(
//               itemCount: snapshot.data.documents.length,
//               itemBuilder: (_, index) {
//                 return Card(
//                   child: ListTile(
//                     title: Text(
//                         snapshot.data.documents[index].data["title"]),        // getting the data from firestore
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     ),
//   );
// }
