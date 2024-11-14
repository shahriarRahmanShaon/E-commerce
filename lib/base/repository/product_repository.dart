import 'package:e_commerce/base/model/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> fetchProducts();
}
