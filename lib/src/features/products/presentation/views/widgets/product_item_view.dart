import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kpms_ecom/src/core/common/widgets/app_button.dart';
import 'package:kpms_ecom/src/core/common/widgets/app_image.dart';
import 'package:kpms_ecom/src/features/cart/presentation/controller/cart_controller.dart';

import '../../../data/models/product_model.dart';

class ProductItemView extends StatefulWidget {
  final ProductModel productModel;

  const ProductItemView({super.key, required this.productModel});

  @override
  State<ProductItemView> createState() => _ProductItemViewState();
}

class _ProductItemViewState extends State<ProductItemView> {
  int _currentIndex = 0;
  late Timer _timer;
  CartController cartController = Get.find<CartController>();
  bool isItemAdded = false;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % widget.productModel.images.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
                duration: const Duration(seconds: 3),
                child: AppImage.network(
                    width: MediaQuery.of(context).size.width,
                    widget.productModel.images.elementAt(_currentIndex))),
            Text(
              widget.productModel.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            // Product Price and Discount
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${widget.productModel.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                Text(
                  '${widget.productModel.discountPercentage}% off',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Add to Cart Button
            AppButton(
              onPressed: () {
                if(isItemAdded){
                  cartController.removeFromCart(widget.productModel);
                }else{
                  cartController.addToCart(widget.productModel);
                }

                setState(() {
                  isItemAdded = !isItemAdded;
                });
              },
              buttonText: isItemAdded? "Added" : 'Add',
            ),
          ],
        ),
      ),
    );
  }
}
