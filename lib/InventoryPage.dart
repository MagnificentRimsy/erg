import 'package:flutter/material.dart';

import 'ProfilePage.dart';

void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InventoryPage(),
    )
);



class InventoryPage extends StatelessWidget {
  final _minimumPadding = 5.0;

  @override
  Widget build(BuildContext context) {   
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Stock Taking', textAlign: TextAlign.center,),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.green, 
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
              //head
              Padding( 
                padding: EdgeInsets.only(top: _minimumPadding * 4, bottom: 20, left: 10, right: 10),
                child: Row(
                children: <Widget>[
                   Expanded(child: 
                    Text(
                      'Cost of Transportation',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, ),
                      ),
                  ),
                  Container(width: 25,),
                  Expanded(child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Quantity',
                        hintText: 'Enter Cost Transportation',
                        border:OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))
                    ),
                  )),

                  
                ],
              )),

              Padding( 
                padding: EdgeInsets.only(top:20, bottom: 20, left: 10, right: 10),
                child: Row(
                children: <Widget>[
                   Expanded(child: 
                    Text(
                      'Cost of Seeds',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, ),
                      ),
                  ),
                  Container(width: 25,),
                  Expanded(child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Quantity',
                        hintText: 'Enter Cost Quantity',
                        border:OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))
                    ),
                  )),

                  
                ],
              )),

              Padding( 
                padding: EdgeInsets.only(top:20, bottom: 20, left: 10, right: 10),
                child: Row(
                children: <Widget>[
                    Expanded(child: 
                    Text(
                      'Cost of Fertilizer NPK',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, ),
                      ),
                  ),
                  Container(width: 25,),
                  Expanded(child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Quantity',
                        hintText: 'Enter Cost Quantity',
                        border:OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))
                    ),
                  )),

                  
                ],
              )),

              Padding( 
                padding: EdgeInsets.only(top:20, bottom: 20, left: 20, right: 10),
                child: Row(
                children: <Widget>[
                  Expanded(child: 
                    Text(
                      'Cost of Bags',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, ),
                      ),
                  ),
                  Container(width: 25,),
                  Expanded(child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Quantity',
                        hintText: 'Enter Cost Quantity',
                        border:OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))
                    ),
                  )),  
                ],
              )),  
              SizedBox(height: 30,),
                  Container(
                    child: Center(
                      child: RaisedButton(
                        padding: EdgeInsets.fromLTRB(145, 10, 145, 10),
                        color: Colors.green,
                        child: Text("Post Inventory", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14), ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfilePage()));
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
    );
  }
}