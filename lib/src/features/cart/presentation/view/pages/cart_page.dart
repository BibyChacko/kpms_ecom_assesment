import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:kpms_ecom/src/core/common/widgets/app_button.dart';
import 'package:kpms_ecom/src/core/theme/text_theme.dart';
import 'package:kpms_ecom/src/features/cart/presentation/view/widgets/cart_item_view.dart';
import 'package:kpms_ecom/src/features/products/data/models/product_model.dart';

import '../../controller/cart_controller.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Find the items added to your cart",
                    style: AppTextTheme.bodyLightStyle),
                GestureDetector(
                  onTap: () {
                    cartController.clearAllItems();
                  },
                  child: Text(
                    "Clear all",
                    style: AppTextTheme.bodyStyle
                        .copyWith(decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Obx((){
            return  Visibility(
              visible: cartController.cartItems.isNotEmpty,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppButton(
                  width: MediaQuery.of(context).size.width,
                  buttonText:
                  'Proceed to checkout (${cartController.cartItems.length})',
                  onPressed: () {
                    cartController.checkOutCart(cartController.cartItems);
                  },
                ),
              ),
            );
          }
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: Obx(
              () {
                List<ProductModel> products = cartController.cartItems;
                if (products.isEmpty) {
                  return Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "No items in cart, Go to product page to add items",
                      style: AppTextTheme.heading5,
                      textAlign: TextAlign.center,
                    ),
                  ));
                }
                return StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CartItemView(productModel: products[index]);
                  },
                  staggeredTileBuilder: (int index) {
                    return const StaggeredTile.fit(1);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
