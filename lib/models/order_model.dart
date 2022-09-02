import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Order extends Equatable{
  final String id;
  final String customId;
  final String customName;
  final String phoneNumber;
  final String ville;
  final String quartier;
  final String avenue;
  final int delais;
  final String repereAdress;
  final int modeLivraison;
  final int modePayement;
  final List<String>productIds;
  final double deliveryFee;
  final double subtotal;
  final double total;
  final bool isAccepted;
  final bool isDelivered;
  final bool isCancelled;
  final DateTime createdAt;


  const Order({
      required this.id,
      required this.customId,
      required this.customName,
      required this.phoneNumber,
      required this.ville,
      required this.quartier,
      required this.avenue,
      required this.delais,
      required this.repereAdress,
      required this.modeLivraison,
      required this.modePayement,
      required this.productIds,
      required this.deliveryFee,
      required this.subtotal,
      required this.total,
      required this.isAccepted,
      required this.isDelivered,
      required this.isCancelled,
      required this.createdAt
  });

  Order copyWith({
    String? id,
    String? customId,
    String?customName,
    String?phoneNumber,
    String? ville,
    String? quartier,
    String? avenue,
    String? repereAdress,
    int? modeLivraison,
    int? modePayement,
    List<String>?productIds,
    double? deliveryFee,
    double? subtotal,
    int? delais,
    double? total,
    bool? isAccepted,
    bool? isDelivered,
    bool? isCancelled,
    DateTime? createdAt,
}){
return Order(
    id: id?? this.id,
    customId: customId??this.customId,
    customName: customName??this.customName,
    phoneNumber: phoneNumber??this.phoneNumber,
    ville:ville??this.ville,
    quartier:quartier??this.quartier,
    avenue:avenue??this.avenue,
    delais:delais??this.delais,
    repereAdress:repereAdress??this.repereAdress,
    modeLivraison:modeLivraison??this.modeLivraison,
    modePayement:modePayement??this.modePayement,
    productIds: productIds??this.productIds,
    deliveryFee: deliveryFee??this.deliveryFee,
    subtotal: subtotal??this.subtotal,
    total: total??this.total,
    isAccepted: isAccepted??this.isAccepted,
    isDelivered: isDelivered??this.isDelivered,
    isCancelled: isCancelled??this.isCancelled,
    createdAt: createdAt??this.createdAt,
);
}

  Map<String,dynamic>toMap(){
    return {
      'id': id,
      'customId': customId,
      'customName':customName,
      'ville':ville,
      'quartier':quartier,
      'avenue':avenue,
      'delais':delais,
      'repereAdress':repereAdress,
      'modeLivraison': modeLivraison,
      'modePayement': modePayement,
      'productIds': productIds,
      'deliveryFee': deliveryFee,
      'subtotal': subtotal,
      'total': total,
      'isAccepted': isAccepted,
      'isDelivered': isDelivered,
      'isCancelled':isCancelled,
      'createdAt': createdAt.millisecondsSinceEpoch,  }  ;
  }

  factory Order.fromSnapshot(DocumentSnapshot snap){
    Map customerAdress = Map();
    customerAdress=Map.from(snap['customerAdress']);
        return Order(
            id: snap.id,
            customId: snap['customerId'],
            customName:snap['customerName'],
            phoneNumber:snap['customerNumber'],
            ville:customerAdress['ville'],
            quartier: customerAdress['quartier'],
            avenue:customerAdress['avenue'],
            delais:snap['delais'],
            repereAdress:customerAdress['repereAdress'],
            modeLivraison:snap['modeLivraison'],
            modePayement: snap['modePayement'],
            productIds: List<String>.from(snap['productIds']),
            deliveryFee: double.parse(snap['deliveryFee']),
            subtotal: double.parse(snap['subtotal']),
            total: double.parse(snap['total']),
            isAccepted: snap['isAccepted'],
            isDelivered: snap['isDelivered'],
            isCancelled: snap['isCancelled'],
            createdAt: snap['createdAt'].toDate());
  }
  String toJson()=>json.encode(toMap());

  @override
  bool get stringify =>
      true;

  @override
  List<Object> get props{
  return [
        id,
        customId,
        productIds,
        customName,
        phoneNumber,
        ville,
        delais,
        quartier,
        avenue,
        repereAdress,
        modeLivraison,
        modePayement,
        deliveryFee,
        subtotal,
        total,
        isAccepted,
        isDelivered,
        isCancelled,
        createdAt,
    ];
  }

  static List<Order> orders= [
    Order(id:'12',
      customId:'2344',
      productIds:const ['1','2'],
      customName:'dk',
      phoneNumber:'',
      delais:2,
      ville:'ville',
      quartier:'quartier',
      avenue:'avenue',
      repereAdress:'repereAdress',
      modeLivraison:1,
      modePayement: 1,
      deliveryFee:19,
      subtotal:27,
      total:30,
      isAccepted:false,
      isDelivered:false,
      isCancelled:false,
      createdAt: DateTime.now(),
    ),

    Order(id:'28',
      customId:'23',
      delais:2,
      productIds:const ['1','2','3'],
      customName:'customName',
      phoneNumber:'phoneNumber',
      ville:'ville',
      quartier:'quartier',
      avenue:'avenue',
      repereAdress:'repereAdress',
      modeLivraison:1,
      modePayement: 2,
      deliveryFee:10,
      subtotal:30,
      total:30,
      isAccepted:false,
      isDelivered:false,
      isCancelled:false,
      createdAt: DateTime.now(),
    ),
    ];


}