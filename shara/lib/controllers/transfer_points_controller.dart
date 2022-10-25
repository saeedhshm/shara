import 'package:fast_contacts/fast_contacts.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shara/helpers/utils/printutils.dart';

class TransferPointsController extends GetxController{

  var contacts = <Contact>[].obs;
  var _contacts = <Contact>[];

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
    contacts.value = _contacts.where((e) => e.displayName.toLowerCase().contains(name.toLowerCase())).toList();
  }
  getContacts() async {
    println('--------------------------- contact in getContacts()');
    loading.value = true;
    await Permission.contacts.request();
    var status = await Permission.contacts.status;
    println('--------------------------- contact ${status.isGranted}');
    if (!status.isGranted) {
      // We didn't ask for permission yet or the permission has been denied before but not permanently.
      println('--------------------------- contact requst');
      status = await Permission.contacts.request();
    }else{
      println('--------------------------- contact not requested');
    }

    if(status.isGranted){
      List<Contact> data = await FastContacts.allContacts;
      _contacts = data.where((element) => element.phones.isNotEmpty).toList();
    contacts.value = _contacts;
    }
    loading.value = false;
  }

}