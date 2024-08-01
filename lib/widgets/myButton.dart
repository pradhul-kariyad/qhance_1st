// ignore_for_file: file_names, avoid_print
import 'package:flutter/material.dart';
import 'package:qhance/colors/colors.dart';
import 'package:sizer/sizer.dart';

class MyButton extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;
  const MyButton({super.key, required this.name, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30.w,
      height: 6.5.h,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(ColorData.blue),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)))),
          onPressed: onPressed,
          child: Text(
            name,
            style: TextStyle(color: ColorData.white),
          )),
    );
  }
}
