import 'package:flutter/foundation.dart';

class Product with ChangeNotifier{
  final String title;
  final String id;
  final String description;
  final String imageUrl;
  final double price;
  bool isFavorite;

  Product({
    @required this.title,
    @required this.id,
    @required this.description,
    @required this.imageUrl,
    @required this.price,
    this.isFavorite = false //default value if none is given
  });

  String getPriceString() {
    return "${price.toStringAsFixed(2)}€";
  }

  void toggleFavorite(){
    isFavorite = !isFavorite;
    notifyListeners();
  }

}