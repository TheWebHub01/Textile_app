import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
