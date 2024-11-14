import 'package:e_commerce/base/model/product_model.dart';

class Cart {
  final ProductModel product;
  int numOfItem;

  Cart({required this.product,
    this.numOfItem = 0
  });
}