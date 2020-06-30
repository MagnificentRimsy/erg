import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:erg_app/oldPages/weather_model.dart';

class HttpService {
  final String postsURL = "https://api.yikascorner.com/api/get-customers";

  // the future is to load the json data that was into a string 
  Future<List<Post>> getPosts() async {
    Response res = await get(postsURL,   headers: _setHeaders());

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Post> posts = body
          .map(
            (dynamic item) => Post.fromJson(item),
          )
          .toList();
      return posts;
    } else {
      print(res.statusCode);
    }
  }

  _setHeaders() => {
      'Content-type' : 'application/json',
      'Accept' : 'application/json',
  };
}












// class Resource<T> {
//   final String url; 
//   T Function(Response response) parse;

//   Resource({this.url,this.parse});
// }

// class Webservice {

//   Future<T> load<T>(Resource<T> resource) async {

//       final response = await http.get(resource.url);
//       if(response.statusCode == 200) {
//         return resource.parse(response);
//       } else {
//         throw Exception('Failed to load data!');
//       }
//   }

// }