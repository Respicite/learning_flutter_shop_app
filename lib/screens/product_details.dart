import 'package:flutter/material.dart';
import 'package:flutter_tutotrial_shop_app/providers/products.dart';

import 'package:provider/provider.dart';

import '../providers/product.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String productId;

  const ProductDetailsScreen({this.productId});

  @override
  Widget build(BuildContext context) {
    // if listen is set to false changes of Products will not trigger rebuild
    // listen = true is the default
    Product product = Provider.of<Products>(context, listen: false).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
    );
  }
}
