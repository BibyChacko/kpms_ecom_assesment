import 'package:get/get.dart';
import 'package:kpms_ecom/src/features/cart/presentation/controller/cart_controller.dart';

import '../../features/authentication/presentation/controller/auth_controller.dart';
import '../../features/products/presentation/controller/products_controller.dart';
import '../helpers/network_helper.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => ProductsController());
    Get.lazyPut(() => CartController());
    Get.put<NetworkHelper>(NetworkHelper(), permanent: true);
  }
}
