import 'dart:convert';
import 'package:http/http.dart' as http;
import '/models/product.dart'; // Pastikan untuk mengimpor model ProductElement

class ApiService {
  final String baseUrl = 'https://dummyjson.com/products';

  Future<List<ProductElement>> fetchProducts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      List<dynamic> jsonData = jsonResponse['products']; // Ambil daftar produk dari JSON

      return jsonData.map((json) => ProductElement.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}