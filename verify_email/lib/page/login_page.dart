import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verify_email/page/registrationpage.dart';
import '../auth/auth_service.dart';
import '../custom_assets/colors.dart';
import 'launcher_page.dart';
import 'user_dashboard_page.dart';


class LoginScreen extends StatefulWidget {
  static const String routeName = '/login2';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  bool isObscureText = true;
  final formKey = GlobalKey<FormState>();
  String errMsg = '';

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueColor1,
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                height: 150.h,
                width: ScreenUtil().screenWidth,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.light,
                          color: Colors.transparent,
                        ),
                      ),
                      Text(
                        "Sign In",
                        style: TextStyle(fontSize: 22.sp, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: ScreenUtil().screenWidth,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(28.r),
                      topRight: Radius.circular(28.r),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.w),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            "Welcome Back",
                            style: TextStyle(
                                fontSize: 22.sp, color: AppColors.blueColor1),
                          ),
                          Text(
                            "Glad to see you back my buddy.",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Color(0xFFBBBBBB),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 48.h,
                                width: 41.w,
                                decoration: BoxDecoration(
                                    color: AppColors.blueColor1,
                                    borderRadius: BorderRadius.circular(12.r)),
                                child: Center(
                                  child: Icon(
                                    Icons.email_outlined,
                                    color: Colors.white,
                                    size: 20.w,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                    hintText: "monjur@gmail.com",
                                    hintStyle: TextStyle(
                                      fontSize: 14.sp,
                                      color: Color(0xFF414041),
                                    ),
                                    labelText: 'EMAIL',
                                    labelStyle: TextStyle(
                                      fontSize: 15.sp,
                                      color: AppColors.blueColor1,
                                    ),
                                  ),
                                    validator: (value) {
                                      if(value == null || value.isEmpty) {
                                        return 'This field must not be empty';
                                      }
                                      return null;
                                    }
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 48.h,
                                width: 41.w,
                                decoration: BoxDecoration(
                                    color: AppColors.blueColor1,
                                    borderRadius: BorderRadius.circular(12.r)),
                                child: Center(
                                  child: Icon(
                                    Icons.lock_outline,
                                    color: Colors.white,
                                    size: 20.w,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: _passwordController,
                                  obscureText: _obscureText,
                                  decoration: InputDecoration(
                                    hintText: "password must be 6 character",
                                    hintStyle: TextStyle(
                                      fontSize: 14.sp,
                                      color: Color(0xFF414041),
                                    ),
                                    labelText: 'PASSWORD',
                                    labelStyle: TextStyle(
                                      fontSize: 15.sp,
                                      color: AppColors.blueColor1,
                                    ),
                                    suffixIcon: _obscureText == true
                                        ? IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _obscureText = false;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.remove_red_eye,
                                          size: 20.w,
                                          color: AppColors.blueColor1,
                                        ))
                                        : IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _obscureText = true;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.visibility_off,
                                          size: 20.w,
                                        )),
                                  ),
                                    validator: (value) {
                                      if(value == null || value.isEmpty) {
                                        return 'This field must not be empty';
                                      }
                                      return null;
                                    }
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(errMsg, style: TextStyle(color: Theme.of(context).errorColor),),
                          SizedBox(
                            height: 45.h,
                          ),
                          SizedBox(
                            width: 1.sw,
                            height: 56.h,
                            child: ElevatedButton(
                              onPressed: authenticate,
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18.sp),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.blueColor1,
                                elevation: 3,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Center(
                            child: Wrap(
                              children: [
                                Text(
                                  "Don't have an account?",
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFFBBBBBB),
                                  ),
                                ),
                                GestureDetector(
                                  child: Text(
                                    " Sign Up",
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.blueColor1,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.pushNamed(context, RegistrationPage.routeName);
                                  },
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void authenticate()async {
    if(formKey.currentState!.validate()) {
      try {
        final status = await AuthService.login(_emailController.text, _passwordController.text);
        if(status) {
          if(!mounted) return;
          Navigator.pushReplacementNamed(context, LauncherPage.routeName);
        } else {
          Navigator.pushReplacementNamed(context, UserDashboardPage.routeName);
        }
      } on FirebaseAuthException catch (e) {
        setState(() {
          errMsg = e.message!;
        });
      }
    }
  }
}
