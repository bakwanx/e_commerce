import 'dart:convert';
import 'package:e_commerce/services/headers.dart';
import 'package:http/http.dart' as http;
import '../models/cart_model.dart';
import '../utils/api_path.dart';

class TransactionService {

  Future<bool> checkout(
      String token, List<CartModel> carts, double totalPrice) async {
      var body = jsonEncode(
        {
          'address': 'Marsemoon',
          'items': carts
              .map(
                  (cart) => {
                    'id': cart.product!.id,
                    'quantity': cart.quantity,
                  },
              )
              .toList(),
          'status': "PENDING",
          'total_price': totalPrice,
          'shipping_price': 0,
        },
      );

      var response = await http.post(
        uriCheckout(),
        headers: headersToken(token),
        body: body,
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Gagal Melakukan Checkout!');
      }
  }
}
