import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/product.dart';

class ProductLoader {
  static Future<List<Product>> loadProducts() async {
    final data =
    await rootBundle.loadString('assets/data/products.json');
    final List jsonResult = json.decode(data);
    return jsonResult.map((e) => Product.fromJson(e)).toList();
  }
}
