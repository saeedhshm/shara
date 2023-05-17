import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shara/helpers/utils/printutils.dart';

class AppApiHandler {
  static void getData(
      {@required String url,
      Map<String, String> header,
      Map<String, dynamic> body,
      @required callback}) async {


    var uri = Uri.parse(url);
    final response = await http.get(uri, headers: header);


    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      callback(json);
    } else {
      callback      (null);
    }
  }

  static void sendData(
      {@required String url,
      @required dynamic body,
      Map<String, String> header,
      @required callback(json, stsCode)}) async {
    var uri = Uri.parse(url);

    final response = await http.post(uri, body: body, headers: header);
     // if(response.statusCode == 200){
    try {
      final json = jsonDecode(response.body) ;
      callback(json, response.statusCode);
    } catch (error) {
      callback(null, response.statusCode);
    }


    // }else{
    //   callback(null);
    // }
  }

  static void sendDataWithConType(
      {@required String url,
      @required dynamic body,
      Map<String, String> header,
      @required callback}) async {
    var uri = Uri.parse(url);
   
    final response = await http
        .post(uri, body: body, headers: {"Content-Type": "application/json"});

    // if(response.statusCode == 200){
    final json = jsonDecode(response.body);
    callback(json);
    // }else{
    //   callback(null);
    // }
  }
}
