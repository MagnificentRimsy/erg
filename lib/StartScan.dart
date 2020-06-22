import 'dart:async';
import 'package:erg_app/ProfilePage.dart';
import 'package:erg_app/eops.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:erg_app/Animations/FadeAnimation.dart';
import 'package:flutter/services.dart';



void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartScanPage(),
    )
  );
}

class StartScanPage extends StatefulWidget {
  @override
  StartScanPageState createState() {
      return new StartScanPageState();
  }
}

  class StartScanPageState extends State<StartScanPage>  {

  String result = "Bio Data:";

  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ProfilePage(result : qrResult),
        ),
      );
      // setState(() {
      //   result = qrResult; 
      // });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          result = "Camera permission was denied";
        });
      } else {
        setState(() {
          result = "Unknown Error $ex";
        });
      }
    } on FormatException {
      setState(() {
        result = "You pressed the back button before scanning anything";
      });
    } catch (ex) {
      setState(() {
        result = "Unknown Error $ex";
      });
    }
  }

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
                    image: AssetImage('assets/images/illustration1.png')
                  )
                ),
              )),
              Column(
                children: <Widget>[
                  FadeAnimation(1.5, MaterialButton(
                    color: Colors.green,
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: _scanQR,
                   
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