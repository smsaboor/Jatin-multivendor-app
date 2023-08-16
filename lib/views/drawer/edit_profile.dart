import 'package:flutter/material.dart';
import 'package:multivendor_app/common_widget/ui_appbar.dart';
import 'package:multivendor_app/common_widget/ui_elevated_button.dart';
import 'package:multivendor_app/shared/my_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String? userId;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  getData()async{
    SharedPreferences _sharedPreference=await SharedPreferences.getInstance();
    _fullNameController.text=_sharedPreference.getString("fullName")??'';
    _emailController.text=_sharedPreference.getString("email")??'';
    _phoneController.text=_sharedPreference.getString("phone")??'';
    userId=_sharedPreference.getString("_id")??'';
    setState(() {
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyConstant.white,
      child: SafeArea(
        child: Scaffold(
          body: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: MyConstant.defaultPadding),
                const UiAppBar(
                  text: "Edit Profile",
                  isTrailing: false,
                ),
                SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: MyConstant.defaultPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: MyConstant.defaultPadding * 3,
                          ),
                          const SizedBox(
                            height: MyConstant.defaultPadding * 2,
                          ),
                          _buildTextField(_fullNameController,
                              TextInputType.text, "Enter Full Name", 4, 20),
                          SizedBox(
                            height: 5,
                          ),
                          _buildTextField(_emailController,
                              TextInputType.emailAddress, "Enter mail", 1, 30),
                          SizedBox(
                            height: 5,
                          ),
                          _buildTextField(_phoneController,
                              TextInputType.number, "Etnter Phone", 10, 10),
                          SizedBox(
                            height: 5,
                          ),
                          // _buildTextField(_passwordController,
                          //     TextInputType.text, "Enter Password", 5, 8),
                          // SizedBox(
                          //   height: 5,
                          // ),
                          const SizedBox(
                            height: MyConstant.defaultPadding * 4,
                          ),
                          UiElevatedButton(
                            text: "Update",
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                // Util.showDialogBox(context);
                                // dynamic data =
                                //     await ApiCall.postApi(apiUserRegistration, {
                                //   "fullName": _fullNameController.text,
                                //   "email": _emailController.text,
                                //   "phone": _phoneController.text,
                                //   "password": _passwordController.text
                                // });
                                // Navigator.pop(context);
                                // Util.showDialogSuccessfullyRegistered(context);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
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
}
