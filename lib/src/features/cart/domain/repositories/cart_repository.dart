

import 'package:kpms_ecom/src/features/products/data/models/product_model.dart';

abstract class CartRepository{
  listAllItemInCart();
  addToCart(ProductModel product);
  removeFromCart(ProductModel product);
  checkOutCart(List<ProductModel> products);
  clearAllItems();
}