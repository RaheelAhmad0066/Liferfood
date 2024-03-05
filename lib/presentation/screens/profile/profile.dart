import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifer_food/core/utils/app_textstyle.dart';
import 'package:lifer_food/core/utils/colors.dart';
import 'package:lifer_food/core/utils/custom_buttons.dart';
import 'package:lifer_food/core/utils/custom_text_field.dart';
import 'package:lifer_food/core/utils/res.dart';
import 'package:lifer_food/core/utils/size_config.dart';
import 'package:card_swiper/card_swiper.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController nameCont = TextEditingController();
  final TextEditingController emailCont = TextEditingController();

  @override
  void initState() {
    nameCont.text = 'Muhammad Ali';
    emailCont.text = 'user@gmail.com';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: getWidth(context),
        height: getHeight(context),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/profile_back.png'),
                fit: BoxFit.cover)),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/splash_logo.png',
                  height: getHeight(context) * .25,
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: getWidth(context),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    margin: EdgeInsets.symmetric(
                        horizontal: getWidth(context) * .07),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: getHeight(context) * .02,
                          ),
                          Center(
                            child: Image.asset(
                              'assets/images/profile_pic.png',
                              height: 100,
                              width: 100,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getWidth(context) * .02,
                                vertical: getHeight(context) * .02),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: const Text('Name', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                                ),
                                CreateCustomField(
                                  backgroundColor: Colors.white,
                                  borderColor: AppColors.primaryColor,
                                  text: 'Enter Your Name',
                                  controller: nameCont,
                                  icon: Image.asset('assets/images/person.png'),
                                  keyBoardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Enter your name';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: getHeight(context) * .02,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: const Text('Email', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                                ),
                                CreateCustomField(
                                  backgroundColor: Colors.white,
                                  borderColor: AppColors.primaryColor,
                                  text: 'Enter Your Email',
                                  controller: emailCont,
                                  enabled: false,
                                  icon: Image.asset(
                                    'assets/images/email.png',
                                  ),
                                  keyBoardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    Pattern pattern =
                                        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                        r"{0,253}[a-zA-Z0-9])?)*$";
                                    RegExp regex = RegExp(pattern.toString());
                                    if (value == null) {
                                      return 'Enter an Email Address!';
                                    } else if (!regex.hasMatch(value)) {
                                      return 'Enter a valid email address';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: getHeight(context) * .02,
                                ),
                                CreateCustomButton(
                                  text: 'Update Profile',
                                  width: getWidth(context)*.8,
                                  onTap: () {},
                                )
                              ],
                            ),
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
}
