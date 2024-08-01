// ignore_for_file: non_constant_identifier_names, unused_local_variable
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qhance/auth/signInPage.dart';
import 'package:qhance/provider/iconProvider.dart';
import 'package:qhance/provider/signInProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool userlogin = prefs.getBool('userlogin') ?? false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return SignInProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return IconProvider();
        }),
      ],
      child: Sizer(builder: (
        Context,
        orientation,
        deviceType,
      ) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SignInPage(),
        );
      }),
    );
  }
}
