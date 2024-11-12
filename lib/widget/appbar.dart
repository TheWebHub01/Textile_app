import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar customAppbar(BuildContext context, String title, bool active,
    GlobalKey<ScaffoldState>? scaffoldkey) {
  return AppBar(
    centerTitle: true,
    leading: TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: SvgPicture.asset("assets/svg/back.svg")),
    title: Text(
      title,
      style: const TextStyle(color: Colors.black, fontSize: 18),
    ),
    actions: [
      active
          ? TextButton(
              onPressed: () {
                scaffoldkey!.currentState?.openDrawer();
              },
              child: SvgPicture.asset("assets/svg/filtter.svg"))
          : Container(),
    ],
  );
}
