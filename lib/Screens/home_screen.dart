import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_try_app_flutter/Services/get_all_products_service.dart';
import 'package:store_try_app_flutter/Widgets/custom_card.dart';
import 'package:store_try_app_flutter/models/product_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String id = "home page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "New Trend",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.cartPlus,
                color: Colors.black,
              ))
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        shadowColor: Colors.grey,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
        child: FutureBuilder<List<ProductModel>>(
          future: GetAllProductsService().getAllProducts(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              List<ProductModel> products = snapshot.data!;
              return GridView.builder(
                  itemCount: products.length,
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 60),
                  itemBuilder: (context, index) {
                    return CustomCard(
                      productModel: products[index],
                    );
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
