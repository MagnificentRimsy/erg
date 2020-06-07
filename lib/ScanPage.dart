import 'package:flutter/material.dart';

void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScanPage(),
    )
);

class ScanPage extends StatelessWidget { 
   @override
  Widget build(BuildContext context){
        return Scaffold(

          appBar: AppBar(
          title: new Center(child: new Text('Scan Personnel QR', textAlign: TextAlign.center)),
          automaticallyImplyLeading: false,
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.green, 
          ),

          body: Container(
            child: ListView(
              children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 100),
                    child: Center(
                      child: RaisedButton(
                        padding: EdgeInsets.fromLTRB(145, 10, 145, 10),
                        color: Colors.green,
                        child: Text("New Scan", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14), ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScanPage()));
                        },
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      ),
                    ),                  ),
              ],
            ),
          ),
        );
  }
}

// import 'dart:async';
// import 'package:barcode_scan/barcode_scan.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   String barcode = "";

//   @override
//   initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           appBar: AppBar(title: Text('Scan User Card'),
//             iconTheme: IconThemeData(color: Colors.white),
//             backgroundColor: Colors.green,
//           ),
//           body: Center(
//             child: Column(
//               children: <Widget>[
//                 Container(
//                   child: RaisedButton(
//                     onPressed: barcodeScanning,
//                     child: Text("Capture Image",
//                       style: TextStyle(fontSize: 20, color: Colors.white),
//                     ),
//                     color: Colors.green,
//                   ),
//                   padding: const EdgeInsets.all(10.0),
//                   margin: EdgeInsets.all(10),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                 ),
//                 Text("Scanned Barcode Number",
//                   style: TextStyle(fontSize: 20),
//                 ),
//                 Text(barcode,
//                   style: TextStyle(fontSize: 25, color:Colors.green),
//                 ),
//               ],
//             ),
//           )),
//     );
//   }

//   //scan barcode asynchronously
//   Future barcodeScanning() async {
//     try {
//       String barcode = await BarcodeScanner.scan() as String;
//       setState(() => this.barcode = barcode);
//     } on PlatformException catch (e) {
//       if (e.code == BarcodeScanner.cameraAccessDenied) {
//         setState(() {
//           this.barcode = 'No camera permission!';
//         });
//       } else {
//         setState(() => this.barcode = 'Unknown error: $e');
//       }
//     } on FormatException {
//       setState(() => this.barcode =
//       'Nothing captured.');
//     } catch (e) {
//       setState(() => this.barcode = 'Unknown error: $e');
//     }
//   }
// }