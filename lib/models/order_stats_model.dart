import 'package:charts_flutter/flutter.dart' as charts;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrdersStats{
  final DateTime dateTime;
  final int index;
  final int orders;
  charts.Color?barColor;

  OrdersStats({
    required this.dateTime,
    required this.index,
    required this.orders,
    this.barColor}){
    barColor=
        charts.ColorUtil.fromDartColor(Colors.black);
  }

  factory OrdersStats.fromSnapshot(DocumentSnapshot snap,int index){
    return OrdersStats(
        dateTime: snap['dateTime'].toDate(),
        index: index,
        orders: snap['orders'],);
  }

  static final List<OrdersStats> data=[
    OrdersStats(
        dateTime: DateTime.now(),
        index: 0,
        orders: 10,),
    OrdersStats(
      dateTime: DateTime.now(),
      index: 1,
      orders: 12,),
    OrdersStats(
      dateTime: DateTime.now(),
      index: 2,
      orders: 27,
    ),
    OrdersStats(
      dateTime: DateTime.now(),
      index: 3,
      orders: 30,),
    OrdersStats(
      dateTime: DateTime.now(),
      index: 4,
      orders: 25,),
    OrdersStats(
      dateTime: DateTime.now(),
      index: 5,
      orders: 29,),
    OrdersStats(
      dateTime: DateTime.now(),
      index: 6,
      orders: 16,),
    OrdersStats(
      dateTime: DateTime.now(),
      index: 7,
      orders: 21,),
    OrdersStats(
      dateTime: DateTime.now(),
      index: 8,
      orders: 19,),
    OrdersStats(
      dateTime: DateTime.now(),
      index: 9,
      orders: 15,),

  ];

}