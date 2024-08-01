// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:qhance/colors/colors.dart';
import 'package:sizer/sizer.dart';

class PasswordForm extends StatelessWidget {
  final String? Function(String?)? validator;
  final String name;
  final IconData? icon;
  bool obscureText = false;
  final VoidCallback onPressed;
  final TextEditingController? controller;
  PasswordForm({
    required this.obscureText,
    this.icon,
    required this.name,
    super.key,
    required this.controller,
    this.validator,
    required Null Function(dynamic value) onSaved,
    required this.onPressed,
    // required this.obscureText
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            bottom: 1.h,
            top: 1.h,
            left: 1.w,
          ),
          child: Text(
            name,
            style: TextStyle(
                fontSize: 4.sp,
                // fontSize: 12,
                fontWeight: FontWeight.w500,
                color: ColorData.blue),
          ),
        ),
     

        SizedBox(
          width: 30.w,

          // height: 8.h,
          child: TextFormField(
            validator: validator,
            obscureText: obscureText,
            controller: controller,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: ColorData.white)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorData.wgrey),
                  borderRadius: BorderRadius.circular(14)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: ColorData.wgrey)),
              fillColor: ColorData.wgrey,
              filled: true,
              // focusedBorder: OutlineInputBorder(
              //     borderSide: BorderSide(color: ColorData.wgrey)),
              suffixIcon: IconButton(onPressed: onPressed, icon: Icon(icon)),
              // Icon(
              //   icon,
              //   // color: Colors.black,
              //   size: 22,
              // ),
              // border: OutlineInputBorder(
              //     borderRadius: BorderRadius.circular(10),
              //     borderSide: BorderSide(color: ColorData.wgrey))),)
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        )
      ],
    );
  }
}
