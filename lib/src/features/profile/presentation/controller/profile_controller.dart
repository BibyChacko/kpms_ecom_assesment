

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

enum ProfileState {initial,loading,loaded,error}
class ProfileController extends GetxController{

  var profileState = ProfileState.initial.obs;
  User? userDetails;
  getUserDetails(){
    profileState.value = ProfileState.loading;
    userDetails = FirebaseAuth.instance.currentUser;
    profileState.value = ProfileState.loaded;
  }
}