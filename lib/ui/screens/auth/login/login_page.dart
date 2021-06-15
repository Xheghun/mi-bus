import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:myriad_bus_scheduler/app/locator.dart';
import 'package:myriad_bus_scheduler/app/routes.dart';
import 'package:myriad_bus_scheduler/ui/screens/auth/forgot_pass/forgot_password_page.dart';
import 'package:myriad_bus_scheduler/ui/screens/auth/login/login_viewmodel.dart';
import 'package:myriad_bus_scheduler/ui/screens/home/home_screen.dart';
import 'package:myriad_bus_scheduler/ui/widget/buttons/primary_button.dart';
import 'package:myriad_bus_scheduler/ui/widget/layout/base_widget.dart';
import 'package:myriad_bus_scheduler/ui/widget/loading_widget.dart';
import 'package:myriad_bus_scheduler/ui/widget/text/mi_bus_logo.dart';
import 'package:myriad_bus_scheduler/ui/widget/text/mi_textfield.dart';
import 'package:myriad_bus_scheduler/util/styles/colors.dart';
import 'package:myriad_bus_scheduler/util/styles/style.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  static const routeName = "/login";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(locator()),
      child: Consumer<LoginViewModel>(
        builder: (context, model, child) {
          return Stack(
            children: [
              BaseWidget(
                resizeToAvoidBottomInsets: false,
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MiBusLogo(),
                    Expanded(child: SizedBox()),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 12),
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        "Login",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w700, fontSize: 28),
                      ),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: colorPrimary, width: 2.5))),
                    ),
                    MiTextField(
                      hint: "E-MAIL",
                      controller: model.emailController,
                    ),
                    MiTextField(
                      hint: "PASSWORD",
                      controller: model.passwordController,
                      obscureText: true,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          child: Text(
                            "FORGOT PASSWORD?",
                            style: textFieldStyle.copyWith(color: Colors.black),
                          ),
                          onPressed: () => Navigator.pushNamed(
                              context, ForgotPasswordPage.routeName),
                        ),
                      ),
                    ),
                    Container(
                        child: Row(
                      children: [
                        Expanded(child: SizedBox()),
                        PrimaryButton(
                          onTap: () => model.login(context),
                        ),
                      ],
                    )),
                    Expanded(flex: 10, child: SizedBox()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?"),
                        SizedBox(
                          width: 4,
                        ),
                        TextButton(
                          onPressed: () => Navigator.pushNamed(
                              context, SignUpPage.routeName),
                          child: Text(
                            "Sign Up",
                            style: textFieldStyle.copyWith(color: colorPrimary),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Visibility(
                  visible: model.isBusy(),
                  child: Loading(
                    message: "Please wait.....",
                  ))
            ],
          );
        },
      ),
    );
  }
}
