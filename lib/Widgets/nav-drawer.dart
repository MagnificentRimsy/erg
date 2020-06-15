import 'dart:convert';
import 'package:erg_app/Login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:erg_app/api/api.dart';

class NavDrawer extends StatefulWidget {
  @override 
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // Container(child: DrawerHeader(child: CircleAvatar()),color: Colors.green,),
          DrawerHeader(
            child: Image.asset("assets/images/icon.png", height: 10, width: 10, fit: BoxFit.contain,),
             
            decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/head_img.png'),),      
            ),
         ),

          ListTile(
            // leading: Icon(Icons.input),
            title: Text('Welcome, Jonah', style: TextStyle(color: Colors.green, fontSize: 23, fontWeight: FontWeight.bold)),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.cloud_upload),
            title: Text('Upload Data'),
            onTap: () => {Navigator.of(context).pop()},
          ),
         
          ListTile(
            leading: Icon(Icons.cloud_download),
            title: Text('Download Data'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => LogIn()))},
            // onTap: logout,
          ),
        ],
      ),
    );
  }

   void logout() async{
      // logout from the server ... 
      var res = await CallApi().getData('logout');
      var body = json.decode(res.body);
      if(body['success']){
         SharedPreferences localStorage = await SharedPreferences.getInstance();
         localStorage.remove('user');
         localStorage.remove('token');
          Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => LogIn()));
      }
     
  }
}
