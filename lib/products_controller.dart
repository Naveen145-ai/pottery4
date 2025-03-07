import 'package:get/get.dart';
import 'lacaleString.dart';

class ProductsController extends GetxController {
  // List of products that can be modified by sellers
  RxList<String> productList = ['Clay Pot'.tr, 'Flower Pot'.tr, 'Color Pot'.tr, 'Earthen Pot'.tr,'water pot'.tr,'Teracotta Pot'.tr,'Herb Pot'.tr,
    'Glazed Pot'.tr,
    'Cactus Pot'.tr,
    'Decorative Pot'.tr,
    'Succulent Pot'.tr,
    'Vintage Pot'.tr].obs;

  // Method to add a product
  void addProduct(String product) {
    productList.add(product);
  }

  // Method to remove a product
  void removeProduct(String product) {
    productList.remove(product);
  }

  // Method to update a product
  void updateProduct(int index, String newProductName) {
    productList[index] = newProductName;
  }
}
