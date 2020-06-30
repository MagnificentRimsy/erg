import 'package:erg_app/oldPages/inventory_service.dart';
import 'package:erg_app/models/checkInventoryStatus.dart';
import 'package:flutter/material.dart';

class StatusPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inventory Status"),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder(
        future: httpService.getInventoryStatus(),
        builder: (BuildContext context,
            AsyncSnapshot<List<CheckInventoryStatus>> snapshot) {
          if (snapshot.hasData) {
            List<CheckInventoryStatus> inventoryStatus = snapshot.data;
            return ListView(
              children: inventoryStatus
                  .map(
                    // I just want to display the message so I know its working then I will now store it in shared preference and use it
                    //to show or hide a take inventory button on this page latter
                    (CheckInventoryStatus inventoryStatus) => ListTile(
                      title: Text(inventoryStatus.message),
                      subtitle: Text("${inventoryStatus.message}"),
                    ),
                  )
                  .toList(),
            );
          } else {
            return Text(" ${snapshot.error} ");

            // return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}


























// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:async';
// import 'dart:convert';

// void main() {
//   runApp(MaterialApp(
//     home: StatusPage(),
//   ));
// }

// class StatusPage extends StatefulWidget {
//   @override
//   _StatusPageState createState() => _StatusPageState();
// }

// class _StatusPageState extends State<StatusPage> {
//   Map data;
  
//   String message;
//   List stock;

//   Future getData() async {
//     http.Response response = await http.get("http://api.ergagro.com:112/CheckDailyStockTakingStatus?userId=b6caf34c-a425-4710-a3ee-aa22a382882a&agentId=57");
//     data = json.decode(response.body);
//     print('Inventory Status');
//     print(data);

//     setState(() {
//       stock = data["Stock"];
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     getData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Ventory Status"),
//         backgroundColor: Colors.green,
//       ),
//       body: ListView.builder(
//         itemCount: stock == null ? 0 : stock.length,
//         itemBuilder: (BuildContext context, int index) {
//           return Card(
//             child: Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Row(
//                 children: <Widget>[
//                   // CircleAvatar(
//                   //   backgroundImage: NetworkImage(userData[index]["avatar"]),
//                   // ),
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Text(
//                       "${stock[index]["CreatedBy"]} ${stock[index]["CreatedOn"]}",
//                       style: TextStyle(
//                         fontSize: 20.0,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
