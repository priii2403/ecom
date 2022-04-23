import 'dart:convert';
import 'package:http/http.dart' as http;

import 'model_class.dart';

Future<AlbumData> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://raw.githubusercontent.com/kp-bitcoding/ad-manager/main/pragnesh_demo/demo.json'));

  if (response.statusCode == 200) {

    print("ook okkk");

    // If the server did return a 200 OK response,
    // then parse the JSON.
    return AlbumData.fromJson(jsonDecode(response.body));
  } else {

    print("not not");
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
