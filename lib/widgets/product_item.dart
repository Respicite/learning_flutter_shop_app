import 'package:flutter/material.dart';
import 'package:flutter_tutotrial_shop_app/screens/product_details.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // there is also a way other than this
    //Product product = Provider.of<Product>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      // And it is with this Consumer widget, generally they behave th same but
      // with Provider the whole build method will rerun if anything changes and
      // with Consumer only the subtree part wrapped by Consumer will rerun
      // (You can archive the same with Providers and clever widget splitting too,
      // but sometimes, only a small part changes, it is more convenient this way
      // -> In this case we could wrap only the IconButton with Consumer which
      // would make it slightly more efficient, use Provider with listen: false
      // for the static data of product)
      //
      // Child can be used as a static child of the Consumer part which will
      // also not be rebuild if the data is changed
      child: Consumer<Product>(
        builder: (ctx, product, child) => GridTile(
            child: GestureDetector(
              child: Image.network(product.imageUrl, fit: BoxFit.cover,),
              onTap: () { Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => ProductDetailsScreen(productId: product.id))); },
            ),
            footer: GridTileBar(
                title: Text(product.title, textAlign: TextAlign.center,),
                backgroundColor: Colors.black54,
                leading: IconButton(
                    icon: Icon(Icons.save),
                    onPressed: () => product.toggleFavorite(),
                    color: product.isFavorite
                        ? Theme.of(context).primaryColorDark : Theme.of(context).primaryColorLight
                ),
                trailing: IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {},
                    color: Theme.of(context).primaryColorLight
                )
            )
        )
      ),
    );
  }
}
