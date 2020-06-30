import 'dart:convert';
import 'package:http/http.dart';
import 'package:erg_app/models/checkInventoryStatus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HttpService {
  var user;
  var userData;
  var userDetail;
  var anchors;

  Future<List<CheckInventoryStatus>> getInventoryStatus() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('loginRes');
    user = json.decode(userJson);
    userDetail = user['UserDetail'];
    anchors = user['Anchors'];

    final String inventoryStatusURL =
        "http://api.ergagro.com:112/CheckDailyStockTakingStatus?userId=${userDetail['Oid']}&agentId=${user['UserId']}";

    Response res = await get(inventoryStatusURL);

    if (res.statusCode == 200) {
      //  var body = json.decode(res.body);
      //  localStorage.setString('inventoryStatus', json.encode(body));
      List<dynamic> body = jsonDecode(res.body);

      List<CheckInventoryStatus> inventoryStatus = body
          .map(
            (dynamic item) => CheckInventoryStatus.fromJson(item),
          )
          .toList();

      return inventoryStatus;
    } else {
      throw "Can't get inventoryStatus.";
    }
  }
}
