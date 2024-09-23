import 'package:store_try_app_flutter/helper/api.dart';
import 'package:store_try_app_flutter/models/product_model.dart';

class AddProductService {
  Future<ProductModel> addProduct(
      {required String title,
      required double price,
      required String description,
      required String image,
      required String category}) async {
    Map<String, dynamic> data =
        await Api().post(url: "https://fakestoreapi.com/products", body: {
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category
    });
    return ProductModel.fromJson(data);
  }
}
