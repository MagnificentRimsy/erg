import 'package:erg_app/StartScan.dart';
import 'package:flutter/material.dart';
import 'package:erg_app/models/album_model.dart';

// void main() {

//   runApp(ProfilePage());
// }

class ProfilePage extends StatefulWidget {
  final String result;

  ProfilePage({this.result});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<profile> profs = [
    profile('Abdul_Rehman', '123456', '03144905958', 'test id 1', 'pakistan',
        '666666', '221.174,996.258'),
    profile('Jawad', 'BARCODE12345', '090078601', 'test id 2', 'USA', '666666',
        '221.174,996.258'),
    profile('Waleed', '9788175257665', '03040033496', 'test id 3', 'MALDIVES',
        '666666', '221.174,996.258'),
  ];
  profile p;

  @override
  void initState() {
    for (profile i in profs) {
      if (widget.result == i.bvn) {
        setState(() {
          p = i;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: new Center(
              child: new Text('Farmers Data', textAlign: TextAlign.left)),
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.green,
          leading: new IconButton(
            icon: new Icon(Icons.assignment_ind),
            onPressed: () {},
          ),
        ),
        // backgroundColor: Colors.green[50],
        body: Container(
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20),
              ),
              CircleAvatar(
                radius: 80,
                backgroundColor: Colors.grey,
                // backgroundImage: AssetImage('assets/images/user.png'),
              ),
              Text(
                p.name,
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'SourceSansPro',
                  color: Colors.green[400],
                  letterSpacing: 2.5,
                ),
                textAlign: TextAlign.center,
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
              ),
              SizedBox(
                height: 20.0,
                width: 200,
                child: Divider(
                  color: Colors.teal[100],
                ),
              ),
              Text(
                'Farmer Details',
                textAlign: TextAlign.center,
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Text(
                    'BVN:',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'SourceSansPro',
                      color: Colors.green[700],
                      letterSpacing: 2.5,
                    ),
                  ),
                  title: Text(
                    p.bvn,
                    style: TextStyle(fontFamily: 'BalooBhai', fontSize: 20.0),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Text(
                    'Phone:',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'SourceSansPro',
                      color: Colors.green[700],
                      letterSpacing: 2.5,
                    ),
                  ),
                  title: Text(
                    p.phone,
                    style: TextStyle(fontFamily: 'BalooBhai', fontSize: 20.0),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Text(
                    'Appicant ID:',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'SourceSansPro',
                      color: Colors.green[700],
                      letterSpacing: 2.5,
                    ),
                  ),
                  title: Text(
                    p.appliId,
                    style: TextStyle(fontFamily: 'BalooBhai', fontSize: 20.0),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Text(
                    'State/LGA:',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'SourceSansPro',
                      color: Colors.green[700],
                      letterSpacing: 2.5,
                    ),
                  ),
                  title: Text(
                    p.state,
                    style: TextStyle(fontFamily: 'BalooBhai', fontSize: 20.0),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Text(
                    'Farm Size:',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'SourceSansPro',
                      color: Colors.green[700],
                      letterSpacing: 2.5,
                    ),
                  ),
                  title: Text(
                    p.farmsize,
                    style: TextStyle(fontFamily: 'BalooBhai', fontSize: 20.0),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Text(
                    'Geo Coord.:',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'SourceSansPro',
                      color: Colors.green[700],
                      letterSpacing: 2.5,
                    ),
                  ),
                  title: Text(
                    p.geocord,
                    style: TextStyle(fontFamily: 'BalooBhai', fontSize: 20.0),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 30),
                child: Center(
                  child: RaisedButton(
                    padding: EdgeInsets.fromLTRB(80, 10, 80, 10),
                    color: Colors.green,
                    child: Text(
                      "Complete",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => StartScanPage()));
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class profile {
  String name, bvn, phone, appliId, state, farmsize, geocord;

  profile(this.name, this.bvn, this.phone, this.appliId, this.state,
      this.farmsize, this.geocord);
}
