import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:erg_app/widgets/nav-drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:erg_app/api/api.dart';
import 'package:erg_app/eops.dart';
import 'package:erg_app/Login.dart';

void main() => runApp(Home());

/// This Widget is the main application widget.
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          title: Text('Dashboard'),
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue = 'One';

  var userData;
  @override
  void initState() {
    _getUserInfo();
    super.initState();
  }

  void _getUserInfo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('loginRes');
    var user = json.decode(userJson);
    setState(() {
      userData = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[100],
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.start,

        children: <Widget>[
          ////////////// 1st card///////////

          Card(
            elevation: 4.0,
            color: Colors.white,
            margin: EdgeInsets.only(left: 10, right: 10, top: 50, bottom: 10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              padding: EdgeInsets.only(left: 15, top: 20, bottom: 10),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.arrow_downward,
                          color: Color(0xFFFF835F),
                        ),
                      ),
                      Text(
                        'Downloaded Data',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xFF9b9b9b),
                          fontSize: 12,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.camera_rear,
                          color: Color(0xFFFF835F),
                        ),
                      ),
                      Text(
                        'Data Scanned',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFF9b9b9b),
                          fontSize: 10,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 35),
                        child: Text(
                          userData != null
                              ? '${userData['firstName']}'
                              : '134569',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color(0xFF9b9b9b),
                            fontSize: 17.0,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 120),
                        child: Text(
                          userData != null
                              ? '${userData['firstName']}'
                              : '452355',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color(0xFF9b9b9b),
                            fontSize: 15.0,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                      Container(height: 20,),
                  Row(
                    children: <Widget>[
                      /////////// Download Button /////////////
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: FlatButton(
                        
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 8, bottom: 8, left: 10, right: 10),
                            child: Text(
                              'Download data',
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          color: Colors.green,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => Home()));
                            // Edit()was here
                          },
                        ),
                      ),

                      /////////// Upload Button /////////////
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: FlatButton(
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 8, bottom: 8, left: 10, right: 8),
                            child: Text(
                              'Upload data',
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          color: Colors.blueGrey,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => Home()));
                            // Edit()was here
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          /////////////// Button////////////
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                /////////// Edit Button /////////////
                // Padding(
                //   padding: const EdgeInsets.all(10.0),
                //   child: FlatButton(
                //     child: Padding(
                //       padding: EdgeInsets.only(
                //           top: 8, bottom: 8, left: 10, right: 10),
                //       child: Text(
                //         'Download data',
                //         textDirection: TextDirection.ltr,
                //         style: TextStyle(
                //           color: Colors.white,
                //           fontSize: 15.0,
                //           decoration: TextDecoration.none,
                //           fontWeight: FontWeight.normal,
                //         ),
                //       ),
                //     ),
                //     color: Color(0xFF68FA1E),
                //     shape: new RoundedRectangleBorder(
                //         borderRadius: new BorderRadius.circular(20.0)),
                //     onPressed: () {
                //       Navigator.push(context,
                //           new MaterialPageRoute(builder: (context) => Home()));
                //       // Edit()was here
                //     },
                //   ),
                // ),

                ////////////// logout//////////

                Padding(
                  padding: const EdgeInsets.only(left: 180),
                  child: FlatButton(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 8, bottom: 8, left: 10, right: 10),
                      child: Text(
                        'Logout',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    color: Colors.blue,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                    onPressed: () {
                      Navigator.push(context,
                          new MaterialPageRoute(builder: (context) => EopPage()));
                      // Edit()was here
                    },
                    
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      // ),
    );

   
  }

   void logout() async{
      // logout from the server ... 
      var res = await CallApi().getData('logout');
      var body = json.decode(res.body);
      if(body['success']){
         SharedPreferences localStorage = await SharedPreferences.getInstance();
         localStorage.remove('customer');
         localStorage.remove('token');
         Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => LogIn()));
        //   Navigator.push(
        // context,
        // new MaterialPageRoute(
        //     builder: (context) => LogIn()));
      }
     
  }
}
