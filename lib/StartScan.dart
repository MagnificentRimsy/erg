import 'package:erg_app/ScanPage.dart';
import 'package:erg_app/eops.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:erg_app/Animations/FadeAnimation.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartScanPage(),
    )
  );
}

class StartScanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  FadeAnimation(1, Text("Verify Farmer", 
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                  ),)),
                  SizedBox(height: 20,),
                  FadeAnimation(1.2, Text("Automatic identity verification which enables you to verify each farmer applicant", 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 15
                  ),)),
                ],
              ),
              FadeAnimation(1.4, Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/illustration.png')
                  )
                ),
              )),
              Column(
                children: <Widget>[
                  FadeAnimation(1.5, MaterialButton(
                    color: Colors.green,
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ScanPage()));
                    },
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.green
                      ),
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Text("Start Scan", style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600, 
                      fontSize: 18
                    ),),
                  )),
                  SizedBox(height: 20,),
                  FadeAnimation(1.6, Container(
                    // padding: EdgeInsets.only(top: 3, left: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border(
                        bottom: BorderSide(color: Colors.green),
                        top: BorderSide(color: Colors.green),
                        left: BorderSide(color: Colors.green),
                        right: BorderSide(color: Colors.green),
                      )
                    ),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => EopPage()));
                      },
                      color: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: Text("Cancel", style: TextStyle(
                        // color: Colors.white,
                        fontWeight: FontWeight.w600, 
                        fontSize: 18
                       ), ),
                    ),
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}