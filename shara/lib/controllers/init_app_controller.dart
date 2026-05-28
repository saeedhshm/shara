import 'package:get/get.dart';
import 'package:shara/helpers/apis_urls/api_handler.dart';
import 'package:shara/helpers/apis_urls/app_urls.dart';
import 'package:shara/helpers/utils/printutils.dart';
import 'package:shara/features/auth/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitAppController extends GetxController{
  var userData = UserDataModel().obs;
  // var loading = false.obs;

  var savedLangCode = '';



  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    // await getSavedLangCode();
    await userData.value.getDataFromStorage();

  }

  bool get isArabicLang{
    return (Get.locale?.languageCode == 'ar');
  }

  updateAppLanguage(String langCode) async {
    Get.updateLocale(Locale(langCode));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('lang', langCode);
  }

  Future getSavedLangCode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    savedLangCode = prefs.getString('lang') ?? 'ar' ;
  }

  void sendMessageAction(String? message,onChangeDone){

    var params = {
      'message' : message,
    }  ;

    var headers = {
      'Authorization' : 'bearer ${userData.value.token?.accessToken}' ,
      "x-localization": 'lang_code'.tr,
    } ;
    ApiHandler.sendData(url: sendMessageUrl, callback: (json,stsCode){
      println();
      println(json);
      println();
      onChangeDone(json['success'],json['message']) ;
    }, body: params,header: headers);
  }

  void getUserProfileInfo(){
    var headers = {
      'Authorization' : 'bearer ${userData.value.token?.accessToken}' ,
      "x-localization": 'lang_code'.tr,
    } ;

    ApiHandler.getData(url: profileDataUrl, header: headers ,callback: (json){
      UserModel user = UserModel.fromJson(json);
      userData.value = UserDataModel(
        success: userData.value.success,
        token: userData.value.token,
        user: user,
      );
      userData.value.saveDataToStorage();
      update();
    });
  }

}