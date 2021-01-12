import 'package:fyp/home.dart';
import 'package:fyp/teacher/screens/library/constant.dart';
import 'package:fyp/teacher/screens/models/Courses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_villains/villains/villains.dart';
import 'package:firebase_database/firebase_database.dart';
class slist extends StatefulWidget {
  String subject_id;
  String batch;
  String type;
  // User user;
  // Student(this.auth,this.user, {Key key}): super(key: key);
  slist({Key key, @required this.subject_id,this.batch,this.type}) : super(key: key);

  _slistState createState() => _slistState();
}

class _slistState extends State<slist> {
  @override
  void initState() {
    super.initState();
    // focus.add(textSecondFocusNode);
    getData();
    // print("current_no");
    // prin
  }
  final TextEditingController total_marks_controller = TextEditingController();
  var marks_controller = <TextEditingController>[];
  var focus =<FocusNode>[];
  FocusNode textSecondFocusNode = new FocusNode();

  // final TextEditingController _passwordController = TextEditingController();
  List<Widget> student =[];
  List<int> current_no=[];
  final now = new DateTime.now();
  var today_date;
  // String formatter = DateFormat('yMd').format(now);
  final databaseReference = FirebaseDatabase.instance.reference();
  bool collect_data=true;
  var data_student = new Map();
  List student_id=[];
  Future<bool> getData() async{
    print(widget.batch);
    // print(widget.batch);
    var snapshot = await databaseReference.child('batch/${widget.batch}');
    snapshot.once().then((DataSnapshot snapshot){
      var values = snapshot.value;
      print("values");
      print(values);
      var total_objects=values.length;
      var index=0;
      values['students'].forEach((element) {

        // setState(() {
        //   data_student[key]=values;
        //
        // });
        get_name(element);
        get_subjet(element);
        student_id.add(element);
        print(element);
        // print(values);
        index+=1;
        if(index==total_objects){
          setState(() {
            collect_data=false;
          });
        }
      });
    });
    print(current_no);
    return true;
  }
List st_names=[];
  Future get_name(var element) async{
    var snapshot =   await databaseReference.child('student/${element.toString()}/name');
    snapshot.once().then((DataSnapshot snapshot){
      // print("Snapshot");
      // print(snapshot.value);
      setState(() {
        st_names.add(snapshot.value);
        var textEditingController = new TextEditingController();
        marks_controller.add(textEditingController);
        FocusNode textSecondFocusNode = new FocusNode();
        focus.add(textSecondFocusNode);
      });
    });
  }
  Future get_subjet(var element) async{
    var snapshot =   await databaseReference.child('marks/${element.toString()}/${widget.subject_id}/${widget.type}');
    // print(snapshot);
    snapshot.once().then((DataSnapshot snapshot){
      print("snap\n\n\n");
      if(snapshot.value!=null){
        current_no.add(snapshot.value.length);
      }
      else{
        current_no.add(0);
      }
      print(snapshot.value);
      // Map<dynamic, dynamic> values = snapshot.value;
      // print("Values\n\n\n\n");
      // print(values);
      // try {
      //   print(values.length);
      //   values.forEach((key, values) {
      //     if (key == widget.type) {
      //       if (values.length > 0) {
      //         current_no.add(values.length);
      //       }
      //       else{
      //         current_no.add(0);
      //       }
      //     }
      //   });
      // }
      // catch(e){
      //   print("error");
      //   current_no.add(0);
      // }
    });
// for(int i=0;i<data_student['subjects'].length,i++){
//   print(data_student[i]);
// }
// return subjects;

  }
  DataRow _getDataRow(result,index) {
   today_date=now.day.toString()+"-"+now.month.toString()+"-"+now.year.toString();
    // var node_index=index+1;
    print(index);
    print(st_names.length);
    if(index==(st_names.length-1)){
      return DataRow(
        onSelectChanged: (newValue) {
          print('row ${newValue} pressed');
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => info(subject_id: result['subject_id'].toString(),user: widget.user,)));
        },
        cells: <DataCell>[
          // DataCell( Text('${result['course_code']}',style: TextStyle(fontSize: 20),)),
          DataCell(Text('${result}',style: TextStyle(fontSize: 20),)),

          DataCell( TextField(keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
            focusNode: focus[index],
            onSubmitted: (_) => focus[index].unfocus(),
            textInputAction: TextInputAction.done,
            controller:  marks_controller[index],
            onChanged: (String value) {
              try {
                if(int.parse(value) >= 1 && int.parse(value) <= int.parse(total_marks_controller.text)) {

                  print(value);
                }
                else{
                  marks_controller[index].clear();
                }
              } catch (e) {print(e);marks_controller[index].clear();}},


          )),
          // DataCell(Text('10',style: TextStyle(fontSize: 20),)),
          DataCell(Text('${today_date}',style: TextStyle(fontSize: 20),)),
        ],
      );
    }
    else{
    return DataRow(
      onSelectChanged: (newValue) {
        print('row ${newValue} pressed');
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => info(subject_id: result['subject_id'].toString(),user: widget.user,)));
      },
      cells: <DataCell>[
        // DataCell( Text('${result['course_code']}',style: TextStyle(fontSize: 20),)),
        DataCell(Text('${result}',style: TextStyle(fontSize: 20),)),

        DataCell( TextField(keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
          focusNode: focus[index],
          onEditingComplete: () => focus[index+1].requestFocus(),
          textInputAction: TextInputAction.next,
          controller:  marks_controller[index],
          onChanged: (String value) {
            try {
            if(int.parse(value) >= 1 && int.parse(value) <= int.parse(total_marks_controller.text)) {

                print(value);
            }
            else{
              marks_controller[index].clear();
            }
            } catch (e) {print(e);marks_controller[index].clear();}},


        )),
        // DataCell(Text('10',style: TextStyle(fontSize: 20),)),
        DataCell(Text('${today_date}',style: TextStyle(fontSize: 20),)),
      ],
    );}

  }
  void upload_marks(){
    print(current_no);
    for(int i=0;i<student_id.length;i++) {
      databaseReference.child("marks/${student_id[i]}/${widget.subject_id}/${widget.type}/${current_no[i]}").set({
        'date': today_date,
        'obtained_marks': marks_controller[i].text,
        "total_marks":total_marks_controller.text
      });
      marks_controller[i].clear();

    }
    total_marks_controller.clear();
}
  showAlertDialog(BuildContext context) {

    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () { Navigator.pop(context);},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Marks Uploaded"),
      content: Text("Student Marks Uploaded Successfully"),
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
  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
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
                        'Sections Program name ',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: white, fontSize: 15.0),
                      ),
                      SizedBox(
                        width: 50,
                      ),

                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 250),
                child:   TextField(
                  onEditingComplete: () => focus[0].requestFocus(),
                  textInputAction: TextInputAction.next,
                  controller: total_marks_controller,
                  textAlign: TextAlign.left,
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Total Marks",
                    hintText: "Please enter total marks of ${widget.type}"
                  ),
                ),
              ),
              SizedBox(height: 100,),
              Center(
                child: Container(
                    margin: EdgeInsets.only(top: 315),
                    width: 500,
                    height: 500,
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
                        // Row(
                        //   children: [
                        //     Text("Total Marks"),
                        //     TextField()
                        //   ],
                        // ),

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
                                ' Student Details',
                                style: TextStyle( fontSize: 20,
                                    color: Colors.white, fontWeight: FontWeight.w700),
                              )
                            ],
                          ),

                        ),
                        Container(
                          // height: 300,
                          child:Expanded(
                            child: SingleChildScrollView(
                              //spacing: 8.0,
                              //runSpacing: 10.0,
                              child: DataTable(
                                horizontalMargin: 0,
                                columnSpacing: 5,
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
                                      'Marks',
                                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)
                                  )),
                                  // DataColumn(
                                  //
                                  //     label: Text(
                                  //         'Total Marks',
                                  //         style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)
                                  //     )),
                                  DataColumn(

                                      label: Text(
                                          'Date',
                                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)
                                      )),
                                ],
                                rows: List.generate(
                                    st_names.length, (index) => _getDataRow(st_names[index],index)),
                              ),
                              // Wrap(
                              //   direction: Axis.horizontal,
                              //
                              //   children: <Widget>[
                              //     ClipRRect(
                              //       borderRadius: BorderRadius.only(
                              //         topLeft: Radius.circular(8.0),
                              //         topRight: Radius.circular(8.0),
                              //       ),
                              //       child: Container(
                              //         height: 50.0,
                              //         width: 82.0,
                              //         decoration: BoxDecoration(
                              //           color: greenLight,
                              //           border: Border.all(width: 1, color: green
                              //           ),
                              //         ),
                              //
                              //         child: InkWell(
                              //           child: Column(
                              //             mainAxisAlignment: MainAxisAlignment.center,
                              //             children: <Widget>[
                              //
                              //               Text(
                              //                 'Student Name',
                              //                 style: TextStyle( fontSize: 15,
                              //                     color: green, fontWeight: FontWeight.w800),
                              //               )
                              //             ],
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //     ClipRRect(
                              //       borderRadius: BorderRadius.only(
                              //         topLeft: Radius.circular(8.0),
                              //         topRight: Radius.circular(8.0),
                              //       ),
                              //       child: Container(
                              //         height: 50.0,
                              //         width: 82.0,
                              //         decoration: BoxDecoration(
                              //           color: greenLight,
                              //           border: Border.all(width: 1, color: green
                              //           ),
                              //         ),
                              //
                              //         child: InkWell(
                              //           child: Column(
                              //             mainAxisAlignment: MainAxisAlignment.center,
                              //             children: <Widget>[
                              //
                              //               Text(
                              //                 'Obtained\n\tMarks',
                              //                 style: TextStyle( fontSize: 15,
                              //                     color: green, fontWeight: FontWeight.w800),
                              //               )
                              //             ],
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //     ClipRRect(
                              //       borderRadius: BorderRadius.only(
                              //         topLeft: Radius.circular(8.0),
                              //         topRight: Radius.circular(8.0),
                              //       ),
                              //       child: Container(
                              //         height: 50.0,
                              //         width: 82.0,
                              //         decoration: BoxDecoration(
                              //           color: greenLight,
                              //           border: Border.all(width: 1, color: green
                              //           ),
                              //         ),
                              //
                              //         child: InkWell(
                              //           child: Column(
                              //             mainAxisAlignment: MainAxisAlignment.center,
                              //             children: <Widget>[
                              //
                              //               Text(
                              //                 '\tTotal\n\tMarks',
                              //                 style: TextStyle( fontSize: 15,
                              //                     color: green, fontWeight: FontWeight.w800),
                              //               )
                              //             ],
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //     ClipRRect(
                              //       borderRadius: BorderRadius.only(
                              //         topLeft: Radius.circular(8.0),
                              //         topRight: Radius.circular(8.0),
                              //       ),
                              //       child: Container(
                              //         height: 50.0,
                              //         width: 82.0,
                              //         decoration: BoxDecoration(
                              //           color: greenLight,
                              //           border: Border.all(width: 1, color: green
                              //           ),
                              //         ),
                              //
                              //         child: InkWell(
                              //           child: Column(
                              //             mainAxisAlignment: MainAxisAlignment.center,
                              //             children: <Widget>[
                              //
                              //               Text(
                              //                 'Date Time',
                              //                 style: TextStyle( fontSize: 15,
                              //                     color: green, fontWeight: FontWeight.w800),
                              //               )
                              //             ],
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //     ClipRRect(
                              //       borderRadius: BorderRadius.only(
                              //         topLeft: Radius.circular(8.0),
                              //         topRight: Radius.circular(8.0),
                              //       ),
                              //       child: Container(
                              //         height: 50.0,
                              //         width: 82.0,
                              //         decoration: BoxDecoration(
                              //           color: greenLight,
                              //           border: Border.all(width: 1, color: green
                              //           ),
                              //         ),
                              //
                              //         child: InkWell(
                              //           child: Column(
                              //             mainAxisAlignment: MainAxisAlignment.center,
                              //             children: <Widget>[
                              //
                              //               Text(
                              //                 'Date Time',
                              //                 style: TextStyle( fontSize: 15,
                              //                     color: green, fontWeight: FontWeight.w800),
                              //               )
                              //             ],
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //     ClipRRect(
                              //       borderRadius: BorderRadius.only(
                              //         topLeft: Radius.circular(8.0),
                              //         topRight: Radius.circular(8.0),
                              //       ),
                              //       child: Container(
                              //         height: 50.0,
                              //         width: 82.0,
                              //         decoration: BoxDecoration(
                              //           color: greenLight,
                              //           border: Border.all(width: 1, color: green
                              //           ),
                              //         ),
                              //
                              //         child: InkWell(
                              //           child: Column(
                              //             mainAxisAlignment: MainAxisAlignment.center,
                              //             children: <Widget>[
                              //
                              //               Text(
                              //                 'Date Time',
                              //                 style: TextStyle( fontSize: 15,
                              //                     color: green, fontWeight: FontWeight.w800),
                              //               )
                              //             ],
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //
                              //   ],
                              // ),
                            ),
                          ),

                        ),
                        Align(
                          child: Container(
                            child:              RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.red)),
                              onPressed: () {
                                upload_marks();
                                showAlertDialog(context);
                              },
                              color: Colors.red,

                              textColor: Colors.white,
                              child: Text("Submit".toUpperCase(),
                                  style: TextStyle(fontSize: 50)),
                            ),
                            // margin: EdgeInsets.only(top: 850),
                          ),
                          alignment: FractionalOffset.bottomCenter,
                        ),


                      ],
                    )
                ),
              ),


              SizedBox(
                height: 15,
              )


            ],
          ),
        )
    );
  }
}
