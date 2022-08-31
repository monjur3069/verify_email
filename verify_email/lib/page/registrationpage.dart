

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:verify_email/auth/auth_service.dart';

import '../custom_assets/colors.dart';
import '../widgets/curve.dart';
import '../widgets/text_widgets.dart';
import 'launcher_page.dart';
import 'user_dashboard_page.dart';

class RegistrationPage extends StatefulWidget {
  static const String routeName = '/registration';
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final userNameController = TextEditingController();
  final fullNameController = TextEditingController();
  final countryController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  final monthController = TextEditingController();
  final dayController = TextEditingController();
  final yearController = TextEditingController();

  final passwordController = TextEditingController();

  String errMsg = '';
  bool genderColor = true;
  bool agree = false;
  bool isObscureText = true;



  @override
  void dispose() {
    userNameController.dispose();
    fullNameController.dispose();
    countryController.dispose();
    emailController.dispose();
    phoneController.dispose();
    monthController.dispose();
    dayController.dispose();
    yearController.dispose();
    passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  ClipPath(
                    clipper: MyCustomClipper(),
                    child: Container(
                      color: AppColors.blueColor1,
                      height: 150,
                    ),
                  ),
                  Positioned(
                    bottom: 35,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25.0, right: 25),
                      child: const Text(
                        'Registration Form',
                        style: TextStyle(fontSize: 18, color: AppColors.blueColor1),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25.0, right: 25),
                      child: Text(errMsg, style: TextStyle(color: Theme.of(context).errorColor),),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    //TextField
                    SizedBox(
                      height: 40,
                      child: TextWidget(userNameController, 'Username'),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    //TextField
                    SizedBox(
                      height: 40,
                      child: TextWidget(fullNameController, 'Full name'),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    //TextField
                    SizedBox(
                      height: 40,
                      child: TextWidget(countryController, 'Country'),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    //TextField
                    SizedBox(
                      height: 40,
                      child: TextWidget(emailController, 'E-mail'),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    //TextField
                    SizedBox(
                      height: 40,
                      child: TextWidget(phoneController, 'Phone number'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //  Gender
                    Row(
                      children: [
                        const Text('Gender',style: TextStyle(color: AppColors.blueColor,fontSize: 16),),
                        SizedBox(width: 20,),
                        ElevatedButton(
                          onPressed: _checkGenderValue,
                          child: const Text('Male'),
                          style: ElevatedButton.styleFrom(
                              primary: genderColor ? AppColors.blueColor1 : AppColors.blueColor,
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(width: 10,),
                        ElevatedButton(
                          onPressed: _checkGenderValue,
                          child: const Text('Female'),
                          style: ElevatedButton.styleFrom(
                              primary: genderColor ? AppColors.blueColor : AppColors.blueColor1,
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //Date Of Birth
                    Row(
                      children: [
                        const Text('Date Of Birth',style: TextStyle(color: AppColors.blueColor,fontSize: 16),),
                        SizedBox(width: 20,),
                        SizedBox(
                          height: 28,
                          width: 50,
                          child: TextField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            controller: dayController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'DD',
                              filled: true,
                              fillColor: AppColors.blueColor,
                              hintStyle: TextStyle(color: Colors.white,fontSize: 14),),
                          ),
                        ),
                        SizedBox(width: 10,),
                        SizedBox(
                          height: 28,
                          width: 50,
                          child: TextField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            controller: monthController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'MM',
                              filled: true,
                              fillColor: AppColors.blueColor,
                              hintStyle: TextStyle(color: Colors.white,fontSize: 14),),
                          ),
                        ),
                        SizedBox(width: 10,),
                        SizedBox(
                          height: 28,
                          width: 65,
                          child: TextField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            controller: yearController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'YYYY',
                              filled: true,
                              fillColor: AppColors.blueColor,
                              hintStyle: TextStyle(color: Colors.white,fontSize: 14),),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //Password
                    SizedBox(
                      height: 40,
                      child: TextFormField(
                        obscureText: isObscureText,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.name,
                        controller: passwordController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.blue)),
                          hintText: 'Password',
                          prefixIcon: Icon(Icons.lock,color: Colors.white,),
                          suffixIcon: IconButton(
                            icon: Icon(
                                isObscureText ? Icons.visibility_off : Icons.visibility,color: Colors.white),
                            onPressed: () => setState(() {
                              isObscureText = !isObscureText;
                            }),
                          ),
                          filled: true,
                          fillColor: AppColors.blueColor,
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                          validator: (value) {
                            if(value == null || value.isEmpty) {
                              return 'This field must not be empty';
                            }
                            return null;
                          }
                      )
                    ),
                    //checkbox
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              value: agree,
                              onChanged: _agree),
                          const Text(
                            'Agree with ',
                            style: TextStyle(color: AppColors.blueColor1),
                          ),
                          const Text(
                            'Terms & Conditions',
                            style: TextStyle(color: AppColors.blueColor),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: InkWell(
                        onTap: authenticate,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors.blueColor1
                          ),
                          height: 40,
                          width: 200,
                          child: Center(child: const Text('Create account',style: TextStyle(color: Colors.white,fontSize: 18),),),
                        ),
                      ),
                    ),


                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _checkGenderValue() {
    setState(() {
      genderColor = !genderColor;
    });
  }

  void _agree(bool? newValue) {
    if (newValue != null) {
      setState(() {
        agree = newValue;
      });
    }
  }

  authenticate() async {
      try {
        final status = await AuthService.register(
            emailController.text, passwordController.text);
        if (status) {
          if (!mounted) return;
          Navigator.pushReplacementNamed(context, UserDashboardPage.routeName);
        } else {
          Center(child: CircularProgressIndicator());
        }
      } on FirebaseAuthException catch (e) {
        setState(() {
          errMsg = e.message!;
        });
      }

  }

  }

