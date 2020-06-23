import 'package:erg_app/StockPage.dart';
import 'package:erg_app/models/users_model.dart';
import 'package:flutter/material.dart';
import 'package:erg_app/Widgets/nav-drawer.dart';
import 'package:erg_app/StartScan.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MaterialApp(
      home: EopPage(),
    ));

class EopPage extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<EopPage> {
  var user;
  var userData;
  var userDetail;
  List<Anchor> anchorData;

  @override
  void initState() {
    _getUserInfo();
    super.initState();
  }

  void _getUserInfo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('loginRes');
    user = json.decode(userJson);
    // userDetail =user['UserDetail'];
    anchorData = user['Anchors'];
    print(anchorData);
    //  print(userDetail);
    setState(() {
      userData = user;
      
    });
  }
 

  
  Widget personDetailCard() {


    return Container(
            
    
      padding: const EdgeInsets.all(10.0),

      ////////////// 1st card///////////
    
            
      child: Card(
        elevation: 4.0,
        color: Colors.grey[100],
        margin: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          padding: EdgeInsets.only(left: 15, top: 20, bottom: 10),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/user.png')))),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text('',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF9b9b9b),
                      fontSize: 20,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              Container(width: 10),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      'Allocated Farmers:',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color(0xFF9b9b9b),
                        fontSize: 14.0,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 70, top: 12),
                    child: Text('',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 14.0,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      'Validated Farmers:',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color(0xFF9b9b9b),
                        fontSize: 14.0,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 70, top: 12),
                    child: Text('',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 14.0,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      'Non Validated Farmers:',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color(0xFF9b9b9b),
                        fontSize: 14.0,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, top: 12),
                    child: Text('',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 14.0,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      'Distribution Centers:',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color(0xFF9b9b9b),
                        fontSize: 14.0,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60, top: 12),
                    child: Text('',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 14.0,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      'Daily Inventory Status:',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color(0xFF9b9b9b),
                        fontSize: 14.0,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, top: 12),
                    child: Text('Completed',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: 'Completed' == 'Completed'
                            ? Colors.green
                            : Colors.red,
                        fontSize: 14.0,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  /////////// Buttons /////////////

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: 'Completed' == 'Completed'
                        ? FlatButton(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 8, bottom: 8, left: 10, right: 10),
                              child: Text(
                                'Validate Farmer',
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
                                      builder: (context) => StartScanPage()));
                              // Edit()was here
                            },
                          )
                        : FlatButton(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 8, bottom: 8, left: 10, right: 8),
                              child: Text(
                                'Take Inventory',
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
                                      builder: (context) => StockPage()));
                            },
                          ),
                  ),

                  /////////// End of Buttons /////////////
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('Dashboard'),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Icon(Icons.card_membership,
                    size: 35, color: Colors.orange[400]),
                Text(
                  'Assigned Anchors',
                  style: TextStyle(color: Colors.orange[400], fontSize: 25),
                ),
                Icon(Icons.notifications_none, size: 35, color: Colors.white)
              ],
            ),
            Column(
                children: anchorData.map((p) {
                  print('Anchor List');
                  print(p);
              return personDetailCard();
            }).toList())
          ],
        ),
      ),
    );
  }
}
