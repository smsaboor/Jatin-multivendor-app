import 'package:flutter/material.dart';
import 'package:multivendor_app/shared/my_constant.dart';

import '../../common_widget/ui_appbar.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyConstant.white,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: const [
                SizedBox(height: MyConstant.defaultPadding),
                UiAppBar(text: "Terms And Conditions"),
                SizedBox(height: MyConstant.defaultPadding * 2),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MyConstant.defaultPadding),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis. Ut commodo efficitur neque. Ut diam quam, semper iaculis condimentum ac, vestibulum eu nisl.",
                    style: MyTextStyles.dummyTextStyle,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MyConstant.defaultPadding),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis. Ut commodo efficitur neque. Ut diam quam, semper iaculis condimentum ac, vestibulum eu nisl.",
                    style: MyTextStyles.dummyTextStyle,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MyConstant.defaultPadding),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis. Ut commodo efficitur neque. Ut diam quam, semper iaculis condimentum ac, vestibulum eu nisl.",
                    style: MyTextStyles.dummyTextStyle,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
