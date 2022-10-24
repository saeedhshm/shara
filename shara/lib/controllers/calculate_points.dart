import 'package:get/get.dart';
import 'package:shara/helpers/apis_urls/api.dart';
import 'package:shara/helpers/apis_urls/app_urls.dart';
import 'package:shara/helpers/utils/printutils.dart';
import 'package:shara/models/clac_points.dart';

class CalculatePointsController extends GetxController{

  var earningPoints = true.obs;

  List<CalcPoints> points = <CalcPoints>[].obs;
  CalcPoints selectedPoint;
  var loading = true.obs;

  var totalSpendingPoints = '0.0'.obs;
  var totalEarningPoints = '0.0'.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMembershipsForCalc();
  }

  getMembershipsForCalc(){
    AppApiHandler.getData(url: calcPointsUrl, callback: (json){
      for(var item in json){
        points.add(CalcPoints.fromJson(item));
      }
      loading.value = false;
    });
  }

  calculateSpendingPoints(double value){
    totalSpendingPoints.value = (value * ((double.tryParse('${selectedPoint.lossRatio}')  ?? 0.0)/ 100.0)).toStringAsFixed(2);
  }

  calculateEarningPoints(double value){
    totalEarningPoints.value = (value * ((double.tryParse('${selectedPoint.earnRatio}')  ?? 0.0)/ 100.0)).toStringAsFixed(2);
  }
}