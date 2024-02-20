import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repositories/authentication_repository.dart';
import '../models/sign_up_request_model.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  @override
  Future<Either<Exception, UserCredential>> login(
      String username, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: username, password: password);
      return Right(userCredential);
    } catch (ex) {
      return Left(ex as Exception);
    }
  }

  @override
  Future<Either<Exception, bool>> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      return const Right(true);
    } catch (ex) {
      return Left(ex as Exception);
    }
  }

  @override
  Future<Either<Exception, UserCredential>> signup(
      SignUpRequestModel signUpRequestModel) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: signUpRequestModel.email,
              password: signUpRequestModel.password);
      return Right(userCredential);
    } catch (ex) {
      return Left(ex as Exception);
    }
  }
}
