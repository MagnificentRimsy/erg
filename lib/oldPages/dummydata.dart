// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:barcode_scan/barcode_scan.dart'

// void main() => runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: ScanPage(),
//     )
// );

// class ScanPage extends StatefulWidget{
 

//   @Override 
//   ScanPageState createSate(){
//     return new ScanPageState();
//   }
// }

// class ScanPageState extends State<ScanPage> { 

//  Future _scanQR() async{
//     try{
//       String qrResult = await BarcodeScanner.scan();

//     }
//   }
//    @override
//   Widget build(BuildContext context){
//         return Scaffold(

//           appBar: AppBar(
//           title: new Center(child: new Text('Scan Personnel QR', textAlign: TextAlign.center)),
//           automaticallyImplyLeading: false,
//           iconTheme: IconThemeData(color: Colors.white),
//           backgroundColor: Colors.green, 
//           ),

//           body: Container(
//             child: ListView(
//               children: <Widget>[
//                   Flexible(
//                     //  margin: EdgeInsets.only(top: 100),
//                     child: Center(
//                       child: RaisedButton(
//                         padding: EdgeInsets.fromLTRB(145, 10, 145, 10),
//                         color: Colors.green,
//                         child: Text("New Scan", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),     
//                         ),
//                         onPressed: () {
//                           // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScanPage()));
//                         },
//                         shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(50),
//                       ),
//                       ),
                    
//                     ),
                    
                    
//                                       ),
//               ],
//             ),
//           ),

          
//         );
//   }
// }


//=====================================Oldbarcodescan below

  // body: Container(
      //     child: ListView(
            
      //         children: <Widget>[
      //           Container(margin: EdgeInsets.only(top: 20),),
      //           CircleAvatar(
      //             radius: 80,
      //             backgroundColor: Colors.grey,
      //               // backgroundImage: AssetImage('assets/images/user.png'),
                  
      //           ),
      //           Text(
      //             'Yusuf Danladi',
      //             style: TextStyle(
      //               fontFamily: 'SourceSansPro',
      //               fontSize: 25,
      //             ),
      //             textAlign: TextAlign.center,

      //           ),
      //           Text(
      //             'Welcome',
      //             style: TextStyle(
      //               fontSize: 20,
      //               fontFamily: 'SourceSansPro',
      //               color: Colors.green[400],
      //               letterSpacing: 2.5,
      //             ),
      //            textAlign: TextAlign.center,
      //           ),
      //           Container(margin: EdgeInsets.only(top: 20),),
      //           SizedBox(
      //             height: 20.0,
      //             width: 200,
      //             child: Divider(
      //               color: Colors.teal[100],
      //             ),
      //           ),
      //           Text(
      //             'Farmer Details',
      //             textAlign: TextAlign.center,

                
      //           ),
      //           Card(
      //                 color: Colors.white,
      //                 margin:
      //                     EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      //                 child: ListTile(
      //                   leading: Text(
      //                       'Phone:',
      //                       style: TextStyle(
      //                         fontSize: 20,
      //                         fontFamily: 'SourceSansPro',
      //                         color: Colors.green[700],
      //                         letterSpacing: 2.5,
      //                     ),
      //                   ),
      //                   title: Text(
      //                     '+234 801 000 4504',
      //                     style:
      //                         TextStyle(fontFamily: 'BalooBhai', fontSize: 20.0),
      //                   ), 
      //                 ), 
      //               ),

      //               Card(
      //                 color: Colors.white,
      //                 margin:
      //                     EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      //                 child: ListTile(
      //                   leading: Text(
      //                       'BVN:',
      //                       style: TextStyle(
      //                         fontSize: 20,
      //                         fontFamily: 'SourceSansPro',
      //                         color: Colors.green[700],
      //                         letterSpacing: 2.5,
      //                     ),
      //                   ),
      //                   title: Text(
      //                     result,
      //                     style:
      //                         TextStyle(fontFamily: 'BalooBhai', fontSize: 20.0),
      //                   ), 
      //                 ), 
      //               ),

      //               Card(
      //                 color: Colors.white,
      //                 margin:
      //                     EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      //                 child: ListTile(
      //                   leading: Text(
      //                       'Appicant ID:',
      //                       style: TextStyle(
      //                         fontSize: 20,
      //                         fontFamily: 'SourceSansPro',
      //                         color: Colors.green[700],
      //                         letterSpacing: 2.5,
      //                     ),
      //                   ),
      //                   title: Text(
      //                     'ERG-108691911',
      //                     style:
      //                         TextStyle(fontFamily: 'BalooBhai', fontSize: 20.0),
      //                   ), 
      //                 ), 
      //               ),

      //               Card(
      //                 color: Colors.white,
      //                 margin:
      //                     EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      //                 child: ListTile(
      //                   leading: Text(
      //                       'State/LGA:',
      //                       style: TextStyle(
      //                         fontSize: 20,
      //                         fontFamily: 'SourceSansPro',
      //                         color: Colors.green[700],
      //                         letterSpacing: 2.5,
      //                     ),
      //                   ),
      //                   title: Text(
      //                     'Taraba/Ussa',
      //                     style:
      //                         TextStyle(fontFamily: 'BalooBhai', fontSize: 20.0),
      //                   ), 
      //                 ), 
      //               ),

      //               Card(
      //                 color: Colors.white,
      //                 margin:
      //                     EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      //                 child: ListTile(
      //                   leading: Text(
      //                       'Farm Size:',
      //                       style: TextStyle(
      //                         fontSize: 20,
      //                         fontFamily: 'SourceSansPro',
      //                         color: Colors.green[700],
      //                         letterSpacing: 2.5,
      //                     ),
      //                   ),
      //                   title: Text(
      //                     '5000 meter sq',
      //                     style:
      //                         TextStyle(fontFamily: 'BalooBhai', fontSize: 20.0),
      //                   ), 
      //                 ), 
      //               ),

      //               Card(
      //                 color: Colors.white,
      //                 margin:
      //                     EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      //                 child: ListTile(
      //                   leading: Text(
      //                       'Geo Coord.:',
      //                       style: TextStyle(
      //                         fontSize: 20,
      //                         fontFamily: 'SourceSansPro',
      //                         color: Colors.green[700],
      //                         letterSpacing: 2.5,
      //                     ),
      //                   ),
      //                   title: Text(
      //                     '012350007, 038245543',
      //                     style:
      //                         TextStyle(fontFamily: 'BalooBhai', fontSize: 20.0),
      //                   ), 
      //                 ), 
      //               ),

      //               Container(
      //                 margin: EdgeInsets.only(top: 20, bottom: 30),
      //                 child: Center(
      //                   child: RaisedButton(
      //                     padding: EdgeInsets.fromLTRB(80, 10, 80, 10),
      //                     color: Colors.green,
      //                     child: Text("Complete", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14), ),
      //                     onPressed: () {
      //                       Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScanPage()));
      //                     },
      //                     shape: RoundedRectangleBorder(
      //                     borderRadius: BorderRadius.circular(50),
      //                   ),
      //                   ),
      //                 ),
      //             ),
      //         ],
      //     ),
      //   ),
        

//======================================endofnewbarcodescan

















//====================loginhead
  // import 'package:flutter/semantics.dart';
  // void main() => runApp(MyApp());

  // class MyApp extends StatelessWidget{
  //   @override 
  //   Widget build (BuildContext context){
  //     return MaterialApp(
  //       debugShowCheckedModeBanner: false,
  //       home: LoginPage(),
  //     );
  //   }
  // }

//====================loginheadend




/*Snippets

Snippet to get userdetails data
==========================
  title: Text( userData!= null ? 'Welcome, ${userDetail['Email']}' : 'ERGAgent',


End of snippets*/













/// Old Anchors get data page
/// 
/// import 'package:erg_app/StockPage.dart';
// import 'package:erg_app/models/users_model.dart';
// import 'package:flutter/material.dart';
// import 'package:erg_app/Widgets/nav-drawer.dart';
// import 'package:erg_app/models/eopmodel.dart';
// import 'package:erg_app/StartScan.dart';
// import 'dart:convert';
// import 'dart:async';
// import 'package:shared_preferences/shared_preferences.dart';

// void main() => runApp(MaterialApp(
//       home: EopPage(),
//     ));

// class EopPage extends StatefulWidget {
//   @override
//   _MyHomeState createState() => _MyHomeState();
// }

// class _MyHomeState extends State<EopPage> {
  
  
  
//  var user;
//  var userData;
//  List anchors = []; 
//   @override
//   void initState() {
//     _getUserAnchor();
//     super.initState();
//   }

// _getUserAnchor() async{
//   SharedPreferences localStorage  = await SharedPreferences.getInstance();
//   var userJson = localStorage.getString('loginRes');
//     user = json.decode(userJson);  
//     setState(() {
//       anchors = user['Anchors'];       
//     });
//     print(anchors);
//     setState(() {
//      userData = anchors;
//     });
// }
//     @override
//     Widget build(BuildContext context) {
//     return Scaffold(
//     drawer: NavDrawer(),
//       appBar: AppBar(
//         title: Text('Dashboard'),
//         iconTheme: IconThemeData(color: Colors.white),
//         backgroundColor: Colors.green,
//       ),    body: Column(
//      children: <Widget>[
//       ListView.builder(
//         shrinkWrap: true,
//         itemCount: anchors.length,
//         itemBuilder: (BuildContext context, int i){
//         return Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Card(
//             child: Column(
//               children: <Widget>[
//                 Text(anchors[i]['Name']),
//                 Text(anchors[i]['Oid'].toString()),
//               ],
//             ),
//           ),
//         );
//       })
//     ],
//    ),
//  );
// }
// }
//==========================end of anchor 1




///Anchor 2 =====================================
///
///import 'package:erg_app/StockPage.dart';
// import 'package:erg_app/models/users_model.dart';
// import 'package:flutter/material.dart';
// import 'package:erg_app/Widgets/nav-drawer.dart';
// import 'package:erg_app/models/eopmodel.dart';
// import 'package:erg_app/StartScan.dart';
// import 'dart:convert';
// import 'dart:async';
// import 'package:shared_preferences/shared_preferences.dart';

// void main() => runApp(MaterialApp(
//       home: EopPage(),
//     ));

// class EopPage extends StatefulWidget {
//   @override
//   _MyHomeState createState() => _MyHomeState();
// }

// class _MyHomeState extends State<EopPage> {
//   List<Person> persons = [
//     Person(
//         name: 'RIFAN',
//         profileImg: 'assets/images/user.png',
//         allocated_farmers: "300",
//         validated_farmers: "345",
//         non_validated_farmers: "120",
//         daily_inventory_status: "Completed",
//         distribution_centers: "100"),
//     Person(
//         name: 'MAAN',
//         profileImg: 'assets/images/user.png',
//         allocated_farmers: "230",
//         validated_farmers: "195",
//         non_validated_farmers: "110",
//         daily_inventory_status: "Incompleted",
//         distribution_centers: "70"),
//     Person(
//         name: 'COPMAN',
//         profileImg: 'assets/images/user.png',
//         allocated_farmers: "560",
//         validated_farmers: "45",
//         non_validated_farmers: "780",
//         daily_inventory_status: "Completed",
//         distribution_centers: "40"),
//   ];

//   Widget personDetailCard(Person) {
//     return Container(
//       padding: const EdgeInsets.all(10.0),

//       ////////////// 1st card///////////

//       child: Card(
//         elevation: 4.0,
//         color: Colors.grey[100],
//         margin: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 10),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//         child: Container(
//           padding: EdgeInsets.only(left: 15, top: 20, bottom: 10),
//           width: MediaQuery.of(context).size.width,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Row(
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                         width: 50.0,
//                         height: 50.0,
//                         decoration: new BoxDecoration(
//                             shape: BoxShape.circle,
//                             image: new DecorationImage(
//                                 fit: BoxFit.cover,
//                                 image: AssetImage(Person.profileImg)))),
//                   ),
//                   SizedBox(
//                     width: 20,
//                   ),
//                   Text(
//                     Person.name,
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Color(0xFF9b9b9b),
//                       fontSize: 20,
//                       decoration: TextDecoration.none,
//                       fontWeight: FontWeight.normal,
//                     ),
//                   ),
//                 ],
//               ),
//               Container(width: 10),
//               Row(
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.only(left: 10, top: 10),
//                     child: Text(
//                       'Allocated Farmers:',
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                         color: Color(0xFF9b9b9b),
//                         fontSize: 14.0,
//                         decoration: TextDecoration.none,
//                         fontWeight: FontWeight.normal,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 70, top: 12),
//                     child: Text(
//                       Person.allocated_farmers,
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                         color: Colors.grey[700],
//                         fontSize: 14.0,
//                         decoration: TextDecoration.none,
//                         fontWeight: FontWeight.normal,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Row(
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.only(left: 10, top: 10),
//                     child: Text(
//                       'Validated Farmers:',
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                         color: Color(0xFF9b9b9b),
//                         fontSize: 14.0,
//                         decoration: TextDecoration.none,
//                         fontWeight: FontWeight.normal,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 70, top: 12),
//                     child: Text(
//                       Person.validated_farmers,
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                         color: Colors.grey[700],
//                         fontSize: 14.0,
//                         decoration: TextDecoration.none,
//                         fontWeight: FontWeight.normal,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Row(
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.only(left: 10, top: 10),
//                     child: Text(
//                       'Non Validated Farmers:',
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                         color: Color(0xFF9b9b9b),
//                         fontSize: 14.0,
//                         decoration: TextDecoration.none,
//                         fontWeight: FontWeight.normal,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 40, top: 12),
//                     child: Text(
//                       Person.non_validated_farmers,
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                         color: Colors.grey[700],
//                         fontSize: 14.0,
//                         decoration: TextDecoration.none,
//                         fontWeight: FontWeight.normal,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Row(
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.only(left: 10, top: 10),
//                     child: Text(
//                       'Distribution Centers:',
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                         color: Color(0xFF9b9b9b),
//                         fontSize: 14.0,
//                         decoration: TextDecoration.none,
//                         fontWeight: FontWeight.normal,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 60, top: 12),
//                     child: Text(
//                       Person.distribution_centers,
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                         color: Colors.grey[700],
//                         fontSize: 14.0,
//                         decoration: TextDecoration.none,
//                         fontWeight: FontWeight.normal,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Row(
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.only(left: 10, top: 10),
//                     child: Text(
//                       'Daily Inventory Status:',
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                         color: Color(0xFF9b9b9b),
//                         fontSize: 14.0,
//                         decoration: TextDecoration.none,
//                         fontWeight: FontWeight.normal,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 50, top: 12),
//                     child: Text(
//                       Person.daily_inventory_status,
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                         color: Person.daily_inventory_status == 'Completed'
//                             ? Colors.green
//                             : Colors.red,
//                         fontSize: 14.0,
//                         decoration: TextDecoration.none,
//                         fontWeight: FontWeight.normal,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Container(
//                 height: 20,
//               ),
//               Row(
//                 children: <Widget>[
//                   /////////// Buttons /////////////

//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Person.daily_inventory_status == 'Completed'
//                         ? FlatButton(
//                             child: Padding(
//                               padding: EdgeInsets.only(
//                                   top: 8, bottom: 8, left: 10, right: 10),
//                               child: Text(
//                                 'Validate Farmer',
//                                 textDirection: TextDirection.ltr,
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 15.0,
//                                   decoration: TextDecoration.none,
//                                   fontWeight: FontWeight.normal,
//                                 ),
//                               ),
//                             ),
//                             color: Colors.green,
//                             shape: new RoundedRectangleBorder(
//                                 borderRadius: new BorderRadius.circular(20.0)),
//                             onPressed: () {
//                               Navigator.push(
//                                   context,
//                                   new MaterialPageRoute(
//                                       builder: (context) => StartScanPage()));
//                               // Edit()was here
//                             },
//                           )
//                         : FlatButton(
//                             child: Padding(
//                               padding: EdgeInsets.only(
//                                   top: 8, bottom: 8, left: 10, right: 8),
//                               child: Text(
//                                 'Take Inventory',
//                                 textDirection: TextDirection.ltr,
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 15.0,
//                                   decoration: TextDecoration.none,
//                                   fontWeight: FontWeight.normal,
//                                 ),
//                               ),
//                             ),
//                             color: Colors.blueGrey,
//                             shape: new RoundedRectangleBorder(
//                                 borderRadius: new BorderRadius.circular(20.0)),
//                             onPressed: () {
//                               Navigator.push(
//                                   context,
//                                   new MaterialPageRoute(
//                                       builder: (context) => StockPage()));
//                             },
//                           ),
//                   ),

//                   /////////// End of Buttons /////////////
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

  
//  var user;
//  var userData;
//  var anchors; 
//   @override
//   void initState() {
//     _getUserAnchor();
//     super.initState();
//   }

// _getUserAnchor() async{
//   SharedPreferences localStorage  = await SharedPreferences.getInstance();
//   var userJson = localStorage.getString('loginRes');
//      user = json.decode(userJson);  
//      anchors = user['Anchors'];
//      print(anchors);
    
//      setState(() {
//         userData = anchors;
//      });
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: NavDrawer(),
//       appBar: AppBar(
//         title: Text('Dashboard'),
//         iconTheme: IconThemeData(color: Colors.white),
//         backgroundColor: Colors.green,
//       ),
//       backgroundColor: Colors.white,
//       body: Container(
//         padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
//         child: ListView(
//           children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: <Widget>[
//                 Icon(Icons.card_membership,
//                     size: 35, color: Colors.orange[400]),
//                 Text(
//                   'Assigned Anchors',
//                   style: TextStyle(color: Colors.orange[400], fontSize: 25),
//                 ),
//                 Icon(Icons.notifications_none, size: 35, color: Colors.white)
//               ],
//             ),
//             Column(
//                 children: persons.map((p) {
//               return personDetailCard(p);
//             }).toList())
//           ],
//         ),
//       ),
//     );
//   }
// }


//End of anchor 2