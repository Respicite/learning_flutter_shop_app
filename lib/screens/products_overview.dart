import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

import '../widgets/products_grid_view.dart';

enum FilterOptions {
  Favorites,
  All
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var showOnlyFavorites = false;

  void toggleShowFavoritesOnly(x){
    setState(() {
      showOnlyFavorites = x;
    });
  }

  @override
  Widget build(BuildContext context) {
    // listen false because we don't need to update anything here if the data
    // changes we only want to trigger the change from here
    // Products products = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (_ctx) => [
              PopupMenuItem(
                child: Text('Favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('All'),
                value: FilterOptions.All,
              )
            ],
            onSelected: (FilterOptions selectedFilter) {
              if(selectedFilter == FilterOptions.Favorites){
                toggleShowFavoritesOnly(true);
              }else{
                toggleShowFavoritesOnly(false);
              }
            },
          ),
        ],
      ),
      body: ProductsGridView(showOnlyFavorites: showOnlyFavorites),
    );
  }
}
