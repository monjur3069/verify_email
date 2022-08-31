
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verify_email/page/registrationpage.dart';
import 'package:verify_email/page/user_dashboard_page.dart';


import 'page/admin_dashboard_page.dart';
import 'page/launcher_page.dart';
import 'page/login_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        builder: EasyLoading.init(),
        //home: LoginScreen(),
        initialRoute: LauncherPage.routeName,
        routes: {
          DashboardPage.routeName: (_) => const DashboardPage(),
          LauncherPage.routeName: (_) => const LauncherPage(),
          LoginPage.routeName: (_) => const LoginPage(),
          UserDashboardPage.routeName: (_) => const UserDashboardPage(),
          RegistrationPage.routeName: (_) => const RegistrationPage(),
        },
      );
    });
  }
}
