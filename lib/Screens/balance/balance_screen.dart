import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:textile_app/controller/data_controller.dart';
import 'package:textile_app/utils/widget.dart';

class BalanceScreen extends StatefulWidget {
  const BalanceScreen({super.key});

  @override
  State<BalanceScreen> createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
  final dataController controller = Get.put(dataController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                      onTap: () {
                        Get.back();
                      },
                      child:
                          getAssetWidget("back.svg", height: 26.h, width: 26.h),
                    ),
                    getCustomFont(
                      "widget.title",
                      textColor: Colors.white,
                      textSize: 19.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(),
                    // getAssetWidget("pdf.svg"),
                  ],
                ),
              ),
            ),
            ListTile(
                leading: Checkbox(
                  value: controller.isChecked1,
                  activeColor: const Color(0xff0D5785),
                  onChanged: (value) {
                    setState(() {
                      controller.isChecked1 = value ?? false;
                    });
                  },
                ),
                title: getCustomFont("Skip 0 Balance?",
                    textColor: const Color(0xff494949))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomSearchbar(
                "Search Account...",
                (p0) {},
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.balancelist.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 72.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffC1C1C1)),
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                getCustomFont(
                                    controller.balancelist[index].title,
                                    textColor: const Color(0xff0D5785),
                                    textSize: 15.sp,
                                    fontWeight: FontWeight.w600),
                                Row(
                                  children: [
                                    getAssetWidget("rs.svg",
                                        color: Colors.black),
                                    getCustomFont(
                                        controller.balancelist[index].balance,
                                        textSize: 15.sp,
                                        fontWeight: FontWeight.w500),
                                  ],
                                ),
                              ],
                            ),
                            getAssetWidget("call_ic.svg"),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
