// ignore_for_file: use_build_context_synchronously, unnecessary_brace_in_string_interps, unused_import
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:qhance/colors/colors.dart';
import 'package:qhance/home/token_page.dart';
import 'package:qhance/widgets/ip.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInProvider extends ChangeNotifier {
  bool isLoading = false;


  void setLoading(bool value) {
    isLoading = value;
    notifyListeners(); 
  }

  Future<void> signIn(
      String username, String password, BuildContext context) async {
    try {
      setLoading(true);

      log("Sending login request...");

      var response = await http.get(
        Uri.parse(
            'http://13.60.173.158/user/company_admin_login_page?username=STA040&password=123'),
      );

      log('Response status code: ${response.statusCode}');
      log('Response body: ${response.body}');

      setLoading(false); 

      if (response.statusCode == 200) {
        // showDialog(...);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: ColorData.blue,
            content: Text("Sign-in successful...")));

        log("Sign-in successful");
        var result = jsonDecode(response.body);
        String? token = result['token'];

        if (token != null) {
          SharedPreferences pref = await SharedPreferences.getInstance();
          await pref.setString('token', token);
          await pref.setBool('userlogin', true);
          log('local store: ${pref}');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => TokenPage()),
          );
        }
      } else if (response.statusCode == 400) {
        var responseBody = jsonDecode(response.body);
        if (responseBody['error'] == 'Invalid email') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: ColorData.blue, content: Text("Invalid email")));
        } else if (responseBody['error'] == 'Invalid password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: ColorData.blue,
              content: Text("Invalid Password")));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: ColorData.blue, content: Text("Invalid Email")));
        }
        log("Sign-in failed with status code: ${response.statusCode}");
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: ColorData.blue,
            content: Text("Sign-in failed...")));
        log("Sign-in failed with status code: ${response.statusCode}");
      }
    } catch (e) {
      log('Error during sign-in: $e');
      setLoading(false);
    }
  }
}
