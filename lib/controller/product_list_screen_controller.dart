import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:product_list_page_app/model/product_list_model.dart';

class ProductListScreenController with ChangeNotifier {
  List<Product> products = [];

  Future<void> getProductDetails() async {
    final url = Uri.parse(" https://dummyjson.com/products");
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        print(response.body);
        ProductListResModel resModel =
            productListResModelFromJson(response.body);
        products = resModel.products ?? [];
        print(products);
        notifyListeners();
      }
    } catch (e) {}
    notifyListeners();
  }
}
