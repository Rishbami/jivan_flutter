import 'package:http/http.dart' as http; // convention and just easier#
import 'dart:convert';
import 'location.dart';

class Decoder {
  Location location = Location();
  final String url;

  Decoder({required this.url});

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    print(response.statusCode);
    if(response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}