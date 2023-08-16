import 'package:flutter/material.dart';
import 'package:multivendor_app/common_widget/ui_appbar.dart';

import '../../shared/my_constant.dart';

class HelpAndSupport extends StatefulWidget {
  const HelpAndSupport({Key? key}) : super(key: key);

  @override
  State<HelpAndSupport> createState() => _HelpAndSupportState();
}

class _HelpAndSupportState extends State<HelpAndSupport> {
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
                UiAppBar(text: "Help & Support"),
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
