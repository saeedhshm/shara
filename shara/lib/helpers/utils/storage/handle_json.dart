

import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:shara/helpers/utils/printutils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JsonHandler{

  final String shared_key;
  JsonHandler(this.shared_key);


  void writeJson(Map<String,dynamic> json) async {

    //3. Convert _json ->_jsonString
    var _jsonString = jsonEncode(json);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(shared_key, _jsonString);

  }

  Future<Map<String,dynamic>> readJson() async {

    final prefs = await SharedPreferences.getInstance();
    final String _jsonString = prefs.getString(shared_key);

    if (_jsonString != null) {
      try {
        return jsonDecode(_jsonString);
      } catch (e) {

        print('Tried reading _file error: $e');

        return null;
      }

    }
    return null;
  }


  Future deleteFile() async {
    final prefs = await SharedPreferences.getInstance();
    // Remove data for the 'counter' key.
    final success = await prefs.remove(shared_key);
  }

}