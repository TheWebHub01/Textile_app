import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:textile_app/utils/widget.dart';

Container customItem(
  String title,
  String balance,
  String image,
) {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffC1C1C1)),
        borderRadius: BorderRadius.circular(10.r)),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              getCustomFont(title,
                  textColor: const Color(0xff0D5785),
                  textSize: 15.sp,
                  fontWeight: FontWeight.w600),
              Row(
                children: [
                  getAssetWidget("rs.svg", color: Colors.black),
                  getCustomFont(balance,
                      textSize: 15.sp, fontWeight: FontWeight.w500),
                ],
              ),
            ],
          ),
          getAssetWidget(image),
        ],
      ),
    ),
  );
}
