import 'package:flutter/foundation.dart';
import 'package:myriad_bus_scheduler/core/entity/auth/login_credential.dart';
import 'package:myriad_bus_scheduler/core/entity/auth/sign_up_crendentials.dart';
import 'package:myriad_bus_scheduler/core/entity/user/user.dart';
import 'package:myriad_bus_scheduler/core/repo/auth/auth_repository.dart';
import 'package:myriad_bus_scheduler/core/repo/user/user_repository.dart';
import 'auth_usecase.dart';

class AuthUseCaseImpl implements AuthUseCase {
  final AuthRepository authRepository;
  final UserRepository userRepository;

  AuthUseCaseImpl({@required this.authRepository, @required this.userRepository});
  @override
  Future<String> forgotPassword(String email) async {
  return authRepository.forgotPassword(email);
  }

  @override
  Future<String> login(LoginCredential credential) async => await authRepository.login(credential);

  @override
  Future<String> signUp(SignUpCredential credential) async {
    var result = await authRepository.signUp(credential);
    var time = DateTime.now().toIso8601String();



    return await result.fold((errorMessage) => errorMessage, (userData) async {
      UserProfile userProfile = UserProfile(
        lastUpdated: time,
        createdAt: time,
        email: credential.email,
        id: userData.user.uid,
        fullName: credential.fullName,
      );

      return await userRepository.updateProfile(userProfile);

    });

  }

}