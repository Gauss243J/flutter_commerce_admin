import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable{

  final String id;
  final String name;
  final String category;
  final String description;
  final String pointlivraison;
  final String imageUrl;
  final bool isRecommended;
  final bool isPopular;
  double price;
  int quantity;
  int delais;
  int rating;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.pointlivraison,
    required this.imageUrl,
    required this.isRecommended,
    required this.isPopular,
     this.price=0,
     this.quantity=0,
    this.delais=0,
    this.rating=0,
  });

  @override
  List<Object?> get props {
    return [
      id,
      name,
      category,
      description,
      pointlivraison,
      imageUrl,
      price,
      isPopular,
      isRecommended,
      price,
      quantity,
      delais,
    ];
  }


  Product copyWith({
    String? id,
    String? name,
    String? category,
    String? description,
    String? pointlivraison,
    String? imageUrl,
    bool? isRecommended,
    bool? isPopular,
    double? price,
    int? quantity,
    int? delais,
    int? rating,
}){
    return Product(
        id: id??this.id,
        name: name??this.name,
        category: category??this.category,
        description: description??this.description,
        pointlivraison: pointlivraison??this.pointlivraison,
        imageUrl: imageUrl??this.imageUrl,
        isRecommended: isRecommended??this.isRecommended,
        isPopular: isPopular??this.isPopular,
        price: price??this.price,
        quantity: quantity??this.quantity,
        delais: delais??this.delais,
        rating: rating??this.rating,
    );
  }

  Map<String,dynamic> toMap(){
    return{
      'id': id,
      'name': name,
      'category': category,
      'pointlivraison':pointlivraison,
      'description': description,
      'imageUrl': imageUrl,
      'isRecommended': isRecommended,
      'isPopular': isPopular,
      'price': price,
      'quantity': quantity,
      'delais':delais,
      'rating':rating,
    };
  }

  factory Product.fromSnapshot(DocumentSnapshot snap){
    return Product(
      id: snap.id,
      name: snap['name'],
      category: snap['category'],
      description: snap['description'],
      imageUrl: snap['imageUrl'],
      pointlivraison: snap['pointlivraison'],
      isRecommended: snap['isRecommended'],
      isPopular: snap['isPopular'],
      price: snap['price'].toDouble(),
      quantity: snap['quantity'].toInt(),
      delais: snap['delais'].toInt(),
      rating: snap['delais'].toInt(),
    );
  }

  String toJson()=>json.encode(toMap());

  @override
  bool get stringify=>true;

  static List<Product> products=[
    Product(
      id:'1',
      name:'Soft Drink #1',
      description: 'Apple Color Emoji lore; ispsum dolor sit amet',
      category:'Soft Drink',
      pointlivraison: 'goma',
      imageUrl:'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      price:2.99,
      quantity: 10,
      delais: 3,
      rating: 0,
      isPopular: true,
      isRecommended:false,
    ),
    Product(
      id:'2',
      name:'Soft Drink #2',
      description: 'Android Color Emoji lore; ispsum dolor sit amet',
      category:'Soft Drink',
      pointlivraison: 'goma',
      imageUrl:'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      price:4.99,
      quantity: 5,
      delais: 3,
      rating: 0,
      isPopular: true,
      isRecommended:false,
    ),
    Product(
      id: '3',
      name:'Soft Drink #3',
      description: 'Ampoule Color Emoji lore; ispsum dolor sit amet',
      category:'Smoothies',
      pointlivraison: 'goma',
      imageUrl:'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      price:2.99,
      quantity: 20,
      delais: 3,
      rating: 0,
      isPopular: true,
      isRecommended:false,
    ),
    Product(
      id: '4',
      name:'Soft Drink #4',
      description: 'Radio Color Emoji lore; ispsum dolor sit amet',
      category:'Smoothies',
      pointlivraison: 'goma',
      imageUrl:'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      price:2.99,
      quantity: 12,
      delais: 3,
      rating: 0,
      isPopular: true,
      isRecommended:false,
    ),
    Product(
      id: '5',
      name:'Soft Drink #5',
      description: 'TV Color Emoji lore; ispsum dolor sit amet',
      category:'Soft Drink',
      pointlivraison: 'goma',
      imageUrl:'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      price:2.99,
      quantity: 9,
      delais: 3,
      rating: 0,
      isPopular: true,
      isRecommended:false,
    ),

    Product(
      id: '6',
      name:'Soft Drink #6',
      description: 'Phone Color Emoji lore; ispsum dolor sit amet',
      category:'water',
      pointlivraison: 'goma',
      imageUrl:'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      price:2.99,
      quantity: 4,
      delais: 3,
      rating: 0,
      isPopular: false,
      isRecommended:true,
    ),


  ];


}