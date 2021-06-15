import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get_it/get_it.dart';
import 'package:myriad_bus_scheduler/core/data/webservice/auth/auth_webservice.dart';
import 'package:myriad_bus_scheduler/core/data/webservice/user/user_webservice.dart';
import 'package:myriad_bus_scheduler/core/repo/auth/auth_repository.dart';
import 'package:myriad_bus_scheduler/core/repo/user/user_repository.dart';
import 'package:myriad_bus_scheduler/core/usecase/auth/auth_usecase.dart';
import 'package:myriad_bus_scheduler/core/usecase/auth/auth_usecase_impl.dart';
import 'package:myriad_bus_scheduler/ui/screens/auth/login/login_viewmodel.dart';
import 'package:myriad_bus_scheduler/ui/screens/auth/sign_up/signup_viewmodel.dart';

var locator = GetIt.instance;

void setUpDependencies() {
  locator
    //use cases
    ..registerLazySingleton<AuthUseCase>(() =>
        AuthUseCaseImpl(authRepository: locator(), userRepository: locator()))

    //repository
    ..registerLazySingleton(() => AuthRepository(locator()))
    ..registerLazySingleton(() => UserRepository(locator()))

    //webservice
    ..registerLazySingleton<AuthWebService>(
        () => AuthWebServiceImpl(firebaseAuth: locator()))
    ..registerLazySingleton<UserWebService>(
        () => UserWebServiceImpl(firebaseDatabase: locator()))

    //external
    ..registerLazySingleton(() => FirebaseAuth.instance)
    ..registerLazySingleton(() => FirebaseDatabase.instance)

    //view model
    ..registerFactory(() => LoginViewModel(locator()))
    ..registerFactory(() => SignUpViewModel(locator()));
}
