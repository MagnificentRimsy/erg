import 'dart:convert';
import 'package:http/http.dart';
import 'package:erg_app/models/album_model.dart';

class HttpService {
  final String postsURL = "https://jsonplaceholder.typicode.com/Albums";

  Future<List<Album>> getAlbums() async {
    Response res = await get(postsURL);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Album> Albums = body
          .map(
            (dynamic item) => Album.fromJson(item),
          )
          .toList();

      return Albums;
    } else {
      throw "Can't get Albums.";
    }
  }
}