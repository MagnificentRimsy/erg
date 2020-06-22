
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:erg_app/api/albumservice.dart';
import 'package:erg_app/AlbumDetails.dart';
import 'package:erg_app/models/album_model.dart';
void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScanPage(),
    ));

class ScanPage extends StatefulWidget {
  @override
  ScanPageState createState() {
      return new ScanPageState();
  }
}

class ScanPageState extends State<ScanPage> {
  String album = '';
  final HttpService httpService = HttpService();


  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      
      
      return Scaffold(
         body:  FutureBuilder(
          future: httpService.getAlbums(),
          builder: (BuildContext context, AsyncSnapshot<List<Album>> snapshot) {
            if (snapshot.hasData) {
              List<Album> albums = snapshot.data;
               albums.map(
                      (Album album) => 
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AlbumDetailsPage(key, 
                              album : qrResult,
                            ),
                          ),
                        ),
                      
                    );  
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      );
      
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          album = "Camera permission was denied";
        });
      } else {
        setState(() {
          album = "Unknown Error $ex";
        });
      }
    } on FormatException {
      setState(() {
        album = "You pressed the back button before scanning anything";
      });
    } catch (ex) {
      setState(() {
        album = "Unknown Error $ex";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('View Album Details'),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.green,
      ),
     
        // body: Center(
        //   child: Text(
        //     result,
        //     style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        //   ),
          
        // ),

      floatingActionButton: FloatingActionButton.extended(
            icon: Icon(Icons.camera_alt),
            label: Text("Scan Album"),
            onPressed: _scanQR,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        );

    
  }
}

