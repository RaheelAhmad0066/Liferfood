import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:lifer_food/core/utils/PrefUtils.dart';
import 'package:lifer_food/core/utils/app_textstyle.dart';
import 'package:lifer_food/core/utils/colors.dart';
import 'package:lifer_food/core/utils/constants.dart';
import 'package:lifer_food/core/utils/custom_buttons.dart';
import 'package:lifer_food/core/utils/res.dart';
import 'package:lifer_food/core/utils/size_config.dart';
import 'package:lifer_food/presentation/screens/auth_pages/boarding/boarding_pages.dart';
import 'package:lifer_food/presentation/screens/auth_pages/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // Timer(const Duration(seconds: 2), () {
    //   // final bool visited = PrefUtils.getBool(AppConstants.firstVisit) ?? false;
    //   // if (visited) {
    //   //   final String token = PrefUtils.getString(AppConstants.token) ?? '';
    //   //   if (token.isNotEmpty) {
    //   //     Navigator.pushReplacement(
    //   //         context,
    //   //         MaterialPageRoute(
    //   //           builder: (context) => const LoginScreen(),
    //   //         ));
    //   //   } else {
    //   //     Navigator.pushReplacement(
    //   //         context,
    //   //         MaterialPageRoute(
    //   //           builder: (context) => const LoginScreen(),
    //   //         ));
    //   //   }
    //   // } else {
    //   //   Navigator.pushReplacement(
    //   //       context,
    //   //       MaterialPageRoute(
    //   //         builder: (context) => const BoardingPage(),
    //   //       ));
    //   // }
    //   Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => const BoardingPage(),
    //       ));
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            child: Container(
              height: getHeight(context) * .6,
              width: getWidth(context),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/sp_top.png'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3), BlendMode.colorBurn),
                ),
              ),
              child: Image.asset(
                'assets/images/splash_logo.png',
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: ClipPath(
              clipper: OvalTopBorderClipper(),
              child: Container(
                height: getHeight(context) * .5,
                width: getWidth(context),
                color: AppColors.primaryColor,
                child: Column(
                  children: [
                    SizedBox(
                      height: 35.sp,
                    ),
                    Text(
                      'Are You \nHungry?',
                      style: AppTextStyle.buttonTitle.copyWith(
                        fontSize: 32,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 6,
                            width: 40,
                            margin: const EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            height: 6,
                            width: 6,
                            margin: const EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey,
                            ),
                          ),
                          Container(
                              height: 6,
                              width: 6,
                              margin: const EdgeInsets.only(right: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey,
                              )),
                          Container(
                            height: 6,
                            width: 6,
                            margin: const EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getProportionateHeight(71.sp),
                    ),
                    SizedBox(
                      width: getProportionateWidth(300.sp),
                      child: CreateCustomButton(
                        text: '',
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ));
                        },
                        buttonColor: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            //mainAxisSize: MainAxisSize.min,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen(),
                                      ));
                                },
                                elevation: 0,
                                heroTag: null,
                                backgroundColor: AppColors.primaryColor,
                                child:
                                    Image.asset('assets/images/sp_start.png'),
                              ),
                              SizedBox(
                                width: 28.sp,
                              ),
                              Text(
                                'Get Started',
                                style: AppTextStyle.buttonTitle.copyWith(
                                    color: AppColors.primaryColor,
                                    fontSize: 22),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
