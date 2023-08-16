import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:multivendor_app/api/api.dart';
import 'package:multivendor_app/api/api_const.dart';
import 'package:multivendor_app/common_widget/ui_dialog.dart';
import 'package:multivendor_app/common_widget/ui_elevated_button.dart';
import 'package:multivendor_app/shared/my_constant.dart';
import 'package:multivendor_app/views/auth/otp.dart';
import 'package:multivendor_app/views/auth/registration.dart';
import 'package:multivendor_app/views/home/home.dart';

import '../../shared/ui_navigation.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController _mobileController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyConstant.white,
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: _bottomNavBar(),
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: MyConstant.defaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: MyConstant.defaultPadding * 1.5,
                      ),
                      const Text("LOGO",
                          textAlign: TextAlign.center,
                          style: MyTextStyles.logoText),
                      const SizedBox(
                        height: MyConstant.defaultPadding * 2.5,
                      ),
                      const Text("Welcome To",
                          textAlign: TextAlign.center,
                          style: MyTextStyles.loginHeadingText),
                      const SizedBox(
                        height: MyConstant.defaultPadding * 4,
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "SIGN IN",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Color(0XFF272727),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: MyConstant.defaultPadding * 1.5,
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text("Mobile No :",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Color(0XFF272727))),
                      ),
                      const SizedBox(
                        height: MyConstant.defaultPadding,
                      ),
                      _buildTextField(),
                      const SizedBox(
                        height: MyConstant.defaultPadding * 4.5,
                      ),
                      UiElevatedButton(
                        text: "Get OTP",
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            Util.showDialogBox(context);
                            dynamic data = await ApiCall.postApi(apiLoginWithPhone,
                                {"phone": _mobileController.text});
                            Navigator.pop(context);
                            NavByMe.push(
                                context,
                                OTPView(
                                  otp: data["otp"],
                                  userId: data["userId"],
                                ));
                          }
                        },
                      ),
                      const SizedBox(height: 40),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: GestureDetector(
                          onTap: () {
                            NavByMe.pushCompleteReplacement(context, RegistrationView());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Do not have an account?",
                                style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              Text(
                                " Register",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.indigo),
                              ),
                            ],
                          ),
                        ),
                      )


                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildTextField() {
    return Material(
      elevation: 5.0,
      borderRadius: const BorderRadius.all(
        Radius.circular(50),
      ),
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MyConstant.defaultPadding),
          color: MyConstant.white,
        ),
        child: SizedBox(
          height: 60,
          width: double.infinity,
          child: Row(
            children: [
              const SizedBox(width: MyConstant.defaultPadding),
              SizedBox(
                child: Image.asset(
                  "assets/india_flag.png",
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: MyConstant.defaultPadding),
              const Text("+91",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0XFF0C0B0B))),
              const SizedBox(width: MyConstant.defaultPadding / 2),
              Container(
                height: 35,
                width: 2,
                color: MyConstant.primaryColor,
              ),
              const SizedBox(width: MyConstant.defaultPadding / 2),
              Flexible(
                child: TextFormField(
                  controller: _mobileController,
                  validator: (val) {
                    if (val!.length == 10 ) {
                    }else{
                      return 'Mobile number must be 10 digit';
                    }
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "9876543",
                    hintStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w200,
                        color: Color(0XFF0C0B0B)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _bottomNavBar() {
    return SizedBox(
      width: double.infinity,
      child: Image.asset("assets/login_img.png"),
    );
  }
}
