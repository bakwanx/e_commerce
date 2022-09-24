import 'dart:convert';
import 'package:e_commerce/services/headers.dart';
import 'package:e_commerce/utils/api_path.dart';
import 'package:http/http.dart' as http;

import '../models/product_model.dart';


class ProductService {
  String baseUrl = 'https://shamo-backend.buildwithangga.id/api';

  Future<List<ProductModel>> getProducts() async {

    var response = await http.get(uriProducts(), headers: headers());

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<ProductModel> products = [];

      for (var item in data) {
        products.add(ProductModel.fromJson(item));
      }

      return products;
    } else {
      throw Exception('Gagal Get Products!');
    }
  }
}
