import 'package:fast_contacts/fast_contacts.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shara/helpers/utils/printutils.dart';

import '../helpers/apis_urls/api.dart';
import '../helpers/apis_urls/app_urls.dart';
import '../models/app_contact.dart';
import 'init_app_controller.dart';

class TransferPointsController extends GetxController{

  var contacts = <AppContact>[].obs;
  var _contacts = <AppContact>[];

  var loading = false.obs;



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getContacts();
  }

  searchFor({String name}){
    if(name == null || name == ''){
      contacts.value = _contacts;
      return;
    }
    contacts.value = _contacts.where((e) => e.name.toLowerCase().contains(name.toLowerCase())).toList();
  }
  getContacts() async {
    loading.value = true;
    await Permission.contacts.request();
    var status = await Permission.contacts.status;
    if (!status.isGranted) {
      status = await Permission.contacts.request();
    }else{
    }

    if(status.isGranted){
      List<Contact> data = await FastContacts.allContacts;

      for(var contact in data){
        if(contact.phones.isNotEmpty){
          List<AppContact> ac = [];
          for(var phone in contact.phones){
            // var mob = phone.replaceAll('-', '').replaceAll(' ', '').replaceAll('+', '00');
            var mob = '';
            for(var i in phone.split('')){
              if(int.tryParse(i) != null){
                mob += i;
              }
            }
            if('${int.tryParse(mob)}'.substring(0,1) == '5'){
              mob = '966'+'${int.tryParse(mob)}';
            }
            AppContact c = AppContact(contact.displayName,int.tryParse(mob).toString());
            ac.add(c);
          }
          Map<String, AppContact> mp = {};
          for (var item in ac) {
            mp[item.phone] = item;
          }
          _contacts.addAll(mp.values.toList());
        }
      }
     _contacts = _contacts.where((element) => '${int.tryParse(element.phone)}'.substring(0,3) == '966' ).toList();

    contacts.value = _contacts;

    List<int> pohone = _contacts.map((e) => int.tryParse(e.phone)).toList();

      InitAppController appController = Get.find();
      var body = {
        "phones": '[${pohone.join(',')}]'
      };
      AppApiHandler.sendData(
          url: syncPhonesUrl,
          body: body,
          header: {
            'Authorization' : 'bearer ${appController.userData.value.token.accessToken}' ,
            "x-localization":'lang_code'.tr,'Content-Type':'application/x-www-form-urlencoded'},
          callback: (json,stsCode) {
            loading.value = false;
            println('---- success ----- = $json');
            if(json['success']){

            } else{
            }
          });

    }
    // loading.value = false;
  }

}