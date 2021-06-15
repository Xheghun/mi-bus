import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:myriad_bus_scheduler/core/entity/auth/login_credential.dart';
import 'package:myriad_bus_scheduler/core/entity/auth/sign_up_crendentials.dart';
import 'package:myriad_bus_scheduler/core/error/firebase_error_codes.dart';

abstract class AuthWebService {
  Future<String> login(LoginCredential credential);
  Future<Either<String, UserCredential>> signUp(SignUpCredential credential);
  Future<String> forgotPassword(String email);
  Future<bool> isLoggedIn();
}

class AuthWebServiceImpl implements AuthWebService {

  final FirebaseAuth firebaseAuth;

  AuthWebServiceImpl({@required this.firebaseAuth});

  @override
  Future<String> forgotPassword(String email) async {
   try {
     await firebaseAuth.sendPasswordResetEmail(email: email);
     return "";
   } on FirebaseAuthException catch(error) {
     return error.message;
   }
  }

  @override
  Future<bool> isLoggedIn() => Future.value(firebaseAuth.currentUser != null);

  @override
  Future<String> login(LoginCredential credential) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(email: credential.email, password: credential.password);
      return "";
    } on FirebaseAuthException catch(error) {

      switch(error.code) {
        case INVALID_EMAIL:
          return "this email is invalid";
        case USER_NOT_FOUND:
          return "account doesn't exists";
        case WRONG_PASSWORD:
          return "username or password is incorrect";
        default:
          return "server error";
      }
    }
  }

  @override
  Future<Either<String, UserCredential>> signUp(SignUpCredential credential) async {
    try {
     return Right(await firebaseAuth.createUserWithEmailAndPassword(email: credential.email, password: credential.password));

    } on FirebaseAuthException catch(error) {
      String message = "server error";
      switch(error.code) {
        case EMAIL_IN_USE:
          message = "this email is in use";
          break;
        case WEAK_PASSWORD:
          message = "password is too weak";
          break;
        case INVALID_EMAIL:
          message = "email is invalid";
          break;
      }
      return Left(message);
    }
  }

}