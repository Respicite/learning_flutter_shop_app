import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/product_item.dart';
import '../providers/product.dart';
import '../providers/products.dart';

class ProductsGridView extends StatelessWidget {
  bool showOnlyFavorites;

  ProductsGridView({this.showOnlyFavorites});

  @override
  Widget build(BuildContext context) {
    Products productsData = Provider.of<Products>(context);
    List products = [];
    if(showOnlyFavorites){
      products = productsData.favoriteItems;
    }else{
      products = productsData.items;
    }
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) =>
      // GridView builder will, when scrolling, reuse the no longer visible items
      // with new Data but the old Provider will stay attached to it which can lead
      // to some strange bugs if it isn't removed manually, in order to fix this
      // use ChangeNotifierProvider.value(value: products[i] as Product, ...)
      //
      // ALSO if screens are pushed / replaced etc flutter will not take care of
      // the provider data which will therefore stay in memory and might lead to
      // memory overflows / bad performance but value will take care of this
      // Not sure however if this is true of create as well ?!?
          ChangeNotifierProvider.value(
            value: products[i] as Product,
            child: ProductItem(),
          ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}