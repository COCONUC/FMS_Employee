//import 'package:computer_service_system/screens/widgets/otp_vertify_screen.dart';
import 'package:flutter/material.dart';
import 'package:fms_employee/constants/color_constant.dart';
import 'package:fms_employee/constants/constant.dart';
import 'package:fms_employee/constants/pref_data.dart';
import 'package:fms_employee/constants/pref_data.dart';
import 'package:fms_employee/constants/resizer/fetch_pixels.dart';
import 'package:fms_employee/constants/widget_utils.dart';
import 'package:fms_employee/screens/staff_home_page.dart';
import 'package:fms_employee/widgets/bottom_bar.dart';
import 'package:fms_employee/widgets/custom_button.dart';
import 'package:fms_employee/widgets/custom_text_field.dart';

/*enum Auth {
  signin,
  signup,
}*/

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login-screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  String resultText = "";

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
    passwordController.dispose();
  }


  void signUpUser() {
   /* authService.signUpUser(
      context: context,
      username: phoneController.text,
      password: passwordController.text,
    );*/
  }

  void signInUser() {
    if(phoneController.text == '0938995710' ){
      resultText == 'OK';
      print('OK');
      Navigator.of(context).pushReplacementNamed(NavScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  tileColor: mBackgroundColor,
                  title: const Text(
                    '????ng nh???p',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ),

                  Container(
                    padding: const EdgeInsets.all(8),
                    color: mBackgroundColor,
                    child: Form(
                      key: _signInFormKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: phoneController,
                            hintText: 'S??? ??i???n tho???i',
                            secure: false,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            controller: passwordController,
                            hintText: 'M???t kh???u',
                            secure: true,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomButton(
                            text: '????ng nh???p',
                            onTap: () {
                              Navigator.of(context).pushReplacementNamed(NavScreen.routeName);
                              if (_signInFormKey.currentState!.validate()) {
                                signInUser();
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const InkWell(
                           child:  Text(
                            'Qu??n m???t kh???u ?',
                          ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}