import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar customAppbar(BuildContext context, String title, bool active,
    void Function()? onPressed) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Color(0xff0D5785),
    leading: TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: SvgPicture.asset("assets/svg/back.svg")),
    title: Text(
      title,
      style: const TextStyle(color: Colors.white, fontSize: 18),
    ),
    actions: [
      active
          ? TextButton(
              onPressed: onPressed,
              child: SvgPicture.asset("assets/svg/pdf.svg"))
          : Container(),
    ],
  );
}
