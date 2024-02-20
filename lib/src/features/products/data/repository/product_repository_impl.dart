import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../../core/helpers/network_helper.dart';
import '../../domain/repositories/product_repository.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final NetworkHelper _networkHelper = Get.find<NetworkHelper>();

  @override
  Future<Either<Exception, List<ProductModel>>> loadProducts() async {
    try {
      var result = await _networkHelper.sendGetRequest(route: "products");
      List<ProductModel> products = result["products"]
          .map<ProductModel>((product) => ProductModel.fromJson(product))
          .toList();
      return Right(products);
    } catch (ex) {
      return Left(ex as Exception);
    }
  }
}
