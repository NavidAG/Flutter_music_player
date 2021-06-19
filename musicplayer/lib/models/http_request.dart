import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class MyHttpRequest {
  static Future<Response> searchRequest(String search) async {
    final response = await http.get(
      Uri.parse('https://deezerdevs-deezer.p.rapidapi.com/search?q=$search'),
      // Send authorization headers to the backend.

      headers: {
        "x-rapidapi-key": "b4ffe4b8e5mshb895889b99bef99p16e502jsn50ed31d05883",
        "x-rapidapi-host": "deezerdevs-deezer.p.rapidapi.com",
        // "useQueryString": "true",
      },
    );
    // print(response.body);

    return response;
  }

  static Future<Response> getMusicByID(int id) async {
    final response = await http.get(
      Uri.parse(
          'https://deezerdevs-deezer.p.rapidapi.com/track/$id'), //70266758
      // Send authorization headers to the backend.

      headers: {
        "x-rapidapi-key": "b4ffe4b8e5mshb895889b99bef99p16e502jsn50ed31d05883",
        "x-rapidapi-host": "deezerdevs-deezer.p.rapidapi.com",
        // "useQueryString": "true",
      },
    );
    print(response.body);
    return response;
  }
}
