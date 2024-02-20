import 'package:get/get.dart';
import '../../../../core/helpers/dialog_helper.dart';
import '../../data/models/product_model.dart';
import '../../data/repository/product_repository_impl.dart';
import '../../domain/repositories/product_repository.dart';

enum ProductsState { initial, loading, loaded, error }

class ProductsController extends GetxController implements ProductRepository {
  final ProductRepositoryImpl _repository = ProductRepositoryImpl();

  var productState = ProductsState.initial.obs;
  RxList<ProductModel> productList = <ProductModel>[].obs;

  @override
  loadProducts() async {
    productState.value = ProductsState.loading;
    var result = await _repository.loadProducts();
    result.fold((failure) => _handleProductLoadFailure(failure),
        (productList) => _handleProductLoadSuccess(productList));
  }

  _handleProductLoadFailure(Exception failure) {
    productState.value = ProductsState.loading;
    DialogHelper.showToast("Error loading products");
  }

  _handleProductLoadSuccess(List<ProductModel> newProductList) {
    productState.value = ProductsState.loaded;
    productList.addAll(newProductList);
  }
}
