import 'package:flutter/material.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Admission extends StatefulWidget {
  
  @override
  _AdmissionState createState() => _AdmissionState();

}
class _AdmissionState extends State<Admission> {
  // final flutterWebviewPlugin = new FlutterWebviewPlugin();
  @override
  void initState() {
    super.initState();
    // flutterWebviewPlugin.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admission'),
        elevation: 2.0,
        flexibleSpace:Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF6A1B9A),Color(0xFF6A1B9A),Color(0xFF42A5F5),]
            ),
            borderRadius: BorderRadius.all(Radius.elliptical(5,7)),
          ),

        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF6A1B9A),Color(0xFF6A1B9A),Color(0xFF42A5F5),]
          ),
          borderRadius: BorderRadius.all(Radius.elliptical(5,7)),
        ),
        padding: EdgeInsets.all(3.0),
        margin: EdgeInsets.all(5.0),
      
          child: Stack(
          //  mainAxisAlignment: MainAxisAlignment.center,
          //  crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0)),
                child: Container(
                  height: 250.0,
                  width: MediaQuery.of(context).size.width / 1.029,
                  //color: Colors.amber,
                  child:Image.asset('assets/6.jpg',fit: BoxFit.fill,width: MediaQuery.of(context).size.width,),
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
              // ),
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 250.0, 0.0, 0.0),
              //padding: EdgeInsets.all(5.0),
                //width: MediaQuery.of(context).size.width/1.2,
                //color: Colors.white,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFF6A1B9A),Color(0xFF6A1B9A),Color(0xFF42A5F5),]
                  ),
                  borderRadius: BorderRadius.all(Radius.elliptical(5,7)),
                ),
                child: ListView(
                  children: <Widget>[
                    Card(child: ListTile(
                      title: Text('You can Registered Online from our official website.()',style: TextStyle(fontSize: 16.0,fontFamily: "Roboto")),
                    ),),
                    Card(child: ListTile(
                      title: Text('Since the seats are limited you should hurry up! to get admission.'),
                    ),),
                    Card(child: ListTile(
                      title: Text('Registered users must come with their registered slip and application form which you can get from our site ->Admission ->Application Form.'),
                    ),),
                    Card(child: ListTile(
                      title: Text('For direct admission parents can contact to our administration office.'),
                    ),),
                    Card(child: ListTile(
                      title: Text('Application form is available on our office.'),
                    ),),
                    Card(child: ListTile(
                      title: Text('For any queries about admission you can contact us from our email and through our mobile contact number which is given below.'),
                    ),),
                   
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
                    'Documents Required',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  )),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
              ),
              Card(child: ListTile(
                      title: Text('For Online registered user they should bring the application form and registration slip.'),
                    ),),
                    Card(child: ListTile(
                      title: Text('For direct admission from will be available on office'),
                    ),),
                    Card(child: ListTile(
                      title: Text('Parents must bring their AADHAAR CARD.'),
                    ),),
                    Card(child: ListTile(
                      title: Text('Two Passport size of children is required.'),
                    ),),
                    Card(child: ListTile(
                      title: Text('Parents must come with their children and parents also.'),
                    ),),
                    Card(child: ListTile(
                      title: Text('ADMISSSION FEE will collected during form submission.'),
                    ),),
                    Card(child: ListTile(
                      title: Text('You can get fee detail from our office.'),
                    ),),
                    Card(child: ListTile(
                      title: Text('All the mandetory documents like TC and character certificate is required for admission above the nursery.'),
                    ),),
              
              Center(
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Scaffold(
                                  appBar: AppBar(
                                    title: Text("BPS PLAY SCHOOL"),
                                  ),

                                  body: Container(
                                    color: Colors.white,
                                    child: const Center(
                                      child: Text('Loading..',style: TextStyle(fontFamily: "Roboto",fontWeight: FontWeight.bold),),
                                    ),
                                  ),
                                )));
                              
                  },
                  child: Text(
                    'Apply Now',
                    style: TextStyle(fontSize: 20.0,color: Colors.white,fontFamily: "Roboto"),
                  ),
                  color: Colors.red,
                  clipBehavior: Clip.antiAlias,
                ),
              )
                  ],
                ),
              )
            ],
          ),
        
      ),
    );
  }
}
