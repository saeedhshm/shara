import 'package:get/get.dart';
import 'package:shara/helpers/translattion/ar.dart';
import 'package:shara/helpers/translattion/en.dart';

class LocalString extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys =>
      {'en': englishString, 'ar': arabicStrings};
}
