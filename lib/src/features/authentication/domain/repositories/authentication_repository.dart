
import '../../data/models/sign_up_request_model.dart';

abstract class AuthenticationRepository {
  login(String username,String password);
  signup(SignUpRequestModel signUpRequestModel);
  logout();
}