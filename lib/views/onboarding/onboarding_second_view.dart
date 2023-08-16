import 'package:flutter/material.dart';
import 'package:multivendor_app/shared/my_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common_widget/ui_onboarding_button.dart';
import '../../shared/ui_navigation.dart';
import '../dashboard/dashboard_view.dart';
import 'onboarding_third_view.dart';

class OnboardingSecondView extends StatefulWidget {
  const OnboardingSecondView({super.key});

  @override
  State<OnboardingSecondView> createState() => _OnboardingSecondViewState();
}

class _OnboardingSecondViewState extends State<OnboardingSecondView> {
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
                      onTap: () async{
                        SharedPreferences pref=await SharedPreferences.getInstance();
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
                  "assets/onboarding_image2.png",
                  fit: BoxFit.cover,
                ),
              ),
              const Text(
                "Pickup Delivery At Your’s \n Door",
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
              UiOnboardingButton(onPressed: () {
                NavByMe.push(context, const OnboardingThirdView());
              }),
            ],
          ),
        ),
      ),
    );
  }
}
