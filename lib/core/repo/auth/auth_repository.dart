import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myriad_bus_scheduler/core/data/webservice/auth/auth_webservice.dart';
import 'package:myriad_bus_scheduler/core/entity/auth/login_credential.dart';
import 'package:myriad_bus_scheduler/core/entity/auth/sign_up_crendentials.dart';

class AuthRepository {
  final AuthWebService authWebService;
  AuthRepository(this.authWebService);

  Future<String> forgotPassword(String email) async => await authWebService.forgotPassword(email);

  Future<bool> isLoggedIn() async => await authWebService.isLoggedIn();

  Future<String> login(LoginCredential credential) async => await authWebService.login(credential);

  Future<Either<String, UserCredential>> signUp(SignUpCredential credential) async => await authWebService.signUp(credential);
}