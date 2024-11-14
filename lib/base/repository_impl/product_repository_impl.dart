import 'package:e_commerce/base/model/product_model.dart';
import 'package:e_commerce/base/repository/product_repository.dart';

import '../Remote/remote_service.dart';

class RemoteRepositoryImpl implements ProductRepository {
  final RemoteService _remoteService = RemoteService();

  RemoteRepositoryImpl() {
    _remoteService.init();
  }

  @override
  Future<List<ProductModel>> fetchProducts() async {
    try {
      final response = await _remoteService.dio.get('/products');
      return (response.data as List)
          .map((json) => ProductModel.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to load products');
    }
  }
}
