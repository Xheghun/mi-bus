import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:myriad_bus_scheduler/core/entity/auth/login_credential.dart';
import 'package:myriad_bus_scheduler/core/entity/auth/sign_up_crendentials.dart';

abstract class AuthWebService {
  Future<String> login(LoginCredential credential);
  Future<Either<String, UserCredential>> signUp(SignUpCredential credential);
  Future<String> forgotPassword(String email);
  Future<bool> isLoggedIn();
}

class AuthWebServiceImpl implements AuthWebService {

  final FirebaseAuth firebaseAuth;
  final FirebaseDatabase firebaseDatabase;

  AuthWebServiceImpl({this.firebaseAuth, this.firebaseDatabase});

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
      return error.message;
    }
  }

  @override
  Future<Either<String, UserCredential>> signUp(SignUpCredential credential) async {
    try {
     return Right(await firebaseAuth.createUserWithEmailAndPassword(email: credential.email, password: credential.password));

    } on FirebaseAuthException catch(error) {
      return Left(error.message);
    }
  }

}