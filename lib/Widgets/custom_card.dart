import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_try_app_flutter/Screens/update_product_screen.dart';
import 'package:store_try_app_flutter/models/product_model.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductScreen.id,
            arguments: productModel);
      },
      child: Stack(clipBehavior: Clip.none, children: [
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                blurRadius: 10,
                color: Colors.grey.withOpacity(0),
                spreadRadius: 0,
                offset: const Offset(10, 10))
          ]),
          child: Card(
            color: Colors.white,
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    productModel.title!.substring(0, 6),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        r"$" "${productModel.price.toString()}",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const Icon(
                        FontAwesomeIcons.solidHeart,
                        color: Colors.red,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
            top: -40,
            right: 20,
            child: Image.network(
              productModel.image!,
              fit: BoxFit.fill,
              height: 90,
              width: 80,
            ))
      ]),
    );
  }
}
