import 'package:flutter/material.dart';
import 'package:multivendor_app/common_widget/ui_appbar.dart';
import 'package:multivendor_app/shared/my_constant.dart';

class FaqView extends StatefulWidget {
  const FaqView({Key? key}) : super(key: key);

  @override
  State<FaqView> createState() => _FaqViewState();
}

class _FaqViewState extends State<FaqView> {
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
                UiAppBar(text: "FQA'S"),
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
