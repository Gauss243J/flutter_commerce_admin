import 'package:flutter_commerce_admin/models/models.dart';
import 'package:flutter_commerce_admin/services/database_service.dart';
import 'package:get/get.dart';

class OrderController extends GetxController{
  final DataBaseService database=DataBaseService();

  var orders=<Order>[].obs;
  var pendingOrders=<Order>[].obs;
  @override
  void onInit() {
    orders.bindStream(database.getOrders());
    pendingOrders.bindStream(database.getPendingOrders());
    super.onInit();
  }

  void updateOrder(
      Order order,
      String field,
      bool value,
      ){
    database.updateOrder(order,field,value);
  }
}