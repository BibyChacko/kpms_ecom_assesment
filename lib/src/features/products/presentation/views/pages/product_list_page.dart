import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/load_error_widget.dart';
import '../../../data/models/product_model.dart';
import '../../controller/products_controller.dart';
import '../widgets/product_item_view.dart';

class ProductListPage extends StatelessWidget {
  ProductListPage({super.key});
  final productsController = Get.find<ProductsController>()..loadProducts();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(() {
        switch (productsController.productState.value) {
          case ProductsState.initial:
            return const SizedBox();
          case ProductsState.loading:
            return const AppLoader(
              type: LoaderType.list,
            );
          case ProductsState.loaded:
            List<ProductModel> products = productsController.productList;
            return StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                return ProductItemView(productModel: products[index]);
              },
              staggeredTileBuilder: (int index) {
                return const StaggeredTile.fit(1);
              },
            );
          case ProductsState.error:
            return LoadErrorWidget(
                title: "Oops! Error",
                body: "Something went wrong loading the products",
                onRetryPressed: () {
                  productsController.loadProducts();
                });
        }
      }),
    );
  }
}
