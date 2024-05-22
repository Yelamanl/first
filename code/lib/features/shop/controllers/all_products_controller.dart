import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cwt_ecommerce_app/data/repositories/product/product_repository.dart';
import 'package:get/get.dart';

import '../../../utils/popups/loaders.dart';
import '../models/product_model.dart';

class AllProductsController extends GetxController {
  static AllProductsController get instance => Get.find();

  final repository = ProductRepository.instance;
  final RxString selectedSortOption = 'Аты'.obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;

  Future<List<ProductModel>> fetchProductsByQuery(Query? query) async {
    try {
      if(query == null) return [];
      return await repository.fetchProductsByQuery(query);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Ой!', message: e.toString());
      return [];
    }
  }

  void assignProducts(List<ProductModel> products) {
    // Assign products to the 'products' list
    this.products.assignAll(products);
    sortProducts('Аты');
  }

  void sortProducts(String sortOption) {
    selectedSortOption.value = sortOption;

    switch (sortOption) {
      case 'Аты':
        products.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Үлкен баға':
        products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'Кіші баға':
        products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Жаңа':
        products.sort((a, b) => a.date!.compareTo(b.date!));
        break;
      case 'Жеңілдік':
        products.sort((a, b) {
          if (b.salePrice > 0) {
            return b.salePrice.compareTo(a.salePrice);
          } else if (a.salePrice > 0) {
            return -1;
          } else {
            return 1;
          }
        });
        break;
      default:
        // Default sorting option: Name
        products.sort((a, b) => a.title.compareTo(b.title));
    }
  }
}
