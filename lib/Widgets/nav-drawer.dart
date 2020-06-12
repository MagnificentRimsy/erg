import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // Container(child: DrawerHeader(child: CircleAvatar()),color: Colors.green,),
          DrawerHeader(
            
            // child: CircleAvatar( 
            //     backgroundImage: AssetImage('assets/images/icon.png'),
            // ),
            //  child: Text(
            //   'ERG Agro',
            //   style: TextStyle(color: Colors.white, fontSize: 25),
            // ),

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
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
