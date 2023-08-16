import 'package:flutter/material.dart';
import 'package:multivendor_app/shared/my_constant.dart';
import 'package:multivendor_app/views/dashboard/dashboard_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common_widget/ui_onboarding_button.dart';
import '../../shared/ui_navigation.dart';
import '../auth/login.dart';

class OnboardingThirdView extends StatefulWidget {
  const OnboardingThirdView({super.key});

  @override
  State<OnboardingThirdView> createState() => _OnboardingThirdViewState();
}

class _OnboardingThirdViewState extends State<OnboardingThirdView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyConstant.primaryColor,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Image.asset("assets/main_top.png",
                        fit: BoxFit.fitWidth),
                  ),
                  Positioned(
                    right: 16,
                    top: 50,
                    child: GestureDetector(
                      child: const Text(
                        "Skip",
                        style: MyTextStyles.skipText,
                      ),
                      onTap: () async {
                        SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        pref.setBool("onboarding", false);
                        NavByMe.push(context, const Dashboard());
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 214,
                child: Image.asset(
                  "assets/onboarding_image3.png",
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: MyConstant.defaultPadding),
              const Text(
                "Browse Your Menu and \n Order Directly",
                textAlign: TextAlign.center,
                style: MyTextStyles.onboardingStyle,
              ),
              const SizedBox(height: MyConstant.defaultPadding / 2),
              const Text(
                "Lorem ipsum dolor sit amet consectetur. Tellus \n et id est vulputate euismod vitae. Et in at eget \n convallis suscipit adipiscing.",
                style: MyTextStyles.onboardingGreyText,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: MyConstant.defaultPadding * 2),
              UiOnboardingButton(onPressed: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                pref.setBool("onboarding", false);
                NavByMe.push(context, const LoginView());
              }),
            ],
          ),
        ),
      ),
    );
  }
}
