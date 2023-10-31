import 'package:api_demo/app/controller/login_controller.dart';
import 'package:api_demo/utils/colors.dart';
import 'package:api_demo/widgets/custom_buttons.dart';
import 'package:api_demo/widgets/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Get.put(LoginController());
    return Scaffold(
      backgroundColor: Colours.scaffoldBgColor,
      body: SafeArea(
        child: SizedBox(
          height: height,
          width: width,
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                /// app icon
                SizedBox(height: height * 0.05),
                Image.asset(
                  "assets/cinemaven.png",
                  height: 70,
                ),

                /// email field
                SizedBox(height: height * 0.06),
                CustomTextField(
                  controller: controller.emailController,
                  obscureText: false,
                  hintText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  prefixIconPath: const Icon(Icons.email, color: Colors.black),
                  suffixIcon: null,
                ),

                /// password field
                SizedBox(height: height * 0.02),
                CustomTextField(
                  controller: controller.passwordController,
                  obscureText: true,
                  hintText: 'Password',
                  keyboardType: TextInputType.text,
                  prefixIconPath: const Icon(Icons.lock, color: Colors.black),
                  suffixIcon: null,
                ),

                /// Login button
                SizedBox(height: height * 0.05),
                CustomButton(
                  onTap: () {},
                  btnText: '',
                  btnColor: Colors.white,
                  btnDataRow: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 8.0),
                      Text(
                        'Login',
                        style: GoogleFonts.poppins(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),

                /// forgot password Button
                SizedBox(height: height * 0.01),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password?',
                    style: GoogleFonts.poppins(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.01),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Don\'t have an account?',
                        style: GoogleFonts.poppins(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      const WidgetSpan(child: SizedBox(width: 10.0)),
                      TextSpan(
                        text: 'SIGN UP',
                        style: GoogleFonts.poppins(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
