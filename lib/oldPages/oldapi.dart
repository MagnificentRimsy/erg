import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class CallApi{
    final String _url = 'https://api.yikascorner.com/api/';

    postData(data, apiUrl) async {
        var fullUrl = _url + apiUrl + await _getToken(); 
        return await http.post(
            fullUrl, 
            body: jsonEncode(data), 
            headers: _setHeaders()
        );
    }
    getData(apiUrl) async {
       var fullUrl = _url + apiUrl + await _getToken(); 
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


// Old login function of the login page below
// void _login() async {
//     setState(() {
//       _isLoading = true;
//     });

//     var data = {
//       'email': mailController.text,
//       'password': passwordController.text
//     };

//     var res = await CallApi().postData(data, 'signin');
//     var body = json.decode(res.body);
//     if (body['success']) {
//       SharedPreferences localStorage = await SharedPreferences.getInstance();
//       localStorage.setString('token', body['token']);
//       localStorage.setString('customer', json.encode(body['customer']));
//       Navigator.push(
//           context,
//           new MaterialPageRoute(
//               builder: (context) => Home())); //this goes to the Home
//     } else {
//       _showMsg(body['message']);
//     }

//     setState(() {
//       _isLoading = false;
//     });
    
//   }
