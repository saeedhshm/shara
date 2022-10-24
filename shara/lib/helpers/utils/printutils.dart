import 'package:flutter/foundation.dart';
import 'dart:developer';

println([dynamic object = '']) {
  if (kDebugMode) {
    log('$object');
  }
}
