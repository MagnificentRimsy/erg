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

                 new Container(
              width: 100.00,
              height: 100.00,
              decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: AssetImage('assets/images/icon.png'),
                  fit: BoxFit.fitHeight,
                  ),
            )),
            //     Container(
                       
            //             child: DataTable(
            //   sortAscending: sort,
            //   sortColumnIndex: 0,
            //   columns: [
            //     DataColumn(
            //       label: Text("S/No", style: TextStyle(fontSize: 16)),
            //       numeric: false,
            //     ),
            //     DataColumn(
            //         label: Text("Item", style: TextStyle(fontSize: 16)),
            //         numeric: false,
            //         onSort: (columnIndex, ascending) {
            //           setState(() {
            //             sort = !sort;
            //           });
            //           onSortColum(columnIndex, ascending);
            //         }),
            //     DataColumn(
            //       label: Text("QtyInStock", style: TextStyle(fontSize: 16)),
            //       numeric: false,
            //     ),
            //     DataColumn(
            //       label: Text("Unit", style: TextStyle(fontSize: 16)),
            //       numeric: false,
            //     ),
            //   ],
            //   rows: products
            //       .map(
            //         (product) => DataRow(
            //             selected: selectedProducts.contains(product),
            //             cells: [
            //               DataCell(
            //                 Text(product.count),
            //                 onTap: () {
            //                   print('Selected ${product.count}');
            //                 },
            //               ),
            //               DataCell(
            //                 Text(product.name),
            //                 onTap: () {
            //                   print('Selected ${product.name}');
            //                 },
            //               ),
            //               DataCell(
            //                 Text(product.itemqty),
            //                 onTap: () {
            //                   print('Selected ${product.itemqty}');
            //                 },
            //               ),
            //               DataCell(
            //                 Text(product.itemqty),
            //                  onTap: () {
            //                   print('Selected ${product.itemqty}');
            //                 },
            //               ),
            //             ]),
            //       )
            //       .toList(),
            // ),
                  
            //     ),
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