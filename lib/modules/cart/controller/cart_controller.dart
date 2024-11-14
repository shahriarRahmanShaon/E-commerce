import 'package:get/get.dart';
import '../../../base/model/product_model.dart';
import '../model/cart.dart';


class CartController extends GetxController {
  RxList<Cart> cart = <Cart>[].obs;

  void numOfItemsAtCart() {
    print(cart.length);
    for (var product in cart) {
      print(product.product.title);
      print(product.numOfItem);
    }
  }

  void addToCart(ProductModel product) {
    var existingCartItem = cart.firstWhereOrNull((item) => item.product.id == product.id);
    if (existingCartItem != null) {
      existingCartItem.numOfItem++;
      cart.refresh();
    } else {
      cart.add(Cart(product: product, numOfItem: 1));
    }
  }

  double get totalPriceSummary {
    double total = cart.fold(0, (sum, item) => sum + item.product.price * item.numOfItem);
    print(total);
    return total;
  }
}
