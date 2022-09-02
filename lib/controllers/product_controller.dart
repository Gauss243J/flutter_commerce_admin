import 'package:flutter_commerce_admin/models/models.dart';
import 'package:flutter_commerce_admin/services/database_service.dart';
import 'package:get/get.dart';
class ProductController extends GetxController{
  final DataBaseService dataBase=DataBaseService();
  var products=<Product>[].obs;

  var newProduct={}.obs;

  get price=>newProduct['price'];
  get quantity=>newProduct['quantity'];
  get delais=>newProduct['delais'];
  get rating=>newProduct['rating'];
  get isRecommended=>newProduct['isRecommended'];
  get isPopular=>newProduct['isPopular'];

  @override
  void onInit() {
    products.bindStream(dataBase.getProducts());
    super.onInit();
  }


void updateProductPrice(int index, Product product, double value,) {
  product.price=value;
  products[index]=product;
}

  void saveNewProductPrice(
      Product product,
      String field,
      double value,
      ) {
  dataBase.updateField(product,field,value);
  }

void updateProductQuantity(
    int index,
    Product product,
    int value,) {
  product.quantity=value;
  products[index]=product;
}
void saveNewProductQuantity(
      Product product,
      String field,
      int value,
      ) {
    dataBase.updateField(product,field,value);
  }


  void updateProductDelais(
      int index,
      Product product,
      int value,) {
    product.delais=value;
    products[index]=product;
  }
  void saveNewProductDelais(
      Product product,
      String field,
      int value,
      ) {
    dataBase.updateField(product,field,value);
  }

    }