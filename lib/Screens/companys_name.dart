import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:textile_app/Screens/Home/home_screen.dart';
import 'package:textile_app/controller/data_controller.dart';
import 'package:textile_app/progress_loader/progress_loader.dart';
import 'package:textile_app/utils/widget.dart';
import 'package:textile_app/widget/custom_drawer.dart';

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
    ProgressLoader pl = ProgressLoader(context, isDismissible: true);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff0D5785),
        leading: TextButton(
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            child: SvgPicture.asset("assets/svg/drawer.svg")),
        title: const Text(
          "TheWebHub",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        actions: [
          getCustomFont(
            "V2.34",
            textColor: Colors.white,
            textSize: 15.sp,
            fontWeight: FontWeight.w400,
          ),
          horizontalSpace(10.w),
        ],
      ),
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await pl.show();
          await controller.refreshCompanyList(); // Fetch the updated list
          await pl.hide();
          setState(() {});
        },
        backgroundColor: const Color(0xff0D5785),
        child: getAssetWidget('float.svg'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: controller.companyList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, bottom: 5, top: 10),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(PurchaseOutstanding(
                        title: controller.companyList[index].title,
                      ));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
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
    );
  }
}
