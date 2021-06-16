import 'package:myriad_bus_scheduler/core/entity/auth/login_credential.dart';
import 'package:myriad_bus_scheduler/core/entity/auth/sign_up_crendentials.dart';

abstract class AuthUseCase {
  Future<String> login(LoginCredential credential);
  Future<String> signUp(SignUpCredential credential);
  Future<String> forgotPassword(String email);
  Future<bool> hasUser();
}