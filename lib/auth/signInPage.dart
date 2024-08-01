// ignore_for_file: file_names, unused_field, must_be_immutable
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qhance/colors/colors.dart';
import 'package:qhance/provider/iconProvider.dart';
import 'package:qhance/provider/signInProvider.dart';
import 'package:qhance/widgets/myButton.dart';
import 'package:qhance/widgets/nameForm.dart';
import 'package:qhance/widgets/passwordForm.dart';
import 'package:sizer/sizer.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late String _email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Stack(children: [
            Container(
              margin: EdgeInsets.only(left: 24.w, top: 25.h),
              height: 49.h,
              width: 25.w,
              decoration: BoxDecoration(
                // color: Colors.red,
                image: DecorationImage(
                    image: AssetImage("assets/images/qww.png"),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 53.w),
              height: 100.h,
              width: 22.w,
              // color: Colors.amber,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 17.h, bottom: 2.h),
                    child: Center(
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 3.h),
                  NameForm(
                    name: "Email",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    controller: mailController,
                    onSaved: (value) {
                      _email = value;
                    },
                  ),
                  // SizedBox(height: 1.h),
                  Consumer<IconProvider>(
                    builder: (BuildContext context, iconAndOb, Widget? child) {
                      return PasswordForm(
                        onPressed: () {
                          log("visibility icon");
                          iconAndOb.changeIcon();
                          iconAndOb.changeObt();
                        },
                        obscureText: iconAndOb.changeOb,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Password';
                          }
                          return null;
                        },
                        name: 'Password',
                        controller: passwordController,
                        icon: iconAndOb.icon,
                        onSaved: (value) {},
                      );
                    },
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(left: 54.w, top: 1.3.h),
                  //   child: InkWell(
                  //     onTap: () {
                  //       // Navigator.push(
                  //       //   context,
                  //       //   MaterialPageRoute(
                  //       //       builder: (context) => NewPasswordPage()),
                  //       // );
                  //     },
                  //     child: Text(
                  //       'Forgot Password?',
                  //       style: TextStyle(
                  //         fontSize: 11.sp,
                  //         fontWeight: FontWeight.w500,
                  //         color: Colors.red,
                  //         decoration: TextDecoration.underline,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.h),
                    child: Consumer<SignInProvider>(
                      builder: (BuildContext context, signInProvider,
                          Widget? child) {
                        if (signInProvider.isLoading) {
                          return Center(
                              child: CircularProgressIndicator(
                            color: ColorData.grey,
                            strokeAlign: -4,
                          ));
                        }
                        return MyButton(
                          name: 'Sign In',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              signInProvider.signIn(mailController.text,
                                  passwordController.text, context);
                            }
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 5.h),

                  SizedBox(height: 2.h),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
