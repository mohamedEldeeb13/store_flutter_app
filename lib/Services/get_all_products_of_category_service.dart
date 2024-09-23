import 'package:store_try_app_flutter/helper/api.dart';
import 'package:store_try_app_flutter/models/product_model.dart';

class GetAllProductsOfCategoryService {
  Future<List<ProductModel>> getAllProductsOfCategory(
      {required String category}) async {
    List<dynamic> data = await Api()
        .get(url: "https://fakestoreapi.com/products/category/$category");
    List<ProductModel> allProducts = [];
    for (int i = 0; i <= data.length; i++) {
      allProducts.add(ProductModel.fromJson(data[i]));
    }
    return allProducts;
  }
}
