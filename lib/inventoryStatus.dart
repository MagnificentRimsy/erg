import 'package:erg_app/api/inventory_service.dart';

import 'package:erg_app/models/checkInventoryStatus.dart';
import 'package:flutter/material.dart';

class StatusPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inventory Status"),
      ),
      body: FutureBuilder(
        future: httpService.getInventoryStatus(),
        builder: (BuildContext context, AsyncSnapshot<List<CheckInventoryStatus>> snapshot) {
          if (snapshot.hasData) {
            List<CheckInventoryStatus> posts = snapshot.data;
            return ListView(
              children: posts
                  .map(
                    (CheckInventoryStatus inventoryStatus) => ListTile(
                      title: Text(inventoryStatus.message),
                      subtitle: Text("${inventoryStatus.message}"),
                      // onTap: () => Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => PostDetail(
                      //       inventoryStatus: post,
                      //     ),
                      //   ),
                      // ),
                    ),
                  )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}