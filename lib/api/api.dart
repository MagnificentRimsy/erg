import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class CallApi{
    final String _url = 'http://api.ergagro.com:112/';

    postData(data, apiUrl) async {
      //  + await _getToken();
        var fullUrl = _url + apiUrl; 
        return await http.post(
            fullUrl, 
            body: jsonEncode(data), 
            headers: _setHeaders()
        );
    }
      //  + await _getToken(); 
    getData(apiUrl) async {
       var fullUrl = _url + apiUrl; 
       return await http.get(
         fullUrl, 
         headers: _setHeaders()
       );
    }

    _setHeaders() => {
        'Content-type' : 'application/json',
        'Accept' : 'application/json',
    };

    _getToken() async {
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        var token = localStorage.getString('token');
        return '?token=$token';
    }
}