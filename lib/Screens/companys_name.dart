import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:textile_app/Screens/Report/report_screen.dart';
import 'package:textile_app/controller/data_controller.dart';
import 'package:textile_app/utils/widget.dart';

class CompanysNameScreen extends StatefulWidget {
  const CompanysNameScreen({super.key});

  @override
  State<CompanysNameScreen> createState() => _CompanysNameScreenState();
}

class _CompanysNameScreenState extends State<CompanysNameScreen> {
  final dataController controller = dataController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xff0D5785),
        child: getAssetWidget('float.svg'),
      ),
      body: Column(
        children: [
          Container(
            height: 60,
            color: const Color(0xff0D5785),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child:
                        getAssetWidget("drawer.svg", height: 26.h, width: 26.h),
                  ),
                  getCustomFont(
                    "TheWebHub",
                    textColor: Colors.white,
                    textSize: 19.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  getCustomFont(
                    "V2.34",
                    textColor: Colors.white,
                    textSize: 15.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  // const SizedBox(),
                ],
              ),
            ),
          ),
          verticalSpace(20.h),
          Expanded(
            child: ListView.builder(
              itemCount: controller.companyList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(ReportScreen(
                        title: controller.companyList[index].title,
                      ));
                    },
                    child: Container(
                      width: 335,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xffC1C1C1)),
                      ),
                      child: Row(
                        children: [
                          horizontalSpace(5.w),
                          getAssetWidget(controller.companyList[index].images!),
                          horizontalSpace(7.w),
                          getCustomFont(controller.companyList[index].title,
                              textSize: 14.sp,
                              textColor: const Color(0xff686868))
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ));
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home), //
            title: const Text('Home'),
            onTap: () {
              Get.back(); // Close the drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Get.back(); // Close the drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
