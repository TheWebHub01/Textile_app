import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:textile_app/Screens/Login/login_screen.dart';
import 'package:textile_app/progress_loader/progress_loader.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    ProgressLoader pl = ProgressLoader(context, isDismissible: true);

    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            color: const Color(0xff0D5785),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Archie",
                        style:
                            TextStyle(fontSize: 22, color: Color(0xffFFFFFF)),
                      ),
                      GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: SvgPicture.asset(
                            "assets/svg/close.svg",
                            width: 30,
                            height: 30,
                          )),
                    ],
                  ),
                  const Text(
                    "Client Id - 35M102",
                    style: TextStyle(fontSize: 16, color: Color(0xffFFFFFF)),
                  ),
                  const Text(
                    "EFAS24",
                    style: TextStyle(fontSize: 16, color: Color(0xffFFFFFF)),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          drawerItem(
              context: context, title: "Home", image: "assets/svg/home.svg"),
          drawerItem(
              context: context,
              title: "Member",
              image: "assets/svg/member.svg"),
          drawerItem(
              context: context, title: "About", image: "assets/svg/about.svg"),
          drawerItem(
              context: context,
              title: "Support",
              image: "assets/svg/support.svg"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 280),
            child: GestureDetector(
              onTap: () async {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Logout",
                            style: TextStyle(fontSize: 25),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Are you sure you want to logout account?",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 50,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xffE1E1E1)),
                                  child: const Center(
                                    child: Text("No"),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  await pl.show();
                                  await _logout(context);
                                  await pl.hide();

                                  if (context.mounted) {
                                    Navigator.pop(context);
                                  }
                                },
                                child: Container(
                                  height: 50,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xff0D5785),
                                  ),
                                  child: const Center(
                                      child: Text(
                                    "Yes",
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                );
              },
              child: Container(
                height: 60,
                width: 200,
                decoration: BoxDecoration(
                    // border: Border.all(color: const Color(0xff0D5785)),
                    color: const Color(0xff0D5785),
                    borderRadius: BorderRadius.circular(13)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.login_outlined, color: Colors.white,
                      // color: Color(0xff0D5785),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Logout",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector drawerItem(
      {required BuildContext context,
      void Function()? onTap,
      required String image,
      required String title}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      image,
                      height: 20,
                      width: 20,
                    )),
                const SizedBox(width: 10),
                Text(
                  title,
                  style:
                      const TextStyle(fontSize: 16, color: Color(0xff8B8B8B)),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Divider(
              color: Color(0xffF1F1F1),
            ),
            const SizedBox(
              height: 5,
            )
          ],
        ),
      ),
    );
  }

  Future<void> _logout(BuildContext context) async {
    // await FacebookAuth.instance.logOut();
    // await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    await Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (Route<dynamic> route) => false,
    );
  }
}
