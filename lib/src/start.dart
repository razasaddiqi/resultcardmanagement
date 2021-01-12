import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'Widget/bezierContainer.dart';
import 'package:fyp/facultyloginPage.dart';
import 'package:fyp/student/stdntlogin.dart';
class StartPage extends StatefulWidget {
  StartPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<StartPage> {

  Widget _label() {
    return Container(
        //margin: EdgeInsets.only(top: 40, bottom: 20),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              'Quick login with Touch ID',
              style: TextStyle(color: Colors.blue, fontSize: 15),
            ),
            SizedBox(
              height: 10,
            ),
            Icon(Icons.fingerprint, size: 50, color: Colors.blue),
            SizedBox(
              height: 10,
            ),
            Text(
              'Touch ID',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 15,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ));
  }
  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              //child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            //Text('Back',
               // style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }
  Widget _student() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginaPage()));
      },
      child: Container(
        height: 50,
        width: 200,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF6A1B9A),Color(0xFF6A1B9A),Color(0xFF42A5F5),Colors.white54,]
            ),
            borderRadius: BorderRadius.all(Radius.elliptical(5,7)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.blue,
                  offset: Offset(2, 4),
                  blurRadius: 8,
                  spreadRadius: 2)
            ],
            ),
        child: Text(
          'Student',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
  Widget _teacher() {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
      height: 50,
        width: 200,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF6A1B9A),Color(0xFF6A1B9A),Color(0xFF42A5F5),Colors.white54,]
          ),
          borderRadius: BorderRadius.all(Radius.elliptical(5,7)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.blue,
                offset: Offset(2, 4),
                blurRadius: 8,
                spreadRadius: 2)
          ],
        ),
        child: Text(
          'Faculty',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),

    );
  }
  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text('or'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0), // here the desired height
          child: AppBar(
            title: Text('LOGIN AS ADMIN'),
            //elevation: 2.0,
            backgroundColor: Color(0xFF6A1B9A),
          )
      ),
        body: Container(
      height: height,
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                  height: 70,
                  //color: Color(0xFF6A1B9A),
                  ),

              Container(
                margin: EdgeInsets.only(top:150,left: 90),
                height: 150,
                width: 150,

                  decoration: new BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.blue,
                            offset: Offset(2, 4),
                            blurRadius: 8,
                            spreadRadius: 2)
                      ],
                    
                      border: Border.all(color: Color(0xFF6A1B9A),),
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                        image: new AssetImage("images/logo1.jpg"),
                        fit: BoxFit.fill,
                      )
                  )

              ),
              Container(
                margin: EdgeInsets.only(right:20,),
                height: 350,
                width: 400,
                //color: Colors.red,

                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Login As ?', textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    _student(),
                    SizedBox(
                      height: 10,
                    ),
                    _divider(),
                    SizedBox(
                      height: 10,
                    ),
                    _teacher(),
                    SizedBox(
                      height: 10,
                    ),
                    _label()
                  ],
                ),

              )

            ],

          ),

          Positioned(
              top: -height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer()),


          Positioned(top: 40, left: 0, child: _backButton()),
        ],

      ),
    ),

    );
  }
}
