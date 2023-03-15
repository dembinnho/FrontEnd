import 'dart:convert';

import 'package:flutter/services.dart';

Future<List<dynamic>> getLocationBody() async {
  final String response = await rootBundle.loadString('assets/locations_movie.json',cache: false );
  List<dynamic> body =  jsonDecode(response);
  return Future.delayed(Duration(seconds: 1), () {
    return body;
  });
}