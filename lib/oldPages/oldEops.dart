import 'package:erg_app/StockPage.dart';
import 'package:flutter/material.dart';
import 'package:erg_app/Widgets/nav-drawer.dart';
import 'package:erg_app/oldPages/eopmodel.dart';
import 'package:erg_app/StartScan.dart';

void main() => runApp(MaterialApp(
      home: EopPage(),
    ));

class EopPage extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<EopPage> {
  List<Person> persons = [
    Person(
        name: 'RIFAN',
        profileImg: 'assets/images/user.png',
        allocated_farmers: "300",
        validated_farmers: "345",
        non_validated_farmers: "120",
        daily_inventory_status: "Completed",
        distribution_centers: "100"),
    Person(
        name: 'MAAN',
        profileImg: 'assets/images/user.png',
        allocated_farmers: "230",
        validated_farmers: "195",
        non_validated_farmers: "110",
        daily_inventory_status: "Incompleted",
        distribution_centers: "70"),
    Person(
        name: 'COPMAN',
        profileImg: 'assets/images/user.png',
        allocated_farmers: "560",
        validated_farmers: "45",
        non_validated_farmers: "780",
        daily_inventory_status: "Completed",
        distribution_centers: "40"),
  ];

  Widget personDetailCard(Person) {
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
                                image: AssetImage(Person.profileImg)))),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    Person.name,
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
                    child: Text(
                      Person.allocated_farmers,
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
                    child: Text(
                      Person.validated_farmers,
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
                    child: Text(
                      Person.non_validated_farmers,
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
                    child: Text(
                      Person.distribution_centers,
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
                    child: Text(
                      Person.daily_inventory_status,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Person.daily_inventory_status == 'Completed'
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
                    child: Person.daily_inventory_status == 'Completed'
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
                                      builder: (context) => StockInventoryPage()));
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
                children: persons.map((p) {
              return personDetailCard(p);
            }).toList())
          ],
        ),
      ),
    );
  }
}
