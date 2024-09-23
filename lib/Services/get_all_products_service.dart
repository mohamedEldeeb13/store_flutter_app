import 'package:store_try_app_flutter/helper/api.dart';
import 'package:store_try_app_flutter/models/product_model.dart';

class GetAllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data =
        await Api().get(url: "https://fakestoreapi.com/products");
    List<ProductModel> allProducts = [];
    for (var element in data) {
      allProducts.add(ProductModel.fromJson(element));
    }
    return allProducts;
  }
}
