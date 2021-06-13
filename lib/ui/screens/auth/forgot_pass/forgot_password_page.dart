import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myriad_bus_scheduler/ui/widget/buttons/primary_button.dart';
import 'package:myriad_bus_scheduler/ui/widget/layout/base_widget.dart';
import 'package:myriad_bus_scheduler/ui/widget/text/mi_bus_logo.dart';
import 'package:myriad_bus_scheduler/ui/widget/text/mi_textfield.dart';
import 'package:myriad_bus_scheduler/util/styles/colors.dart';


class ForgotPasswordPage extends StatelessWidget {

  static const String routeName = "/forgotPassword";

  const ForgotPasswordPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
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
              "Forgot Password",
              style:
              GoogleFonts.roboto(fontWeight: FontWeight.w700, fontSize: 28),
            ),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: colorPrimary, width: 2.5))),
          ),
          MiTextField(
            hint: "E-MAIL",
            textAlign: TextAlign.center,
          ),

        Container(
          margin: EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.15),
          width: double.infinity,
          child: PrimaryButton(showIcon: false,onTap: () => Navigator.pop(context),),
          ),
          Expanded(flex: 10, child: SizedBox()),
        ],
      ),
    );
  }
}
