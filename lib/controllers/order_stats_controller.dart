import 'package:flutter_commerce_admin/models/models.dart';
import 'package:flutter_commerce_admin/services/database_service.dart';
import 'package:get/get.dart';

class OrderStatsController extends GetxController{
  final DataBaseService database=DataBaseService();
  
  var stats=Future.value(<OrdersStats>[]).obs;

  @override
  void onInit() {
    stats.value=database.getOrdersStats();
    super.onInit();
  }
}