import 'package:flutter/material.dart';
import 'package:multivendor_app/api/api.dart';
import 'package:multivendor_app/api/api_const.dart';
import 'package:multivendor_app/common_widget/ui_dialog.dart';
import 'package:multivendor_app/common_widget/ui_otp_textfield.dart';
import 'package:multivendor_app/local_data/local_data.dart';
import 'package:multivendor_app/shared/my_constant.dart';
import 'package:multivendor_app/shared/ui_navigation.dart';
import 'package:multivendor_app/views/auth/verification.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common_widget/ui_elevated_button.dart';

class OTPView extends StatefulWidget {
  final String otp, userId;

  const OTPView({Key? key, required this.otp, required this.userId})
      : super(key: key);

  @override
  State<OTPView> createState() => _OTPViewState();
}

class _OTPViewState extends State<OTPView> {
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String otpError = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyConstant.white,
      child: SafeArea(
        child: Scaffold(
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
                        height: MyConstant.defaultPadding * 2,
                      ),
                      const Text(
                        "LOGO",
                        textAlign: TextAlign.center,
                        style: MyTextStyles.logoText,
                      ),
                      const SizedBox(
                        height: MyConstant.defaultPadding * 3,
                      ),
                      const Text(
                        "Enter Verification Code",
                        style: MyTextStyles.loginHeadingText,
                      ),
                      const SizedBox(
                        height: MyConstant.defaultPadding,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Enter  4 digit code that send to ${widget.otp}",
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                              color: Color(0xFF000000)),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "your name",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: MyConstant.defaultPadding * 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          OtpInput(
                            _fieldOne,
                            first: true,
                            last: false,
                          ),
                          OtpInput(_fieldTwo, first: false, last: false),
                          OtpInput(_fieldThree, first: false, last: false),
                          OtpInput(_fieldFour, first: false, last: false),
                        ],
                      ),
                      Text(otpError,style: TextStyle(color: Colors.red,fontSize: 16),),
                      const SizedBox(
                        height: MyConstant.defaultPadding * 4,
                      ),
                      UiElevatedButton(
                          text: "Continue",
                          onPressed: () {
                           verifyOtp(context);
                          }),
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

  void verifyOtp(BuildContext context)async{
    setState(() {
      otpError = "";
    });
    if (_fieldOne.text == widget.otp[0] &&
        _fieldTwo.text == widget.otp[1] &&
        _fieldThree.text == widget.otp[2] &&
        _fieldFour.text == widget.otp[3]) {
      print(
          "field: ${_fieldOne.text} : ${widget.otp[0]}");
      Util.showDialogBox(context);
      dynamic data = await ApiCall.postApi("$apiVerifyOtp${widget.userId}",{
        "otp": _fieldOne.text +
            _fieldTwo.text +
            _fieldThree.text +
            _fieldFour.text
      });
      print("object::: ${data['data']['fullName']}");
      SharedPreferences _sharedPreference = await SharedPreferences.getInstance();
      _sharedPreference.setBool('isLogin', true);
      _sharedPreference.setString('accessToken', data['accessToken']);
      _sharedPreference.setString('fullName', data['data']['fullName']);
      _sharedPreference.setString('phone', data['data']['phone']);
      _sharedPreference.setString('email', data['data']['email']);
      _sharedPreference.setString('password', data['data']['password']);
      _sharedPreference.setString('userType', data['data']['userType']);
      _sharedPreference.setInt('wallet', data['data']['wallet']);
      _sharedPreference.setString('userId', data['data']['_id']);
      Navigator.pop(context);
      NavByMe.push(context, const VerificationView());
    } else {
      // showDialogBox(context);
      setState(() {
        otpError = "Please enter correct otp!";
      });
    }
  }
}
