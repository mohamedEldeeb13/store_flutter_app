import 'package:flutter/material.dart';
import 'package:store_try_app_flutter/Screens/home_screen.dart';
import 'package:store_try_app_flutter/Screens/update_product_screen.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.id: (context) => const HomeScreen(),
        UpdateProductScreen.id: (context) => const UpdateProductScreen()
      },
      initialRoute: HomeScreen.id,
    );
  }
}
