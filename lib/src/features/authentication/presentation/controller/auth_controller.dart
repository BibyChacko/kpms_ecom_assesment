import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:kpms_ecom/src/dashboard_page.dart';
import '../../../../core/helpers/dialog_helper.dart';
import '../../../products/presentation/views/pages/product_list_page.dart';
import '../../data/models/sign_up_request_model.dart';
import '../../data/repository/authentication_repository_impl.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../view/pages/login_page.dart';

enum AuthenticationState {
  initial,
  loading,
  success,
  error,
}

class AuthController extends GetxController
    implements AuthenticationRepository {
  final AuthenticationRepositoryImpl authRepository =
      Get.put(AuthenticationRepositoryImpl());

  var authStatus = AuthenticationState.initial.obs;

  @override
  signup(SignUpRequestModel signUpRequestModel) async {
    authStatus.value = AuthenticationState.loading;
    final result = await authRepository.signup(signUpRequestModel);
    result.fold((failure) => _handleAuthFailure(failure),
        (userCredentials) => _handleAuthSuccess());
  }

  @override
  login(String username, String password) async {
    authStatus.value = AuthenticationState.loading;
    final result = await authRepository.login(username, password);
    result.fold((failure) => _handleAuthFailure(failure),
        (userCredentials) => _handleAuthSuccess());
  }

  @override
  logout() async {
    authStatus.value = AuthenticationState.loading;
    final result = await authRepository.logout();
    result.fold((exception) => _handleLogOutFailure(exception),
        (status) => status ? _handleLogOutSuccess() : _handleLogOutFailure());
  }

  checkAutoLogin() {
    try {
      authStatus.value = AuthenticationState.loading;
      DialogHelper.showToast("Checking auto-login");
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        _handleAuthSuccess();
      } else {
        authStatus.value = AuthenticationState.initial;
      }
    } catch (error) {
      authStatus.value = AuthenticationState.initial;
    }
  }

  _handleAuthFailure(Exception failure) async {
    authStatus.value = AuthenticationState.error;
    // Extract the type of error and show the error login
    String errorMessage = failure.toString();
    if (failure is FirebaseAuthException) {
      errorMessage = failure.message ?? "Unknown error occurred";
    }
    Get.snackbar("Auth Error", errorMessage,
        snackPosition: SnackPosition.BOTTOM);
    await Future.delayed(const Duration(seconds: 2));
    authStatus.value = AuthenticationState.initial;
  }

  _handleAuthSuccess() {
    authStatus.value = AuthenticationState.success;
    _listenForTokenExpiry();
    Get.to(const DashboardPage());
  }

  void _listenForTokenExpiry() {
    FirebaseAuth.instance.currentUser?.getIdTokenResult().then((value) {
      DateTime expireOn =
          value.expirationTime ?? DateTime.now().add(const Duration(hours: 1));
      Timer(expireOn.difference(DateTime.now()), () {
        DialogHelper.showToast("Your session has expired");
        _handleLogOutSuccess();
      });
    });
  }

  _handleLogOutFailure([Exception? exception]) {
    String errorMessage = exception?.toString() ?? "Unknown error occurred";
    Get.snackbar("Logout Error", errorMessage,
        snackPosition: SnackPosition.BOTTOM);
  }

  _handleLogOutSuccess() {
    authStatus.value = AuthenticationState.initial;
    Get.to(const LoginPage());
  }
}
