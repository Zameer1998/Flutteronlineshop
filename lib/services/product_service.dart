import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:onlineshop/models/product_model.dart';

class ProductService {
  final String allProductsUrl = 'https://api.npoint.io/a907f54f4d95e9e31711';
  final String productDetailsUrl = 'https://api.npoint.io/7fe4c3d8d85298ece626';

  Future<List<Product>> fetchAllProducts() async {
    final response = await http.get(Uri.parse(allProductsUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<Product> fetchProductDetails(String productId) async {
    final response = await http.get(Uri.parse(productDetailsUrl));
    if (response.statusCode == 200) {
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load product details');
    }
  }
}
