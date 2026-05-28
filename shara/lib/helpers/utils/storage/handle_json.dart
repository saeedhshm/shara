

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class JsonHandler{

  final String shared_key;
  JsonHandler(this.shared_key);


  Future<void> writeJson(Map<String,dynamic>? json) async {

    //3. Convert _json ->_jsonString
    final prefs = await SharedPreferences.getInstance();
    if (json != null) {
      var _jsonString = jsonEncode(json);
      await prefs.setString(shared_key, _jsonString);
    } else {
      await prefs.remove(shared_key);
    }

  }

  Future<Map<String,dynamic>?> readJson() async {

    final prefs = await SharedPreferences.getInstance();
    final String? _jsonString = prefs.getString(shared_key);

    if (_jsonString == null) {
      return null;
    }

    try {
      return jsonDecode(_jsonString) as Map<String,dynamic>;
    } catch (e) {

      print('Tried reading _file error: $e');

      return null;
    }
  }


  Future<void> deleteFile() async {
    final prefs = await SharedPreferences.getInstance();
    // Remove data for the 'counter' key.
    await prefs.remove(shared_key);
  }

}