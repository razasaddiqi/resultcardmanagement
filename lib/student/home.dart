import 'package:flutter/material.dart';
import 'package:fyp/subjetinfo/infos.dart';
import 'package:fyp/student/stdntlogin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'result.dart';
// import 'package:resultcardmanagement/facultyloginPage.dart';
var green = Color(0xFF4caf6a);
var greenLight = Color(0xFFd8ebde);

var red = Color(0xFFf36169);
var redLight = Color(0xFFf2dcdf);

var blue = Color(0xFF398bcf);
var blueLight = Color(0xFFc1dbee);

class Student extends StatefulWidget {
  FirebaseAuth auth;
  User user;
  // Student(this.auth,this.user, {Key key}): super(key: key);
  Student({Key key, @required this.auth,this.user}) : super(key: key);
  @override
  _StudentState createState() => _StudentState();
}

class _StudentState extends State<Student> {
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
  Student get widget => super.widget;
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
  DataRow _getDataRow(result) {
    return DataRow(
      onSelectChanged: (newValue) {
        print('row ${newValue} pressed');
                  Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => info(subject_id: result['subject_id'].toString(),user: widget.user,photo_url: data_student['photo'],course_code: result['course_code'],course_credit: result['credit'],student_name: data_student['name'],course_name: result['subject_name'],teacher_name: result['teacher_name'],)));
      },
      cells: <DataCell>[
        // DataCell( Text('${result['course_code']}',style: TextStyle(fontSize: 20),)),
        DataCell(Text('${result['subject_name']}',style: TextStyle(fontSize: 20),)),
        DataCell(Container(width:10,child:Text('${result['credit']}',style: TextStyle(fontSize: 20),))  ),
        DataCell(Text('${result['teacher_name']}',style: TextStyle(fontSize: 20),)),
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
                                  getData();
                                  print(data_student);
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
                                onTap: (){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => result(auth: widget.auth,user: widget.user,)));
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
            Row(

              children: [
                Expanded(child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    // horizontalMargin: 0,
                    // columnSpacing: 5,
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
                          'Course Name',
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)
                      )),
                      DataColumn(label: Text(
                          'Credit',
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)
                      )),
                      DataColumn(

                          label: Text(
                              'Teacher Name',
                              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)
                          )),
                    ],
                    rows: List.generate(
                        data_student['subjects'].length, (index) => _getDataRow(data_student['subjects'][index])),
                  ),
                )
                ),
              ],
            ),


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
