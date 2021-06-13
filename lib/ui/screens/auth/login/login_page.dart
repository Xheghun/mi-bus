import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myriad_bus_scheduler/app/routes.dart';
import 'package:myriad_bus_scheduler/ui/screens/auth/forgot_pass/forgot_password_page.dart';
import 'package:myriad_bus_scheduler/ui/screens/home/home_screen.dart';
import 'package:myriad_bus_scheduler/ui/widget/buttons/primary_button.dart';
import 'package:myriad_bus_scheduler/ui/widget/layout/base_widget.dart';
import 'package:myriad_bus_scheduler/ui/widget/text/mi_bus_logo.dart';
import 'package:myriad_bus_scheduler/ui/widget/text/mi_textfield.dart';
import 'package:myriad_bus_scheduler/util/styles/colors.dart';
import 'package:myriad_bus_scheduler/util/styles/style.dart';

class LoginPage extends StatelessWidget {
  static const routeName = "/login";

  @override
  Widget build(BuildContext context) {


    return BaseWidget(
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
              style:
                  GoogleFonts.roboto(fontWeight: FontWeight.w700, fontSize: 28),
            ),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: colorPrimary, width: 2.5))),
          ),
          MiTextField(
            hint: "E-MAIL",
          ),
          MiTextField(
            hint: "PASSWORD",
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
                onPressed: () => Navigator.pushNamed(context, ForgotPasswordPage.routeName),
              ),
            ),
          ),
          Container(
              child: Row(
            children: [
              Expanded(child: SizedBox()),
              PrimaryButton(onTap: () => Navigator.pushNamed(context, HomeScreen.routeName),),
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
                onPressed: () => Navigator.pushNamed(context, SignUpPage.routeName),
                child: Text(
                  "Sign Up",
                  style: textFieldStyle.copyWith(color: colorPrimary),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
