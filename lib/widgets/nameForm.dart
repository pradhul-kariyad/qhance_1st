// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:qhance/colors/colors.dart';
import 'package:sizer/sizer.dart';

class NameForm extends StatelessWidget {
  final String? Function(String?)? validator;
  final String name;

  final TextEditingController? controller;
  const NameForm({
  
    required this.name,
    super.key,
    required this.controller,
    this.validator,
    required Null Function(dynamic value) onSaved,

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
            // obscureText: obscureText,
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
