import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myriad_bus_scheduler/app/locator.dart';
import 'package:myriad_bus_scheduler/ui/screens/auth/sign_up/signup_viewmodel.dart';
import 'package:myriad_bus_scheduler/ui/screens/home/home_screen.dart';
import 'package:myriad_bus_scheduler/ui/widget/buttons/primary_button.dart';
import 'package:myriad_bus_scheduler/ui/widget/layout/base_widget.dart';
import 'package:myriad_bus_scheduler/ui/widget/loading_widget.dart';
import 'package:myriad_bus_scheduler/ui/widget/text/mi_bus_logo.dart';
import 'package:myriad_bus_scheduler/ui/widget/text/mi_textfield.dart';
import 'package:myriad_bus_scheduler/util/styles/colors.dart';
import 'package:myriad_bus_scheduler/util/styles/style.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  static const routeName = "/signUp";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignUpViewModel(locator()),
      child: Consumer<SignUpViewModel>(
        builder: (context, model, child) {
          return Stack(
            children: [
              BaseWidget(
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MiBusLogo(),
                    Expanded(child: SizedBox()),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 12),
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w700, fontSize: 28),
                      ),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: colorPrimary, width: 2.5))),
                    ),
                    MiTextField(
                      hint: "FULL NAME",
                      controller: model.fullNameController,
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
                    Container(
                        child: Row(
                      children: [
                        Expanded(child: SizedBox()),
                        PrimaryButton(
                          onTap: () => model.signUp(context),
                        ),
                      ],
                    )),
                    Expanded(flex: 10, child: SizedBox()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?"),
                        SizedBox(
                          width: 4,
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(
                            context,
                          ),
                          child: Text(
                            "Sign In",
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
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
