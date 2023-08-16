import 'package:flutter/material.dart';

import '../../model/nav_model.dart';
import '../../shared/my_constant.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  bool isAll = false;
  bool isOthers = false;
  final List<MyModel> navModel = [
    MyModel(
        imgSrc: 'assets/calender.png',
        text: "You schedule of online claases is near"),
    MyModel(
        imgSrc: 'assets/map.png', text: "Your delivery is deliveren on 1 sept"),
    MyModel(imgSrc: 'assets/settings.png', text: "Your Setting updated now."),
    MyModel(
        imgSrc: 'assets/paste.png',
        text: "Tejas Aher is added in this account"),
    MyModel(imgSrc: 'assets/update.png', text: "New Upadate is avaiable."),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: true,
        title: const Text(
          "Notification(4)",
          style: MyTextStyles.appBarText,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.error,
              color: MyConstant.white,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(MyConstant.defaultPadding / 2),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isAll = true;
                      isOthers = false;
                    });
                  },
                  child: _buildAllContainer(
                    "All",
                  ),
                ),
                const SizedBox(width: MyConstant.defaultPadding / 2),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isOthers = true;
                      isAll = false;
                    });
                  },
                  child: _buildOthersContainer(
                    "Other's",
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            SizedBox(
              height: 500,
              width: double.infinity,
              child: ListView.separated(
                itemCount: navModel.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  var data = navModel.elementAt(index);
                  return ListTile(
                    leading: Image.asset(data.imgSrc),
                    title:
                        Text(data.text, style: MyTextStyles.notificationText),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildAllContainer(String text) {
    return Container(
      height: 40,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(MyConstant.defaultPadding / 2),
        color: isAll
            ? const Color(0xFFFF673B).withOpacity(0.7)
            : MyConstant.primaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: MyConstant.defaultPadding / 2),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
              color: isAll ? MyConstant.primaryColor : MyConstant.white,
            ),
          ),
        ),
      ),
    );
  }

  _buildOthersContainer(String text) {
    return Container(
      height: 40,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(MyConstant.defaultPadding / 2),
        color: isAll
            ? MyConstant.primaryColor
            : const Color(0xFFFF673B).withOpacity(0.7),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: MyConstant.defaultPadding / 2),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
              color: isAll ? MyConstant.white : MyConstant.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
