import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:textile_app/utils/constant.dart';

Widget getAssetWidget(String imageName,
    {double? height, double? width, Color? color}) {
  return SvgPicture.asset(
    Constant.imagePath + imageName,
    height: height,
    width: width,
    color: color,
    fit: BoxFit.fill,
  );
}

Widget verticalSpace(double height) {
  return SizedBox(
    height: height,
  );
}

Widget horizontalSpace(double width) {
  return SizedBox(
    width: width,
  );
}

Widget getCustomFont(String text,
    {double? textSize,
    Color? textColor,
    FontWeight? fontWeight,
    int? maxline}) {
  return Text(
    text,
    style: TextStyle(
        fontSize: textSize,
        color: textColor,
        fontWeight: fontWeight,
        fontFamily: Constant.fontfamily),
    maxLines: maxline,
  );
}

Widget appBar(String text, {void Function()? onTap}) {
  return Container(
    height: 60,
    color: const Color(0xff0D5785),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              // Get.back();
            },
            child: getAssetWidget("back.svg", height: 26.h, width: 26.h),
          ),
          // horizontalSpace(89.h),
          getCustomFont(
            text,
            textColor: Colors.white,
            textSize: 20.sp,
            fontWeight: FontWeight.w400,
          ),
          const SizedBox(),
        ],
      ),
    ),
  );
}

Widget CustomSearchbar(String hintText, void Function(String)? onChanged) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.grey[100], // Background color
      borderRadius: BorderRadius.circular(12), // Rounded corners
    ),
    child: TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        // Hint text style
        border: InputBorder.none,
        // Remove the default border
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        // Padding inside the search bar
        prefixIcon: const Icon(Icons.search, color: Colors.grey), // Search icon
      ),
    ),
  );
}
