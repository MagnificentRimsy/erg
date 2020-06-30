import 'dart:async';
import 'package:erg_app/Anchors.dart';
import 'package:erg_app/Details.dart';
import 'package:erg_app/StartScan.dart';
import 'package:erg_app/datatable.dart';
import 'package:flutter/material.dart';
import 'package:erg_app/ProfilePage.dart';
import 'dart:convert';
import 'package:erg_app/api/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: StockInventoryPage(),
  ));
}

class StockInventoryPage extends StatefulWidget {
  StockInventoryPage({Key key}) : super(key: key); //Find out meaning

  @override
  _StockInventoryPageState createState() => _StockInventoryPageState();
}

class _StockInventoryPageState extends State<StockInventoryPage> {
  List<Products> products;
  List<Products> selectedProducts;
  GlobalKey<ScaffoldState> _scaffoldKey;

  bool _isLoading = false;
  bool _isEnabled = false;
  bool _isUpdate = false;

  String _name;
  String _currentQuantity;
  String _quantity;

  _showSnackBar(context, message) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  void initState() {
    selectedProducts = [];
    products = Products.getProducts();
    _scaffoldKey = GlobalKey(); // key to get the context to show a SnackBar
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // Beginning of form widgets

  Widget _buildItemName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Item Name'),
      enabled: _isEnabled,
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildCurrentQuantity() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Item Current Quantity'),
      enabled: _isEnabled,
      keyboardType: TextInputType.number,
      onSaved: (String value) {
        _currentQuantity = value;
      },
    );
  }

  Widget _buildQuantity() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Quantity'),
      keyboardType: TextInputType.number,
      validator: (String value) {
        int quantity = int.tryParse(value);

        if (quantity == null || quantity <= 0) {
          return 'Quantity must be greater than 0';
        }

        return null;
      },
      onSaved: (String value) {
        _quantity = value;
      },
    );
  }

//End of form widgets

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Take Inventory'),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
        child: ListView(
          children: <Widget>[
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(width: 15),
                Icon(Icons.timelapse, size: 30, color: Colors.green[400]),
                SizedBox(width: 15),
                Text(
                  'Summary of Inventory',
                  style: TextStyle(color: Colors.green[400], fontSize: 20),
                ),
              ],
            ),

            ////////// Stock Summary//////////////

            Padding(
              padding: const EdgeInsets.all(5.0),
              ////////////// 1st card///////////

              child: Card(
                elevation: 4.0,
                color: Colors.grey[100],
                margin:
                    EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  padding: EdgeInsets.only(left: 15, top: 20, bottom: 10),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(width: 10),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Text(
                              'Fertilizers:',
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
                            padding: const EdgeInsets.only(left: 105, top: 12),
                            child: Text(
                              '2435',
                              // anchors[i]['Oid'].toString(),
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
                              'Spray:',
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
                            padding: const EdgeInsets.only(left: 130, top: 12),
                            child: Text(
                              '243',
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
                              'Harvest Equipments',
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
                            padding: const EdgeInsets.only(left: 42, top: 12),
                            child: Text(
                              '423',
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
                              'Urea Fertilizer:',
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
                            padding: const EdgeInsets.only(left: 78, top: 12),
                            child: Text(
                              '546',
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
                              'Planting Equipment:',
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
                            padding: const EdgeInsets.only(left: 45, top: 12),
                            child: Text(
                              '345',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.grey,
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
                      // button was here
                    ],
                  ),
                ),
              ),
            ),
            ////////// End of Stock Summary//////////////

            Divider(),
            SizedBox(height: 20),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(width: 35),
                Icon(Icons.category, size: 30, color: Colors.green[400]),
                SizedBox(width: 15),
                Text(
                  'Take Inventory',
                  style: TextStyle(color: Colors.green[400], fontSize: 20),
                ),
              ],
            ),

            // Form widget initialization
            Container(
              margin: EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    if (_isUpdate == true) ...[
                      _buildItemName(),
                      _buildCurrentQuantity(),
                      _buildQuantity(),
                      SizedBox(height: 30),
                      Container(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: RaisedButton(
                            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                            color: Colors.green,
                            child: Text(
                              "Update",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                            onPressed: () {
                              if (!_formKey.currentState.validate()) {
                                return;
                              }

                              _formKey.currentState.save();

                              print(_name);
                              print(_currentQuantity);
                              print(_quantity);

                              //Send to API
                              setState(() {
                                _isUpdate = false;
                              });

                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ),
                    ],
                    Divider(),
                    SizedBox(height: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columns: [
                            DataColumn(
                              label: Text('ID'),
                            ),
                            DataColumn(
                              label: Text('Items'),
                            ),
                            DataColumn(
                              label: Text('Quantities'),
                            ),
                            // Lets add one more column to show a delete button
                            DataColumn(
                              label: Text('Update'),
                            )
                          ],
                          rows: products
                              .map(
                                (product) => DataRow(
                                    selected:
                                        selectedProducts.contains(product),
                                    cells: [
                                      DataCell(
                                        Text(product.count),
                                        onTap: () {
                                          print('Selected ${product.count}');
                                        },
                                      ),
                                      DataCell(
                                        Text(product.name),
                                        onTap: () {
                                          print('Selected ${product.name}');
                                        },
                                      ),
                                      DataCell(
                                        Text(product.itemqty),
                                        onTap: () {
                                          print('Selected ${product.itemqty}');
                                        },
                                      ),
                                      DataCell(
                                        Text('Edit'),
                                        onTap: () {
                                          setState(() {
                                            _isUpdate = true;
                                          });
                                        },
                                        showEditIcon: true,
                                      ),
                                    ]),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      child: Row(
                        children: <Widget>[
                          RaisedButton(
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            color: Colors.green,
                            child: Text(
                              "Submit and Validate",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                            onPressed: () {
                              if (!_formKey.currentState.validate()) {
                                return;
                              }

                              _formKey.currentState.save();

                              print(_name);
                              print(_currentQuantity);
                              print(_quantity);

                               Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => StartScanPage() ));

                              //Send to API
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(300),
                            ),
                          ),
                          SizedBox(width: 10),
                          RaisedButton(
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            color: Colors.orangeAccent,
                            child: Text(
                              "Submit and Close",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                            onPressed: () {
                              // if (!_formKey.currentState.validate()) {
                              //   return;
                              // }

                              // _formKey.currentState.save();

                              // print(_name);
                              // print(_category);
                              // print(_currentQuantity);
                              // print(_quantity);

                              //Send to API
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => AnchorsPage() ));
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
            // End of form widget Initialization

            Divider(),
          ],
        ),
      ),
    );
  }
}

//Product Model
class Products {
  String count;
  String name;
  String measuringunit;
  String itemqty;
  Products({this.count, this.name, this.itemqty, this.measuringunit});

  static List<Products> getProducts() {
    return <Products>[
      Products(
        count: "1",
        name: "NPK Fertilizer",
        itemqty: "50",
        measuringunit: "bag",
      ),
      Products(
        count: "2",
        name: "Urea Fertilizer",
        itemqty: "560",
        measuringunit: "bag",
      ),
      Products(
        count: "3",
        name: "Spray",
        itemqty: "150",
        measuringunit: "bottles",
      ),
    ];
  }
}
