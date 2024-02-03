import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:session14_fakestore/widgets/product_card.dart';

import '../models/product.dart';
import 'package:http/http.dart' as http;

class SingleProductScreen extends StatefulWidget {
  const SingleProductScreen({super.key});

  @override
  State<SingleProductScreen> createState() => _SingleProductScreenState();
}

class _SingleProductScreenState extends State<SingleProductScreen> {



  Future<Product> getSingleProduct() async {
    String url = 'https://fakestoreapi.com/products/2';
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      Product product = Product.fromJson(jsonResponse);
      return product;
    } else {
      throw Exception('SWR');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product'),
      ),
      body: FutureBuilder<Product>(
        future: getSingleProduct(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('SWR'),
            );
          } else if (snapshot.hasData) {
            Product product = snapshot.data!;

            return ProductCard(product: product);
          } else {
            return const Center(
              child: SpinKitChasingDots(
                color: Colors.amber,
              ),
            );
          }
        },
      ),
    );
  }
}
