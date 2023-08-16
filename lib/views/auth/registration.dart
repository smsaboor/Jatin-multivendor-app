import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:multivendor_app/api/api.dart';
import 'package:multivendor_app/api/api_const.dart';
import 'package:multivendor_app/common_widget/ui_dialog.dart';
import 'package:multivendor_app/common_widget/ui_elevated_button.dart';
import 'package:multivendor_app/shared/my_constant.dart';
import 'package:multivendor_app/views/auth/login.dart';
import 'package:multivendor_app/views/auth/otp.dart';

import '../../shared/ui_navigation.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
                      const Text("Registration",
                          textAlign: TextAlign.center,
                          style: MyTextStyles.loginHeadingText),
                      const SizedBox(
                        height: MyConstant.defaultPadding * 2,
                      ),
                      _buildTextField(_fullNameController, TextInputType.text,
                          "Enter Full Name",4,20),
                      SizedBox(
                        height: 5,
                      ),
                      _buildTextField(_emailController,
                          TextInputType.emailAddress, "Enter mail",1,30),
                      SizedBox(
                        height: 5,
                      ),
                      _buildTextField(_phoneController, TextInputType.number,
                          "Etnter Phone",10,10),
                      SizedBox(
                        height: 5,
                      ),
                      _buildTextField(_passwordController, TextInputType.text,
                          "Enter Password",5,8),
                      SizedBox(
                        height: 5,
                      ),
                      const SizedBox(
                        height: MyConstant.defaultPadding * 2,
                      ),
                      UiElevatedButton(
                        text: "Register",
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            Util.showDialogBox(context);
                            dynamic data =
                                await ApiCall.postApi(apiUserRegistration, {
                              "fullName": _fullNameController.text,
                              "email": _emailController.text,
                              "phone": _phoneController.text,
                              "password": _passwordController.text
                            });
                            Navigator.pop(context);
                            Util.showDialogSuccessfullyRegistered(context);
                          }
                        },
                      ),
                      const SizedBox(height: 40),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: GestureDetector(
                          onTap: () {
                            NavByMe.pushCompleteReplacement(
                                context, LoginView());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Do you have an account?",
                                style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              Text(
                                " Login",
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

  _buildTextField(controller, keyboardType, hintText,min,max) {
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
              Flexible(
                child: TextFormField(
                  controller: controller,
                  keyboardType: keyboardType,
                  validator: (val) {
                    if (val!.length<2) {
                      return 'Please enter valid ';
                    }
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: hintText,
                    hintText: "",
                    hintStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
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
