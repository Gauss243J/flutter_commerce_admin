import 'package:flutter/material.dart';
import 'package:flutter_commerce_admin/controllers/order_controller.dart';
import 'package:flutter_commerce_admin/controllers/product_controller.dart';
import 'package:flutter_commerce_admin/models/models.dart';
import 'package:flutter_commerce_admin/services/database_service.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
class OrdersScreen extends StatelessWidget {
  OrdersScreen({Key? key}) : super(key: key);
  final OrderController orderController=Get.put(OrderController());
  final ProductController productController= Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
        backgroundColor: Colors.black,
      ),

      body: Column(
        children: [
          Expanded(

              child: Obx(
                    ()=> ListView.builder(
                        itemCount: orderController.pendingOrders.length,
                        itemBuilder: (BuildContext context,int index){
                          return OrderCard(order:orderController.pendingOrders[index]);
                    }),
              ))
        ],
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
 final Order order;
 OrderCard({Key? key, required this.order}) : super(key: key);
 final DataBaseService dataBase=DataBaseService();
final OrderController orderController=Get.find();
 final ProductController productController= Get.find();


  @override
  Widget build(BuildContext context) {
  var products=productController.products
      .where((product)=>order.productIds.contains(product.id))
      .toList();
  var addDt = DateTime.now();
  addDt.add(Duration(days: 5, hours: 5, minutes: 30));

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return  AlertDialog(
          title: Text(order.customName),
          content: SizedBox(
            child: Column(
              children: [
                const Text('ADRESSE',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),),
                Texte(value:order.ville , title:'Ville'),
                Texte(value:order.quartier , title:'Quartier'),
                Texte(value:order.avenue , title:'Avenue'),
                Texte(value:order.repereAdress , title:'Precision'),

                Texte(value:order.phoneNumber , title:'Numero Phone'),
                Texte(value:order.delais.toString() , title:'Delais'),
                Texte(value:order.delais.toString() , title:'Date Livraison'),
              ],
            ),
          ),

          actions: <Widget>[


          ],
        );
      },
    );
  }

    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10.0,
          right: 10,
          top: 10,
        ),
        child:
          Card(
            margin:EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${order.customName}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),),
                      Text(DateFormat('dd-MM-yy').format(order.createdAt),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const  SizedBox(height: 10.0,),

                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: products.length,
                      itemBuilder: (BuildContext context,int index){
                      return InkWell(
                        onTap: (){
                          _showDialog();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom:10.0),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: Image.network(
                                  products[index].imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const  SizedBox(width: 10.0,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(products[index].name,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  fontWeight: FontWeight.bold,),
                                  ),
                                  const  SizedBox(height: 10.0,),
                                  SizedBox(
                                    width:200,
                                    child: Text(products[index].description,
                                      style: const TextStyle(
                                        fontSize: 12,
                                      ),
                                      overflow: TextOverflow.clip,
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                      }
                      ),

                  const  SizedBox(height: 10.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children:  [
                          const Text(
                            "Delivery Free",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),),
                          const  SizedBox(height: 10.0,),
                          Text(
                            "${order.deliveryFee}",
                            style:const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),


                      Column(
                        children:  [
                          const Text(
                            "Total",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),),
                          Text(
                            "${order.total}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),),

                        ],
                      ),

                    ],
                  ),
                  const  SizedBox(height: 10.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      order.isAccepted
                      ? ElevatedButton(
                          onPressed: (){
                            orderController.updateOrder(
                                order,
                                'isDelivered',
                                !order.isDelivered);
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                          minimumSize: const Size(120,40),
                          ),
                          child: const Text(
                            "Deliver",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                      )
                      :ElevatedButton(
                        onPressed: (){
                          orderController.updateOrder(
                              order,
                              'isAccepted',
                              !order.isAccepted);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          minimumSize: const Size(120,40),
                        ),
                        child: const Text(
                          "Accept",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),

                      ElevatedButton(
                        onPressed: (){
                          orderController.updateOrder(
                              order,
                              'isCancelled',
                              !order.isCancelled);
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                          minimumSize: const Size(120,40),),
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
      ),

    );
  }
}

class Texte extends StatelessWidget {
  final String value;
  final String title;

  const Texte({
    Key? key,
    required this.value,
    required this.title,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Text(title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),),
        SizedBox(width: 4,),
        Text(value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],

    );
  }
}


