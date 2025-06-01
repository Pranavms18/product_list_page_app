import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:product_list_page_app/model/product_list_model.dart';

class ProductListScreenController with ChangeNotifier {
  List<Product> products = [];

  Future<void> getProductDetails() async {
    final url = Uri.parse("https://dummyjson.com/products");
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        print(response.body);
        ProductListResModel resModel =
            productListResModelFromJson(response.body);
        products = resModel.products ?? [];
        print("printing products${products}");
        notifyListeners();
      }
    } catch (e) {}
    notifyListeners();
  }
}
// import 'dart:convert';
// import 'package:flutter/foundation.dart';

// import 'package:http/http.dart' as http;
// import 'package:product_list_page_app/model/product_list_model.dart';

// class ProductProvider with ChangeNotifier {
//   List<Product> products = [];

//   Future<void> fetchProducts() async {
//     final String url = 'https://your.api.endpoint/products';
//     try {
//       final response = await http.get(Uri.parse(url));
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body) as Map<String, dynamic>;
//         final items = data['products'] as List<dynamic>;

//         products = items
//             .map((item) => Product.fromJson(item as Map<String, dynamic>))
//             .toList();

//         notifyListeners();
//       } else {
//         print("Faild to load data${response.statusCode}");
//       }
//     } catch (e) {
//       print('Error fetching products: $e');
//     }
//   }
// }
