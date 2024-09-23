import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_try_app_flutter/Services/update_product_service.dart';
import 'package:store_try_app_flutter/Widgets/custom_text_form_field.dart';
import 'package:store_try_app_flutter/models/product_model.dart';

// ignore: must_be_immutable
class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key});

  static String id = 'update page';

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? title, description, image;
  bool isLoading = false;
  String? price;

  @override
  Widget build(BuildContext context) {
    ProductModel productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Update Product",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextFormField(
                  hintTitle: "Product Name",
                  onChanged: (value) {
                    title = value;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  hintTitle: "description",
                  onChanged: (value) {
                    description = value;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  hintTitle: "Price",
                  onChanged: (value) {
                    price = value;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  hintTitle: "images",
                  onChanged: (value) {
                    image = value;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.blue)),
                    onPressed: () async {
                      isLoading = true;
                      setState(() {});
                      await updateProduct(productModel);
                      // try {
                      //   print("success");
                      // } catch (e) {
                      //   print(e.toString());
                      // }

                      isLoading = false;
                      setState(() {});
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Center(
                        child: Text(
                          "Update",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel productModel) async {
    await UpdateProductService().updateProduct(
        id: productModel.id,
        title: title == null ? productModel.title! : title!,
        price: price == null ? productModel.price.toString() : price!,
        description:
            description == null ? productModel.description! : description!,
        image: image == null ? productModel.image! : image!,
        category: productModel.categoryName!);
  }
}
