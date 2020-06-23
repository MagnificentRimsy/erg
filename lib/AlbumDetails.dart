// import 'package:erg_app/StartScan.dart';
// import 'package:flutter/material.dart';
// import 'package:erg_app/models/album_model.dart';

// // void main() {
// //   runApp(ProfilePage());
// // }
  

// class AlbumDetailsPage extends StatelessWidget {
  
 
//   final String album;
//   AlbumDetailsPage({@required this.album});
  
  
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return MaterialApp(
//        debugShowCheckedModeBanner: false,

//       home: Scaffold(
//          appBar: AppBar(

//           title: new Center(child: new Text('Album Details:', textAlign: TextAlign.left)),
//           iconTheme: IconThemeData(color: Colors.white),
//           backgroundColor: Colors.green, 
//           leading: new IconButton(
//           icon: new Icon(Icons.assignment_ind),
//           onPressed: () {},
//         ),
        
//         ),
//         // backgroundColor: Colors.green[50],
//         body: Container(
//           child: ListView(
            
//               children: <Widget>[
//                 Container(margin: EdgeInsets.only(top: 20),),
//                 CircleAvatar(
//                   radius: 80,
//                   backgroundColor: Colors.grey,
//                     // backgroundImage: AssetImage('assets/images/user.png'),
                  
//                 ),
//                 Text(
//                   album.title,
//                   style: TextStyle(
//                     fontFamily: 'SourceSansPro',
//                     fontSize: 25,
//                   ),
//                   textAlign: TextAlign.center,

//                 ),
//                 Text(
//                   'Welcome',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontFamily: 'SourceSansPro',
//                     color: Colors.green[400],
//                     letterSpacing: 2.5,
//                   ),
//                  textAlign: TextAlign.center,
//                 ),
//                 Container(margin: EdgeInsets.only(top: 20),),
//                 SizedBox(
//                   height: 20.0,
//                   width: 200,
//                   child: Divider(
//                     color: Colors.teal[100],
//                   ),
//                 ),
//                 Text(
//                   'Album Details',
//                   textAlign: TextAlign.center,

                
//                 ),
                
//                 Card(
//                       color: Colors.white,
//                       margin:
//                           EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
//                       child: ListTile(
//                         leading: Text(
//                             'ID:',
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontFamily: 'SourceSansPro',
//                               color: Colors.green[700],
//                               letterSpacing: 2.5,
//                           ),
//                         ),
//                         title: Text("${album.userId}",
//                           // result,
//                           style:
//                               TextStyle(fontFamily: 'BalooBhai', fontSize: 20.0),
//                         ), 
//                       ), 
//                     ),
                
//                 Card(
//                       color: Colors.white,
//                       margin:
//                           EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
//                       child: ListTile(
//                         leading: Text(
//                             'Title:',
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontFamily: 'SourceSansPro',
//                               color: Colors.green[700],
//                               letterSpacing: 2.5,
//                           ),
//                         ),
//                         title: Text(
//                           album.title,
//                           style:
//                               TextStyle(fontFamily: 'BalooBhai', fontSize: 20.0),
//                         ), 
//                       ), 
//                     ),

                    
//                     Card(
//                       color: Colors.white,
//                       margin:
//                           EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
//                       child: ListTile(
//                         leading: Text(
//                             'Body:',
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontFamily: 'SourceSansPro',
//                               color: Colors.green[700],
//                               letterSpacing: 2.5,
//                           ),
//                         ),
//                         title: Text(
//                           album.body,
//                           style:
//                               TextStyle(fontFamily: 'BalooBhai', fontSize: 20.0),
//                         ), 
//                       ), 
//                     ),

//                     Container(
//                       margin: EdgeInsets.only(top: 20, bottom: 30),
//                       child: Center(
//                         child: RaisedButton(
//                           padding: EdgeInsets.fromLTRB(80, 10, 80, 10),
//                           color: Colors.green,
//                           child: Text("Close", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14), ),
//                           onPressed: () {
//                             Navigator.of(context).push(MaterialPageRoute(builder: (context) =>StartScanPage()));
//                           },
//                           shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(50),
//                         ),
//                         ),
//                       ),
//                   ),
//               ],
//           ),
//         ),
//       ),
//     );
//   }
// }