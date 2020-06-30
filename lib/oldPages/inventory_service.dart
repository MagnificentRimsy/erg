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
    
    final String inventoryStatusURL ="http://api.ergagro.com:112/CheckDailyStockTakingStatus?userId=${user['UserId']}&agentId=${userDetail['Oid']}";
    Response res = await get(inventoryStatusURL, headers: _setHeaders());

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<CheckInventoryStatus> inventoryStatus = body
          .map(
            (dynamic item) => CheckInventoryStatus.fromJson(item),
          )
          .toList();

      return inventoryStatus;
      
    } else {
      print("${res.statusCode}");
    }
  }

  _setHeaders() => {
    'Content-type' : 'application/json',
    'Accept' : 'application/json',
  };
}
