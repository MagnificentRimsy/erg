import 'dart:convert';
import 'package:http/http.dart';
import 'package:erg_app/models/users_model.dart';

import 'package:shared_preferences/shared_preferences.dart';


class HttpService {
  final String url = "http://api.ergagro.com:112/";

   Future<List<Anchor>> getAnchors(List<Anchor> anchorList)  {
     
          // List<Anchor> anchors = anchorList
          // .map(
          //   (Anchor item) => Anchor.fromJson(item),
          // )
          // .toList();
          // print('Get Anchors ${anchorList}');
      return Future.value(anchorList);
   
  }

  // the future is to load the json data that was into a string 
  Future<List<Userinfo>> getUserInfo() async {
    Response res = await get(url,   headers: _setHeaders());

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Userinfo> users = body
          .map(
            (dynamic item) => Userinfo.fromJson(item),
          )
          .toList();
      return users;
    } else {
      print(res.statusCode);
    }
  }

  _setHeaders() => {
      'Content-type' : 'application/json',
      'Accept' : 'application/json',
  };



}

