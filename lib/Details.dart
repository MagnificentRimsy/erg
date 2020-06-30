import 'package:erg_app/Anchors.dart';
import 'package:erg_app/StockPage.dart';
import 'package:erg_app/Widgets/nav-drawer.dart';
import 'package:erg_app/inventoryStatus.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:erg_app/api/api.dart';

class detailsPage extends StatefulWidget {
  Map<String, dynamic> value;

  detailsPage({Key key, @required this.value}) : super(key: key);

  @override
  _detailsPageState createState() => _detailsPageState(value);
}

class _detailsPageState extends State<detailsPage> {
  var user;
  var userData;
  var userDetail;
  var anchors;
  @override
  void initState() {
    _getUserInfo();
    super.initState();
    _checkDailyStockTakingStatus();
  }

  void _getUserInfo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('loginRes');
    user = json.decode(userJson);
    userDetail = user['UserDetail'];
    anchors = user['Anchors'];
    // print(user['UserId']);
    // print(userDetail['Oid']);
    // print(user['UserId']);
    //  print(userDetail);
    setState(() {
      // We use it to check if the data is null
      userData = user;
    });
  }

  void _checkDailyStockTakingStatus() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('loginRes');
    user = json.decode(userJson);
    userDetail = user['UserDetail'];
    anchors = user['Anchors'];

    print(user['UserId']);
    print(userDetail['Oid']);

     var res = await CallApi().getData('CheckDailyStockTakingStatus?userId=${userDetail['Oid']}&agentId=${user['UserId']}');
     var body = json.decode(res.body);
     if (body['Success']) {

    localStorage.setString('inventoryStatus', json.encode(body));
      print('======== Agent data =========');

      print(localStorage.getString('inventoryStatus'));

    //   // Navigator.push(
    //   //     context, new MaterialPageRoute(builder: (context) => AnchorsPage()));
     } else {
    //   // _showMsg();
       print(Text('Something Went Wrong'));
     }
  }

  Map<String, dynamic> value;

  _detailsPageState(this.value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text("Anchor Details"),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(width: 15),
                Icon(Icons.home, size: 30, color: Colors.green[400]),
                SizedBox(width: 15),
                Text(
                  '${value['Acronym']} Distribution Center(s)',
                  style: TextStyle(color: Colors.green[400], fontSize: 20),
                ),
              ],
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: value['DistributionCentres'].length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int i) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    ////////////// 1st card///////////

                    child: Card(
                      elevation: 4.0,
                      color: Colors.grey[100],
                      margin: EdgeInsets.only(
                          left: 10, right: 10, top: 20, bottom: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
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
                                              image: AssetImage(
                                                  'assets/images/user.png')))),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  value['DistributionCentres'][i]['Name'],
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
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 10),
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
                                  padding:
                                      const EdgeInsets.only(left: 70, top: 12),
                                  child: Text(
                                    '300',
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
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 10),
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
                                  padding:
                                      const EdgeInsets.only(left: 70, top: 12),
                                  child: Text(
                                    '400',
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
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 10),
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
                                  padding:
                                      const EdgeInsets.only(left: 40, top: 12),
                                  child: Text(
                                    '123',
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
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 10),
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
                                  padding:
                                      const EdgeInsets.only(left: 60, top: 12),
                                  child: Text(
                                    '76',
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
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 10),
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
                                  padding:
                                      const EdgeInsets.only(left: 50, top: 12),
                                  child: Text(
                                    'Completed',
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
                                /////////// Based on the response I want to use it to control these two buttons below
                                ///if the response is 200 it should display validate farmer else it should display Take Inventory/////////////

                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: 'InCompleted' == 'Completed'
                                      ? FlatButton(
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: 8,
                                                bottom: 8,
                                                left: 10,
                                                right: 10),
                                            child: Text(
                                              'Validate Farmers',
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
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      20.0)),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                new MaterialPageRoute(
                                                    builder: (context) =>
                                                        AnchorsPage()));
                                            // Edit()was here
                                          },
                                        )
                                      : FlatButton(
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: 8,
                                                bottom: 8,
                                                left: 10,
                                                right: 8),
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
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      20.0)),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                new MaterialPageRoute(
                                                    builder: (context) =>
                                                      StatusPage()   ));
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
                })
          ],
        ),
      ),
    );
  }
}
