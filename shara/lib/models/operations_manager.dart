import 'package:get/get.dart';

class OperationItem{
  final int index;

  OperationItem(this.index);

  String get brandName{
    return 'ماذركير براند';
  }
  String get icon{
    return 'assets/images/holders/${index % 5}.png';
  }
  String get desc{
    return 'عملية شراء من نقط بيع';
  }
  String get opCost{
    return '10.00' + 'SR'.tr;
  }

  String get opTime{
    return '12.20 | 30.9.2022';
  }
}