import 'package:flutter/material.dart';
import 'package:fyp/src/Widget/bezierContainer.dart';
import 'package:fyp/teacher/screens/teacherinfo.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
final FirebaseAuth _auth = FirebaseAuth.instance;
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void _signInWithEmailAndPassword() async {

    User user = (await _auth.signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    )).user;

    if (user != null) {
      setState(() {
        //
        // _success = true;
        // _userEmail = user.email;
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => tinfo(auth: _auth,user: user,)));
      });
    } else {
      setState(() {
        print("fail");
        // _success = false;
      });
    }
  }
  Widget _backButton() {
    return InkWell(
      child: Container(
        child: Row(
          children: <Widget>[


          ],
        ),
      ),
    );
  }

  Widget _entryField(String title, {bool isPassword = false,final controller_}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Colors.white),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            controller: controller_,
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.deepOrange,
                        width: 8.0),
                  ),
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _submitButton() {

    return InkWell(
        onTap: () {
          _signInWithEmailAndPassword();

    },

    child: Container(
      height: 50,
      width: 200,
      //padding: EdgeInsets.symmetric(vertical: 15),
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
        'Login',
        style: TextStyle(fontSize: 15, color: Colors.white),
      ),
    ),
    );
  }
  Widget _title() {
    return  Container(
      //margin: EdgeInsets.only(left: 90),
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

    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[

        Container(
          height: 250,
          width: 400,
          //padding: EdgeInsets.symmetric(vertical: 15),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF6A1B9A),Color(0xFF6A1B9A),Color(0xFF42A5F5),]
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
          child: Column(

              children: <Widget>[
                _entryField("Email Id",controller_: _emailController),
                _entryField("Password", isPassword: true,controller_: _passwordController),
              ]
          ),
        ),

      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(30.0), // here the desired height
            child: AppBar(
              title: Text('Faculty Console'),
              elevation: 2.0,
              backgroundColor: Color(0xFF6A1B9A),
            )
        ),
        body: Container(
          height: height,
          child: Stack(
            children: <Widget>[
              Positioned(
                  top: -height * .15,
                  right: -MediaQuery.of(context).size.width * .4,
                  child: BezierContainer()),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: <Widget>[

                      SizedBox(height: height * .2),
                      _title(),
                      SizedBox(height: 50),
                      _emailPasswordWidget(),
                      SizedBox(height: 30),
                      _submitButton(),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 50,vertical: 30),
                        alignment: Alignment.center,
                        child: Text('Forgot Password ?',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500)),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(top: 40, left: 0, child: _backButton()),
            ],
          ),
        ));
  }
}
