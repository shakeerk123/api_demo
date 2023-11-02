import 'package:api_demo/app/controller/signup_controller.dart';
import 'package:api_demo/utils/colors.dart';
import 'package:api_demo/widgets/custom_buttons.dart';
import 'package:api_demo/widgets/custom_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends GetView<SignupController> {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Get.put(SignupController());
    return Scaffold(
      backgroundColor: Colours.scaffoldBgColor,
      body: SafeArea(
        child: SizedBox(
          height: height,
          width: width,
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                /// app icon
                SizedBox(height: height * 0.05),
                Image.asset(
                  "assets/cinemaven.png",
                  height: 70,
                ),

                /// Don't Have an Account text
                SizedBox(height: height * 0.05),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Already have account?',
                        style: GoogleFonts.poppins(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      const WidgetSpan(child: SizedBox(width: 10.0)),
                      TextSpan(
                          text: 'SIGN IN',
                          style: GoogleFonts.poppins(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = ()  {
                            
                          }),
                    ],
                  ),
                ),

                /// full name field
                SizedBox(height: height * 0.06),
                CustomTextField(
                  controller: controller.nameController,
                  obscureText: false,
                  hintText: 'Full Name',
                  keyboardType: TextInputType.name,
                  prefixIconPath: const Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  suffixIcon: null,
                ),

                SizedBox(height: height * 0.02),
                CustomTextField(
                  controller: controller.emailController,
                  obscureText: false,
                  hintText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  prefixIconPath: const Icon(
                    Icons.email,
                    color: Colors.black,
                  ),
                  suffixIcon: null,
                ),

                SizedBox(height: height * 0.02),
                CustomTextField(
                  controller: controller.passwordController,
                  obscureText: true,
                  hintText: 'Password',
                  keyboardType: TextInputType.text,
                  prefixIconPath: const Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                  suffixIcon: null,
                ),

                SizedBox(height: height * 0.05),
                CustomButton(
                  onTap: () {},
                  btnText: 'Sign Up',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
