import 'dart:convert';
import 'notice.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'noticev1.dart';
import 'package:fyp/university/about.dart';
import 'package:fyp/university/admission.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/animation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fyp/src/start.dart';

var green = Color(0xFF4caf6a);
var greenLight = Color(0xFFd8ebde);

var red = Color(0xFFf36169);
var redLight = Color(0xFFf2dcdf);

var blue = Color(0xFF398bcf);
var blueLight = Color(0xFFc1dbee);

final List<String> imgList = [
  'assets/8.jpg',
  'assets/6.jpg',
  'assets/4.jpg',
  'assets/5.jpg',
  'assets/9.jpg'
];

final List child = map<Widget>(
  imgList,
  (index, i) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(children: <Widget>[
          Image.asset(i, fit: BoxFit.cover, width: 1000.0),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF6A1B9A),Color(0xFF6A1B9A),Color(0xFF42A5F5),]
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                'COMSATS University',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  },
).toList();

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  ScrollController scrollCtrl = new ScrollController();
AnimationController animateCtrl;
Choice _selectedChoice = choices[0]; 
  int _current = 0;
  List notices;
  // final  flutterWebviewPlugin = FlutterWebviewPlugin();
  //Future Notice Start//
  @override
  void initState() {
    double offset = 0.0;
    super.initState();
    this.getNotice();
     // flutterWebviewPlugin.close();
    // flutterWebviewPlugin.onUrlChanged.listen((String url) {
      
      
    // });
    animateCtrl =
        new AnimationController(vsync: this, duration: Duration(seconds: 6))
          ..addListener(() {
            if (animateCtrl.isCompleted) animateCtrl.repeat();
            offset += 1.0;
            if (offset - 1 > scrollCtrl.offset) {
              offset = 0.0;
            }
            setState(() {
              scrollCtrl.jumpTo(offset);
            });
          });
animateCtrl.forward();
  }

  Future getNotice() async {
    var response = await http.get(
        Uri.encodeFull(
          'http://result.bpsplayschool.com/db.php',
        ),
        headers: {'accepts': 'application/json'});
    var data = json.decode(response.body);
    //print(data['result'][0]['date']);

    print(data['result']);
    if (!mounted) return;
    setState(() {
      notices = data['result'];
    });
  }
@override
  void dispose() {
     animateCtrl.dispose();
    super.dispose();
    // flutterWebviewPlugin.dispose();
  }
  //Future Notice End//
  void _select(Choice choice) {
    // Causes the app to rebuild with the new _selectedChoice.
    _launchURL();
  }
  canLaunch(String url){
    if(url.length>0)
    return true;
    else
    return false;
  }
_launchURL() async {
  const url = 'http://bpsplayschool.com/privacy_policy.php';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
       title:
       Row(
         mainAxisAlignment: MainAxisAlignment.start,
         children: [
           ClipOval(
             child:Image.asset(
               'assets/logo1.jpg',
               fit: BoxFit.fill,
               height: 50,
             ),
           ),

           Container(
               padding: const EdgeInsets.all(8.0), child: Text('COMSATS University Islamabad',style:
           TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.w900))),

         ],

       ),
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
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Stack(
              children: [
            CarouselSlider(
              items: child,
              autoPlay: true,
              aspectRatio: 2.0,
              onPageChanged: (index) {
                setState(() {
                  _current = index;
                });
              },
            ),
            Positioned(
                top: 150.0,
                left: 0.0,
                right: 0.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: map<Widget>(imgList, (index, url) {
                    return Container(
                      width: 8.0,
                      height: 8.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _current == index
                              ? Color.fromRGBO(0, 0, 0, 0.9)
                              : Color.fromRGBO(0, 0, 0, 0.4)),
                    );
                  }),
                ))
          ]),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Wrap(
              spacing: 8.0,
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
                    width: 104.0,
                    color: greenLight,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Admission()));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.person,
                            color: green,
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            'Admission',
                            style: TextStyle(
                                color: green, fontWeight: FontWeight.w500),
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
                    height: 92.0,
                    width: 104.0,
                    color: redLight,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => About()));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.school,
                            color: red,
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            'About',
                            style: TextStyle(
                                color: red, fontWeight: FontWeight.w500),
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
                    height: 92.0,
                    width: 104.0,
                    color: blueLight,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => StartPage()));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.login,
                            color: blue,
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            'Login',
                            style: TextStyle(
                                color: blue, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(2.0),
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
              child: Center(
                  child: Text(
                'Notice Board',
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              )),
            ),
          ),
          Expanded(
            child: notices == null
                ? Center(child: Text('0 Notice Available'))
                : ListView.builder(
                  controller: scrollCtrl,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: notices == null ? 0 : notices.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        clipBehavior: Clip.hardEdge,
                        child: ListTile(
                            leading: Icon(Icons.av_timer),
                            title: Text(
                              notices[index]['notices'],
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                            subtitle:
                                Text('Posted On: ' + notices[index]['date']),
                            onTap: () {
                              if (notices[index]['isfile'] == '1') {
                                var type=notices[index]['path'].split('.');
                                if(type[type.length-1]=='pdf'){
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => Notice(notices[index]['path'])
                                ));
                                }else{
                                  Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotIm(notices[index]['path']) ));
                                }
                             
                              } 
                              else {
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text('No File is Uploaded'),
                                ));
                              }
                            }),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Privacy Policy', icon: Icons.security),
  
];