import 'package:erg_app/Anchors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:erg_app/Login.dart';
import 'package:flutter/material.dart';
import 'package:erg_app/api/api.dart';

class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  var user;
  var userData;
  var userDetail;
  var anchors;
  @override
  void initState() {
    _getUserInfo();
    super.initState();
  }

  void _getUserInfo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('loginRes');
    user = json.decode(userJson);
    userDetail = user['UserDetail'];
    anchors = user['Anchors'];
    print(anchors);
    //  print(userDetail);
    setState(() {
      userData = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // Container(child: DrawerHeader(child: CircleAvatar()),color: Colors.green,),
          DrawerHeader(
            child: Image.asset("assets/images/icon1.png"),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/head_img.png'),
              ),
            ),
          ),

          ListTile(
            // leading: Icon(Icons.input),
            // title: Text( userData!= null ? 'Welcome, ${user['UserName']}' : 'ERGAgent',
            title: Text(
                userData != null
                    ? 'Welcome, ${userDetail['FirstName']}'
                    : 'ERGAgent',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                )),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => {
              // Navigator.of(context).pop()
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => AnchorsPage()))
            },
          ),

          // ListTile(
          //   leading: Icon(Icons.cloud_download),
          //   title: Text('Download Data'),
          //   onTap: () => {Navigator.of(context).pop()},
          // ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: logout,
          ),
        ],
      ),
    );
  }

  void logout() async {
    // logout from the server ...
    // var res = await CallApi().getData('logout');
    // var body = json.decode(res.body);
    // if(body['success']){}
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('loginRes');
    //  localStorage.remove('token');
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => LogIn()));
  }
}
