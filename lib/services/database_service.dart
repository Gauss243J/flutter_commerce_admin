import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_commerce_admin/models/models.dart';

class DataBaseService{
  final FirebaseFirestore _firebaseFirestore=FirebaseFirestore.instance;


  Future<List<OrdersStats>> getOrdersStats(){
    return _firebaseFirestore
        .collection('order_stats')
        .orderBy('dateTime')
        .get()
        .then((querySnapshot) =>querySnapshot.docs
          .asMap()
          .entries
          .map((entry) => OrdersStats.fromSnapshot(entry.value, entry.key))
          .toList() );
  }

  Stream<List<Order>> getOrders(){
    return _firebaseFirestore
        .collection('checkout')
        .snapshots()
        .map((snapshot){
      return snapshot
          .docs
          .map((doc) => Order.fromSnapshot(doc)).toList();
    });
  }

  Stream<List<Product>> getProducts(){
    return _firebaseFirestore
        .collection('products')
        .snapshots()
        .map((snapshot){
          return snapshot
              .docs
              .map((doc) => Product.fromSnapshot(doc)).toList();
    });
  }

  Stream<List<Order>> getPendingOrders(){
    return _firebaseFirestore
        .collection('checkout')
        .where('isDelivered',isEqualTo: false)
        .where('isCancelled',isEqualTo: false)
        .snapshots()
        .map((snapshot){
      return snapshot
          .docs
          .map((doc) => Order.fromSnapshot(doc)).toList();
    });
  }


  Future<void> addProduct(Product product){
    return _firebaseFirestore
        .collection('products')
        .add(product.toMap());
  }

  Future<void> updateField(
      Product product,
      String field,
      dynamic newValue){
    return _firebaseFirestore
        .collection('products')
        .where('id',isEqualTo: product.id)
        .get()
        .then((querySnapshot) => {
          querySnapshot
              .docs
              .first
              .reference
              .update({field:newValue})
    });
  }

  Future<void> updateOrder(
      Order order,
      String field,
      dynamic newValue){
    return _firebaseFirestore
        .collection('checkout')
        .where('id',isEqualTo: order.id)
        .get()
        .then((querySnapshot) => {
      querySnapshot
          .docs
          .first
          .reference
          .update({field:newValue})
    });
  }


}