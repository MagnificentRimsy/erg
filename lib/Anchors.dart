import 'package:erg_app/Details.dart';
import 'package:flutter/material.dart';
import 'package:erg_app/Widgets/nav-drawer.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MaterialApp(
      home: AnchorsPage(),
    ));

class AnchorsPage extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

List<Anchor> _parseAnchors(Map<String, dynamic> map) {
  final anchors = <Anchor>[];
  for (var anchorMap in map['Anchors']) {
    final anchor = Anchor.fromMap(anchorMap);
    anchors.add(anchor);
  }
  return anchors;
}

class Anchor {
  final int oId;
  final String name;
  final String acronym;
  final List<DistributionCenter> distributionCenters;

  const Anchor({
    @required this.oId,
    @required this.name,
    @required this.acronym,
    @required this.distributionCenters,
  });

  factory Anchor.fromMap(Map<String, dynamic> map) {
    final distributionCenters = <DistributionCenter>[];
    for (var distribution in map['DistributionCentres']) {
      final distributionCenter = DistributionCenter.fromMap(distribution);
      distributionCenters.add(distributionCenter);
    }

    return Anchor(
      oId: map['Oid'] as int,
      name: map['Name'] as String,
      acronym: map['Acronym'] as String,
      distributionCenters: distributionCenters,
    );
  }
}

class DistributionCenter {
  final int id;
  final String name;
  final String address;

  const DistributionCenter({
    @required this.id,
    @required this.name,
    @required this.address,
  });

  factory DistributionCenter.fromMap(Map<String, dynamic> map) {
    return DistributionCenter(
      id: map['Oid'] as int,
      name: map['Name'] as String,
      address: map['Address'] as String,
    );
  }
}

class _MyHomeState extends State<AnchorsPage> {
  var user;
  var userData;
  List anchors = [];
  @override
  void initState() {
    _getUserAnchor();
    super.initState();
  }

  _getUserAnchor() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('loginRes');
    user = json.decode(userJson);
    setState(() {
      anchors = user['Anchors'];
    });
    print(anchors);
    setState(() {
      userData = anchors;
    });
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
      body: Container(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.card_membership,
                    size: 30, color: Colors.orange[400]
                ),
            
                Text(
                  'Assigned Anchors',
                  style: TextStyle(color: Colors.orange[400], fontSize: 20),
                ),
              ],
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: anchors.length,
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
                                  anchors[i]['Acronym'],
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
                                    anchors[i]['Oid'].toString(),
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
                                    anchors[i]['Oid'].toString(),
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
                                    anchors[i]['Oid'].toString(),
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
                                    anchors[i]['Oid'].toString(),
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
                                    '3',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Colors.green,
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
                                  child: FlatButton(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 8,
                                          bottom: 8,
                                          left: 10,
                                          right: 8),
                                      child: Text(
                                        'View Details',
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
                                            new BorderRadius.circular(20.0)),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          new MaterialPageRoute(
                                              builder: (context) => detailsPage(
                                                  value: anchors[i])));
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
