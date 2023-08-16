import 'package:flutter/material.dart';
import 'package:multivendor_app/common_widget/ui_elevated_button.dart';
import 'package:multivendor_app/shared/my_constant.dart';

class RatingAndReview extends StatefulWidget {
  const RatingAndReview({Key? key}) : super(key: key);

  @override
  State<RatingAndReview> createState() => _RatingAndReviewState();
}

class _RatingAndReviewState extends State<RatingAndReview> {
  bool isLoading = false;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: true,
        title: const Text(
          "Rating & Review",
          style: MyTextStyles.appBarText,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: MyConstant.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: MyConstant.defaultPadding),
              const Text(
                "Send your feedback",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF0F0F0F),
                ),
              ),
              const SizedBox(height: MyConstant.defaultPadding),
              const Text(
                "Tell us your honest feedback to help us improve ",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF454545),
                ),
              ),
              const SizedBox(height: MyConstant.defaultPadding),
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(MyConstant.defaultPadding / 2),
                  border: Border.all(
                    color: MyConstant.grey,
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(MyConstant.defaultPadding),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "  Enter your feedback",
                    ),
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  height: 100,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return IconButton(
                        icon: Icon(Icons.star,
                            size: index == 0 || index == 4
                                ? 40
                                : index == 1 || index == 3
                                    ? 50
                                    : index == 2
                                        ? 60
                                        : 0),
                        color: index <= selectedIndex
                            ? Colors.yellow
                            : Colors.grey,
                        onPressed: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: index == 3 ? MyConstant.defaultPadding / 2 : 8,
                      );
                    },
                  ),
                ),
              ),
              const Center(
                child: Text(
                  "Give Rating",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ),
              const SizedBox(height: MyConstant.defaultPadding * 2),
              SizedBox(
                  height: 56,
                  child: UiElevatedButton(
                      text: "Submit Feedback", onPressed: () {})),
            ],
          ),
        ),
      ),
    );
  }
}
