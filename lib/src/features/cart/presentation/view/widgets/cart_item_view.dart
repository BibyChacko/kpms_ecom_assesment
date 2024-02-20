import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/common/widgets/app_image.dart';
import '../../../../products/data/models/product_model.dart';
import '../../controller/cart_controller.dart';

class CartItemView extends StatefulWidget {
  final ProductModel productModel;

  const CartItemView({super.key, required this.productModel});

  @override
  State<CartItemView> createState() => _CartItemViewState();
}

class _CartItemViewState extends State<CartItemView> {
  int _currentIndex = 0;
  int _quantity = 1;
  late Timer _timer;
  CartController cartController = Get.find<CartController>();

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
        padding: const EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 3),
              child: AppImage.network(
                width: MediaQuery.of(context).size.width,
                widget.productModel.images.elementAt(_currentIndex),
              ),
            ),
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
            Row(
              children: [
                IconButton(
                  onPressed: _decreaseQuantity,
                  icon: const Icon(Icons.remove),
                ),
                Text('$_quantity'),
                IconButton(
                  onPressed: _increaseQuantity,
                  icon: const Icon(Icons.add),
                ),
               const SizedBox(width: 4,),
                IconButton(
                  onPressed: (){
                    cartController.removeFromCart(widget.productModel);
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _increaseQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decreaseQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }
}