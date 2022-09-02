import 'package:flutter/material.dart';
import 'package:flutter_commerce_admin/controllers/product_controller.dart';
import 'package:flutter_commerce_admin/models/product_model.dart';
import 'package:flutter_commerce_admin/screens/new_product_screen.dart';
import 'package:get/get.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({Key? key}) : super(key: key);
  final ProductController productController= Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center ,
          children: [
              SizedBox(
                height: 100,
                child: Card(
                  margin: EdgeInsets.zero,
                  color: Colors.black,
                  child: Row(
                    children: [
                      IconButton(onPressed: (){
                        Get.to(()=>NewProductsScreen());
                        },icon: const Icon(
                        Icons.add_circle,
                        color: Colors.white,
                      ),
                      ),
                      const Text('Add new Product',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),)
                    ],
                  ),
                ),
              ),
            Expanded(
              child:Obx(
                    ()=> ListView.builder(
                  itemCount: productController.products.length,
                  itemBuilder: (context,index){
                    return SizedBox(
                        height: 210,
                        child: ProductCard(
                          product:productController.products[index],
                          index:index,
                        ),
                    );
                    },
                    ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}

class ProductCard extends StatelessWidget{
  final Product product;
  final int index;
  ProductCard({
    Key? key,
    required this.product, required this.index,}):super(key: key);

 final ProductController productController= Get.find();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      margin: const EdgeInsets.only(top: 6.0),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              product.description,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                SizedBox(
                  height: 65,
                  width: 65,
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 5.0),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                           const SizedBox(
                             width: 30,
                             child: Text(
                              'price',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                          ),
                           ),
                          SizedBox(
                            width: 160,
                            child: Slider(
                                value: product.price,
                                min: 0,
                                max: 25,
                                divisions: 10,
                                activeColor: Colors.black,
                                inactiveColor: Colors.black12,
                                onChanged: (value){
                                  productController.updateProductPrice(
                                      index, product, value);
                                },
                              onChangeEnd: (value){
                                productController.saveNewProductPrice(
                                    product, 'price', value);
                              },
                                ),
                          ),
                          Text(
                            '\$${product.price.toStringAsFixed(1)}',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 30,
                            child: Text(
                              'Qty.',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 160,
                            child: Slider(
                                value: product.quantity.toDouble(),
                                min: 0,
                                max: 25,
                                divisions: 10,
                                activeColor: Colors.black,
                                inactiveColor: Colors.black12,
                                onChanged: (value){
                                  productController.updateProductQuantity(
                                      index,
                                      product,
                                      value.toInt(),);
                                },
                              onChangeEnd: (value){
                                  productController.saveNewProductQuantity(
                                      product, 'quantity', value.toInt());
                              },
                            ),
                          ),
                          Text(
                            '\$${product.quantity.toInt()}',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}


