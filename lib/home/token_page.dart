import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenPage extends StatelessWidget {
  const TokenPage({Key? key}) : super(key: key);

  Future<String?> _getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('token');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Token Page'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 35.w,vertical: 20.h),
        height: 10.h,
        width: 34.w,
        child: Center(
          child: FutureBuilder<String?>(
            future: _getToken(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                return Text('Token: ${snapshot.data}');
              } else {
                return Text('No token found');
              }
            },
          ),
        ),
      ),
    );
  }
}
