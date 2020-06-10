import 'package:flutter/material.dart';
import 'package:erg_app/ScanPage.dart';

void main() {
  runApp(ProfilePage());
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  

    // TODO: implement build
    return MaterialApp(
       debugShowCheckedModeBanner: false,

      home: Scaffold(
         appBar: AppBar(

          title: new Center(child: new Text('Farmers Data', textAlign: TextAlign.left)),
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
                Container(margin: EdgeInsets.only(top: 20),),
                CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.grey,
                    // backgroundImage: AssetImage('assets/images/user.png'),
                  
                ),
                Text(
                  'Yusuf Danladi',
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
                Container(margin: EdgeInsets.only(top: 20),),
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
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
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
                          '+234 801 000 4504',
                          style:
                              TextStyle(fontFamily: 'BalooBhai', fontSize: 20.0),
                        ), 
                      ), 
                    ),

                    Card(
                      color: Colors.white,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
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
                          '22108691911',
                          style:
                              TextStyle(fontFamily: 'BalooBhai', fontSize: 20.0),
                        ), 
                      ), 
                    ),

                    Card(
                      color: Colors.white,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
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
                          'ERG-108691911',
                          style:
                              TextStyle(fontFamily: 'BalooBhai', fontSize: 20.0),
                        ), 
                      ), 
                    ),

                    Card(
                      color: Colors.white,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
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
                          'Taraba/Ussa',
                          style:
                              TextStyle(fontFamily: 'BalooBhai', fontSize: 20.0),
                        ), 
                      ), 
                    ),

                    Card(
                      color: Colors.white,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
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
                          '5000 meter sq',
                          style:
                              TextStyle(fontFamily: 'BalooBhai', fontSize: 20.0),
                        ), 
                      ), 
                    ),

                    Card(
                      color: Colors.white,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
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
                          '012350007, 038245543',
                          style:
                              TextStyle(fontFamily: 'BalooBhai', fontSize: 20.0),
                        ), 
                      ), 
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 30),
                      child: Center(
                        child: RaisedButton(
                          padding: EdgeInsets.fromLTRB(80, 10, 80, 10),
                          color: Colors.green,
                          child: Text("Complete", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14), ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScanPage()));
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