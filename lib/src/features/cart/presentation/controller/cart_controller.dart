import 'package:get/get.dart';
import 'package:kpms_ecom/src/core/helpers/dialog_helper.dart';
import 'package:kpms_ecom/src/features/cart/domain/repositories/cart_repository.dart';
import 'package:kpms_ecom/src/features/products/data/models/product_model.dart';

enum CartState { initial, loading, loaded, loadError }

class CartController extends GetxController implements CartRepository {
  final RxList<ProductModel> cartItems = <ProductModel>[].obs;

  @override
  void addToCart(ProductModel product) {
    cartItems.add(product);
    DialogHelper.showToast("Item added to cart");
  }

  @override
  void checkOutCart(List<ProductModel> products) {
    // Connect server to save the order
    DialogHelper.showToast("Your order has been successfully placed");
    clearAllItems();
  }

  @override
  void clearAllItems() {
    cartItems.clear();
    DialogHelper.showToast("Cart cleared successfully");
  }

  @override
  List<ProductModel> listAllItemInCart() {
    // Fetch from server and check if there anything
    return cartItems.toList();
  }

  @override
  void removeFromCart(ProductModel product) {
    cartItems.remove(product);
    DialogHelper.showToast("Item removed from cart");
  }
}
