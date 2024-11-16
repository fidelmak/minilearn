import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatefulWidget {
  final String articleName;
  bool isSelected; // This will hold the state for the button
  final VoidCallback dir;

  CustomButton({
    super.key,
    required this.articleName,
    required this.isSelected,
    required this.dir,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    // Use widget.isSelected instead of declaring a new variable
    Color bgC =
        widget.isSelected ? Colors.purple.withOpacity(0.2) : Colors.purple;

    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: bgC,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: TextButton(
        onPressed: () {
          setState(() {
            widget.isSelected = !widget.isSelected; // Toggle the state
          });
          widget.dir(); // Call the dir function (passed from parent)
        },
        child: Text(
          widget.articleName,
          style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
