import 'package:flutter/material.dart';
import 'package:erg_app/ProfilePage.dart';

void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StockPage(),
    )
);

class StockPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inventory Data',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: StockInventory(),
    );
  }
}

class StockInventory extends StatefulWidget {
  @override
  _StockInventoryState createState() => _StockInventoryState();
}


class _StockInventoryState extends State<StockInventory> {
   List<Products> products;
  List<Products> selectedProducts;
  bool sort;

  @override
  void initState() {
    sort = false;
    selectedProducts = [];
    products = Products.getProducts();
    super.initState();
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
  Widget build(BuildContext context){
        return Scaffold(
          appBar: AppBar(
          title: new Center(child: new Text('Daily Stock Taking', textAlign: TextAlign.center)),
          automaticallyImplyLeading: false,
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.green,),

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
                        child: Text("Take Inventory", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14), ),
                        onPressed: () {
                          // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfilePage()));
                          showSimpleCustomDialog(context);
                        },
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        
                      ),
                      ),
                    ),
                  ),

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
                                  Text(product.itemqty),
                                  onTap: () {
                                    print('Selected ${product.itemqty}');
                                  },
                                ),
                              ]),
                        )
                        .toList(),
                  ),          
                ),
                Container(
                    child: Center(
                      child: RaisedButton(
                        padding: EdgeInsets.fromLTRB(80, 10, 80, 10),
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



class Products {
  String count;
  String name;
  String measuringunit;
  String itemqty;
  Products({this.count, this.name, this.itemqty, this.measuringunit});

  static List<Products> getProducts() {
    return <Products>[
      Products(count:"1", name: "NPK Fertilizer", itemqty: "50", measuringunit: "bag",),
      Products(count:"2", name: "Urea Fertilizer", itemqty: "560", measuringunit: "bag",),
      Products(count:"3", name: "Spray", itemqty: "150", measuringunit: "bottles",),
    ];
  }
}


void showSimpleCustomDialog(BuildContext context) {
    Dialog simpleDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        height: 300.0,
        width: 300.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           Padding( 
                padding: EdgeInsets.only(top:20, bottom: 20, left: 30, right: 10),
                child: Row(
                children: <Widget>[
                  Expanded(child: 
                    Text(
                      'Item',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, ),
                      ),
                  ),
                  Container(width: 2,),
                  Container(
                    // decoration: ShapeDecoration(
                    //   shape: RoundedRectangleBorder(
                    //     side: BorderSide(width: 10.0, style: BorderStyle.solid),
                    //     borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        
                    //   ),
                    // ),
                    child:DropdownButton<String>(
                      items: <String>['Fertilizers', 'Bags', 'Spray', 'Equipments'].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      
                      onChanged: (String value) {},
                    )
                  ),
        
                ],
              )),  
            
            Padding( 
                padding: EdgeInsets.only(top:5, bottom: 5, left: 30, right: 10),
                child: Row(
                children: <Widget>[
                  Expanded(child: 
                    Text(
                      'Quantity',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, ),
                      ),
                  ),
                  Container(width: 2,),
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
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Add',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  RaisedButton(
                    color: Colors.red,
                    onPressed: () {
                      Navigator.pop(context);
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => StockPage()));
                    },
                    child: Text(
                      'Cancel!',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(
        context: context, builder: (BuildContext context) => simpleDialog);
}

// Dropdown Menu Class below
