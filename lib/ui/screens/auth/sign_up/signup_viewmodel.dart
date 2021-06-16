import 'package:flutter/material.dart';
import 'package:myriad_bus_scheduler/app/viewmodel/base_viewmodel.dart';
import 'package:myriad_bus_scheduler/core/entity/auth/sign_up_crendentials.dart';
import 'package:myriad_bus_scheduler/core/enum/view_state.dart';
import 'package:myriad_bus_scheduler/core/usecase/auth/auth_usecase.dart';
import 'package:myriad_bus_scheduler/ui/screens/home/home_screen.dart';
import 'package:myriad_bus_scheduler/util/widget/misc.dart';
import 'package:string_validator/string_validator.dart';

class SignUpViewModel extends BaseViewModel {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var fullNameController = TextEditingController();

  final AuthUseCase authUseCase;

  SignUpViewModel(this.authUseCase);

  String _validationError() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String name = fullNameController.text.trim();

    if (email.isEmpty) {
      return "email cannot be blank";
    } else if (!isEmail(email)) {
      return "please provide a valid email";
    } else if (name.isEmpty) {
      return "name is required";
    } else if (password.isEmpty) {
      return "password can't be blank";
    }
    return "";
  }

  void signUp(BuildContext context) async {
    if (_validationError().isEmpty) {
      changeState(ViewState.BUSY);

      SignUpCredential credential = SignUpCredential(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
          fullName: fullNameController.text.trim());
      var result = await authUseCase.signUp(credential);
      changeState(ViewState.IDLE);

      if (result.isEmpty) {
        Navigator.pushNamedAndRemoveUntil(
            context, HomeScreen.routeName, (r) => false);
      } else {
        showFlushBar(context, title: "Sign Up Error", message: result);
      }
    } else {
      showFlushBar(context,
          title: "Validation Error", message: _validationError());
    }
  }
}
