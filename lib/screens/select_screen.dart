import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/custom_button.dart';
import 'register.dart';

class SelectScreen extends StatefulWidget {
  const SelectScreen({super.key});

  @override
  State<SelectScreen> createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
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
            articleName: 'continue',
            dir: () {
              Future.delayed(const Duration(seconds: 4), () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()));
              });
            },
            isSelected: !isSelected,
          ),
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "MiniLearn",
            style: TextStyle(
                color: Colors.purple,
                fontSize: 24.sp,
                fontWeight: FontWeight.w600),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.all(12.r),
              child: GestureDetector(
                onTap: () {
                  print("pressed");
                },
                child: Text(
                  "Log in",
                  style: TextStyle(color: Colors.purple, fontSize: 18.sp),
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(14.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pick Topic To Start Reading.....",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 36.h,
                ),
                Wrap(
                  spacing: 12.w,
                  runSpacing: 28.h,
                  children: [
                    selectArticle("UI Design", () {
                      selectedFunc(0); // Pass the index of the button clicked
                    }, isSelectedList[0]),
                    selectArticle("Ux Design", () {
                      selectedFunc(1); // Pass the index of the button clicked
                    }, isSelectedList[1]),
                    selectArticle("Blog Design", () {
                      selectedFunc(2); // Pass the index of the button clicked
                    }, isSelectedList[2]),
                    selectArticle("Visual Design", () {
                      selectedFunc(3); // Pass the index of the button clicked
                    }, isSelectedList[3]),
                    selectArticle("Motion", () {
                      selectedFunc(4); // Pass the index of the button clicked
                    }, isSelectedList[4]),
                    selectArticle("Graphics", () {
                      selectedFunc(5); // Pass the index of the button clicked
                    }, isSelectedList[5]),
                    selectArticle("TypoGraphy", () {
                      selectedFunc(6); // Pass the index of the button clicked
                    }, isSelectedList[6]),
                    selectArticle("3d", () {
                      selectedFunc(7); // Pass the index of the button clicked
                    }, isSelectedList[7]),
                    selectArticle("Icon", () {
                      selectedFunc(8); // Pass the index of the button clicked
                    }, isSelectedList[8]),
                    selectArticle("News", () {
                      selectedFunc(9); // Pass the index of the button clicked
                    }, isSelectedList[9]),
                    selectArticle("Business", () {
                      selectedFunc(10); // Pass the index of the button clicked
                    }, isSelectedList[10]),
                    selectArticle("Sports", () {
                      selectedFunc(11); // Pass the index of the button clicked
                    }, isSelectedList[11]),
                    selectArticle("Fashion", () {
                      selectedFunc(12); // Pass the index of the button clicked
                    }, isSelectedList[12]),
                    selectArticle("Technology", () {
                      selectedFunc(13); // Pass the index of the button clicked
                    }, isSelectedList[13]),
                    selectArticle("Health", () {
                      selectedFunc(14); // Pass the index of the button clicked
                    }, isSelectedList[14]),
                    selectArticle("Shopping", () {
                      selectedFunc(15); // Pass the index of the button clicked
                    }, isSelectedList[15]),
                    selectArticle("Music", () {
                      selectedFunc(16); // Pass the index of the button clicked
                    }, isSelectedList[16]),
                    selectArticle("Recipe", () {
                      selectedFunc(17); // Pass the index of the button clicked
                    }, isSelectedList[17]),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Widget selectArticle(
      String articleName, VoidCallback onPressed, bool isSelected) {
    Color bgC = isSelected ? Colors.cyan.withOpacity(0.2) : Colors.cyan;

    return Container(
      height: 40.h,
      decoration: BoxDecoration(
        color: bgC,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          articleName,
          style: TextStyle(
              color: Colors.black54,
              fontSize: 18.sp,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
