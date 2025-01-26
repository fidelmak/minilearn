import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String price;
  final Widget actionButton;

  const ProductTile({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
    required this.actionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.sp),
        side: BorderSide(
          color: Colors.grey,
          width: 0.2.sp,
        ),
      ),
      color: Colors.grey,
      elevation: 0.0,
      margin: EdgeInsets.symmetric(vertical: 8.0.sp, horizontal: 8.0.sp),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(0, -4.sp),
              blurRadius: 6.0.sp,
              spreadRadius: 1.0.sp,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(0, 4.sp),
              blurRadius: 6.0.sp,
              spreadRadius: 1.0.sp,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImageSection(),
            SizedBox(width: 8.0.sp),
            Expanded(child: _buildTextSection()),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSection() {
    return Container(
      width: 120.0.sp,
      height: 130.0.sp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.0.sp),
          bottomLeft: Radius.circular(8.0.sp),
        ),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildTextSection() {
    return Padding(
      padding: EdgeInsets.all(8.0.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            maxLines: 1,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0.sp,
            ),
          ),
          SizedBox(height: 8.0.sp),
          Text(
            description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14.0.sp,
              color: Colors.black54,
              fontFamily: "Roboto",
              height: 1.18,
            ),
          ),
          SizedBox(height: 4.0.sp),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '₦$price',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16.0.sp,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold,
                ),
              ),
              actionButton,
            ],
          ),
        ],
      ),
    );
  }
}
