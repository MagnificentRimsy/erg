import 'dart:async';
import 'package:flutter/material.dart';
import 'package:erg_app/CaptureInputsPage.dart';
// import 'package:erg_app/ScanPage.dart';
import 'package:erg_app/ProfilePage.dart';
import 'dart:convert';
import 'package:erg_app/api/webservice.dart';
import 'package:erg_app/api/api.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() => runApp(MaterialApp(
      home: StockPage(),
    ));

class StockPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inventory Data',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: StockInventory(),
    );
  }
}

class StockInventory extends StatefulWidget {
  StockInventory({Key key}) : super(key: key); //Find out meaning

  @override
  _StockInventoryState createState() => _StockInventoryState();
}

class _StockInventoryState extends State<StockInventory> {
  List<Products> products;
  List<Products> selectedProducts;

  // GET WEATHER

  bool sort;
  bool _isLoading = false;
  String dropdownValue = 'One';


  @override
  void initState() {
    sort = false;
    selectedProducts = [];
    products = Products.getProducts();
    super.initState();

    // initialization of the http request
  }

  
  onSortColum(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        products.sort((a, b) => a.name.compareTo(b.name));
      } else {
        products.sort((a, b) => b.name.compareTo(a.name));
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Center(
            child: new Text('Daily Stock Taking', textAlign: TextAlign.center)),
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.green,
      ),
      
      body: Container(

        child: ListView(
          
          children: <Widget>[
            Container(

                
              margin: const EdgeInsets.only(right: 20, top: 20),
              child: Align(
                alignment: Alignment.bottomRight,
                child: RaisedButton(
                  padding: EdgeInsets.fromLTRB(14, 10, 14, 10),
                  color: Colors.green,
                  child: Text(
                    "Test APi",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => CaptureInputsPage()));
                    // showSimpleCustomDialog(context);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),

            ////////// Stock Taking Form //////////////
            SizedBox(height: 30),
                Card(
                  elevation: 4.0,
                  color: Colors.white,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        /////////////  Items//////////////
                        ///
                     Padding(
                      padding:
                          EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 10),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              'select Item:',

                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          
                          
                          Container(
                            child:DropdownButton<String>(
                            
                            style: TextStyle(color: Colors.grey),
                            value: dropdownValue,
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 24,
                            elevation: 16,
                            underline: Container(
                              // height: 1,
                              color: Colors.grey,
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue = newValue;
                              });
                            },
                            items: <String>['One', 'Sprayer', 'Harvesting', 'Transportation']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                       
                          ),
                        ],

                )),

               /////////////// Quantity////////////////////
                        TextField(
                          style: TextStyle(color: Color(0xFF000000)),
                          // controller: mailController,
                          cursorColor: Color(0xFF9b9b9b),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.category,
                              color: Colors.grey,
                            ),
                            hintText: "Enter Item Quantity",
                            hintStyle: TextStyle(
                                color: Color(0xFF9b9b9b),
                                fontSize: 15,
                                fontWeight: FontWeight.normal),
                                focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.green)),
                          ),
                        ),
                        /////////////  LogIn Botton///////////////////
                        Padding(
                          padding: const EdgeInsets.only(left:150.0),
                          child: FlatButton(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 8, bottom: 8, left: 5, right: 5),
                              child: Text(
                                _isLoading ? 'Processing...' : 'Add Item',
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
                            disabledColor: Colors.grey,
                            shape: new RoundedRectangleBorder(
                                borderRadius:
                                    new BorderRadius.circular(20.0)),
                            onPressed: _isLoading ? null : _addItem,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                    ////////////   new account///////////////
      



            Container(
              padding: EdgeInsets.only(top: 30, bottom: 30),
              child: DataTable(
                sortAscending: sort,
                sortColumnIndex: 0,
                columns: [
                  DataColumn(
                    label: Text("S/No", style: TextStyle(fontSize: 16)),
                    numeric: false,
                  ),
                  DataColumn(
                      label: Text("Item", style: TextStyle(fontSize: 16)),
                      numeric: false,
                      onSort: (columnIndex, ascending) {
                        setState(() {
                          sort = !sort;
                        });
                        onSortColum(columnIndex, ascending);
                      }),
                      DataColumn(
                        label: Text("QtyInStock", style: TextStyle(fontSize: 16)),
                        numeric: false,
                      ),
                      DataColumn(
                        label: Text("Unit", style: TextStyle(fontSize: 16)),
                        numeric: false,
                      ),
                ],
                rows: products
                    .map(
                      (product) => DataRow(
                          selected: selectedProducts.contains(product),
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
                              Text(product.measuringunit),
                              onTap: () {
                                print('Selected ${product.measuringunit}');
                              },
                            ),
                            
                          ]),
                    )
                    .toList(),
              ),
            ),
            Container(
              
              margin: const EdgeInsets.only( top: 10, bottom: 20),

              child: Center(
                
                child: RaisedButton(
                  padding: EdgeInsets.fromLTRB(80, 10, 80, 10),
                  color: Colors.green,
                  child: Text(
                    "Post Inventory",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ProfilePage()));
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => CaptureInputsPage()));
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


    void _addItem() async {
    setState(() {
      _isLoading = true;
    });

    var data = {
      // 'email': mailController.text,
      // 'password': passwordController.text
    };

    var res = await CallApi().postData(data, 'login');
    var body = json.decode(res.body);
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', body['token']);
      localStorage.setString('user', json.encode(body['user']));
      // Navigator.push(
      //     context,
      //     new MaterialPageRoute(
      //         builder: (context) => LogIn())); //this goes to the Home
    } else {
      // _showMsg(body['message']);
    }

    setState(() {
      _isLoading = false;
    });
  }





}

// Dropdown menu data class
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



