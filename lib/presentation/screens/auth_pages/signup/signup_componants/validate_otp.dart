import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lifer_food/core/utils/app_textstyle.dart';
import 'package:lifer_food/core/utils/custom_buttons.dart';
import 'package:lifer_food/core/utils/res.dart';
import 'package:lifer_food/core/utils/size_config.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ValidateOtp extends StatefulWidget {
  final String phoneNumber;

  const ValidateOtp({
    super.key,
    required this.phoneNumber,
  });

  @override
  State<StatefulWidget> createState() => _ValidateOtpState();
}

class _ValidateOtpState extends State<ValidateOtp> {
  final otpCont = TextEditingController();

  int _timeRemaining = 120;
  late Timer _timer;
  bool isValidated = false;
  String bottomMsg1 = 'OTP verified';
  String bottomMsg2 = ' Successfully';

  @override
  void initState() {
    startCountDown();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          child: Container(
            height: 4,
            color: Colors.grey,
            margin: EdgeInsets.only(
                left: getWidth(context) * .35, right: getWidth(context) * .35),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(
              vertical: 10.sp, horizontal: getProportionateWidth(15.sp)),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Back'),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 8.sp),
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 42.sp,
                    width: 37.sp,
                  ),
                ),
              ],
            ),
            AutoSizeText(
              'Verify Phone Number',
              style: AppTextStyle.heading.copyWith(
                fontSize: 32,
              ),
              maxLines: 1,
            ),
            const AutoSizeText(
              'We have sent you a 6 digit code. Please enter here to Verify your Number.',
              maxLines: 2,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontFamily: 'Inter',
              ),
            ),
            SizedBox(height: getHeight(context) * .03,),

            PinCodeTextField(
              controller: otpCont,
              appContext: context,
              enableActiveFill: true,

              //backgroundColor: const Color(0xffEFF2F5),
              autoDisposeControllers: false,
              length: 6,
              onChanged: (value) {},
              keyboardType: TextInputType.number,
              textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.normal),
              pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  activeColor: const Color(0xffEFF2F5),
                  inactiveColor: const Color(0xffEFF2F5),
                  activeFillColor: const Color(0xffEFF2F5),
                  inactiveFillColor: const Color(0xffEFF2F5),
                  selectedFillColor: const Color(0xffEFF2F5),
                  fieldWidth: 50),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: getHeight(context) * .035),
              child: CreateGradientButton(
                  text: 'Validate Account',
                  onTap: () {
                    if (otpCont.text.length == 6) {
                      showSuccess();
                    } else {
                      //showSnackbar(context, 'Please Enter OTP first!');
                    }
                  },
                  width: getWidth(context) * .9),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  3,
                  (index) => Container(
                        height: 10,
                        width: 10,
                        margin: const EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: index == 1
                                ? Theme.of(context).primaryColor
                                : Colors.grey),
                      )),
            ),
            Container(
              margin: EdgeInsets.only(top: getHeight(context) * .035),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    style: const TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                          text:
                              isValidated ? bottomMsg1 : 'OTP Auto resend in '),
                      TextSpan(
                          text: isValidated ? bottomMsg2 : '$_timeRemaining',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: isValidated ? '.' : ' sec')
                    ]),
              ),
            ),
            Visibility(
              visible: isValidated,
              child: Container(
                margin:
                    EdgeInsets.symmetric(vertical: getHeight(context) * .03),
                child: const Center(
                  child: SpinKitFadingCircle(
                    color: Colors.blue,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  startCountDown() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_timeRemaining == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _timeRemaining--;
          });
        }
      },
    );
  }

  showSuccess() {
    setState(() {
      isValidated = true;
    });
    Timer(const Duration(seconds: 2), () {
      // widget.isSignup
      //     ? Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //             builder: (context) => const SignupAccountMode()))
      //     : Navigator.push(context,
      //         MaterialPageRoute(builder: (context) => const ChangePassword()));
    });
  }
}
