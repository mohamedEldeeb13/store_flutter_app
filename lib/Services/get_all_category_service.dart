import 'package:store_try_app_flutter/helper/api.dart';

class GetAllCategoryService {
  Future<List<dynamic>> getAllCategory() async {
    List<dynamic> data =
        await Api().get(url: "https://fakestoreapi.com/products/categories");
    return data;
  }
}
