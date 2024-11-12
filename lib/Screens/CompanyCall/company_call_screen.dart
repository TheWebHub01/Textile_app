import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:textile_app/controller/data_controller.dart';
import 'package:textile_app/utils/widget.dart';

class CompanyCallScreen extends StatefulWidget {
  const CompanyCallScreen({super.key});

  @override
  State<CompanyCallScreen> createState() => _CompanyCallScreenState();
}

class _CompanyCallScreenState extends State<CompanyCallScreen> {
  dataController controller = Get.put(dataController());

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
                    "Munjapara Fabrics (03)",
                    textColor: Colors.white,
                    textSize: 19.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  const SizedBox(),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomSearchbar(
              "Search Account...",
              (p0) {},
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: controller.callList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 70.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xffC1C1C1))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            getCustomFont(controller.callList[index].title,
                                textColor: const Color(0xff0D5785),
                                textSize: 15.sp,
                                fontWeight: FontWeight.w600),
                            getCustomFont(controller.callList[index].images!),
                          ],
                        ),
                        Row(
                          children: [
                            getAssetWidget("wp_ic.svg"),
                            getAssetWidget("call_ic.svg"),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    ));
  }
}
