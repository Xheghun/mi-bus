import 'package:myriad_bus_scheduler/core/data/webservice/user/user_webservice.dart';
import 'package:myriad_bus_scheduler/core/entity/user/user.dart';

class UserRepository {
  final UserWebService userWebService;
  UserRepository(this.userWebService);
  Future<String> updateProfile(UserProfile user) async => await userWebService.updateProfile(user);
  }