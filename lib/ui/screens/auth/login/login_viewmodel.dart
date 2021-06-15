import 'package:flutter/cupertino.dart';
import 'package:myriad_bus_scheduler/app/viewmodel/base_viewmodel.dart';
import 'package:myriad_bus_scheduler/core/entity/auth/login_credential.dart';
import 'package:myriad_bus_scheduler/core/enum/view_state.dart';
import 'package:myriad_bus_scheduler/core/usecase/auth/auth_usecase.dart';
import 'package:myriad_bus_scheduler/ui/screens/home/home_screen.dart';
import 'package:myriad_bus_scheduler/util/widget/misc.dart';
import 'package:string_validator/string_validator.dart';

class LoginViewModel extends BaseViewModel {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  final AuthUseCase authUseCase;

  LoginViewModel(this.authUseCase);

  String _validationError() {
    String email = emailController.text;
    String password = passwordController.text;
    if(email.isEmpty) {
      return "email cannot be blank";
    }else if(!isEmail(email)) {
      return "please provide a valid email";
    }
    else if (password.isEmpty) {
      return "password can't be blank";
    }
    return "";
  }

void login(BuildContext context) async {
    if(_validationError().isEmpty) {
      changeState(ViewState.BUSY);
      LoginCredential credential = LoginCredential(email: emailController.text, password: passwordController.text);
      var result = await authUseCase.login(credential);
      changeState(ViewState.IDLE);
      if(result.isEmpty) {
        Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);
      } else {
        showFlushBar(context, title: "Login Error", message: result);
      }
    } else {
      showFlushBar(context, title: "Validation Error", message: _validationError());
    }



}

}