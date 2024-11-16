import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/custom_button.dart';
import 'select_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _SelectScreenState();
}

class _SelectScreenState extends State<RegisterScreen> {
  List<bool> isSelectedList =
      List.filled(18, true); // 18 buttons, all initially unselected

  void selectedFunc(int index) {
    setState(() {
      isSelectedList[index] =
          !isSelectedList[index]; // Toggle only the clicked button
    });
  }

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(36.r),
          child: CustomButton(
            articleName: 'Go back',
            dir: () {
              Future.delayed(const Duration(seconds: 2), () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SelectScreen()));
              });
            },
            isSelected: !isSelected,
          ),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(14.r),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Text(
                  "We Are Preparing Something Great For You!...",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 72.h,
                ),
                selectArticle(
                  "Continue with Apple ",
                  () {},
                  Colors.black,
                ),
                SizedBox(
                  height: 18.h,
                ),
                selectArticle(
                  "Continue with Google ",
                  () {},
                  Colors.blue,
                ),
                SizedBox(
                  height: 18.h,
                ),
                selectArticle(
                  "Continue with Email ",
                  () {},
                  Colors.red,
                ),
                SizedBox(
                  height: 36.h,
                ),
                Wrap(
                  children: [
                    Text(
                      "Already have an Account? ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Log in",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                bottomText(),
              ],
            ),
          ),
        ));
  }

  Column bottomText() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.all(8.r),
            child: Text(
              "By continuing, you accepts the Terms of  Use ",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w200),
            ),
          ),
        ),
        Center(
          child: Text(
            "and Privacy Policy",
            style: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.w200),
          ),
        ),
      ],
    );
  }

  Widget selectArticle(String articleName, VoidCallback onPressed, color) {
    return Container(
      height: 60.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          articleName,
          style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
