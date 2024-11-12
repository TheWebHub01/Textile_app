import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:textile_app/controller/data_controller.dart';
import 'package:textile_app/utils/widget.dart';

class CompanyQntyScreen extends StatefulWidget {
  const CompanyQntyScreen({super.key});

  @override
  State<CompanyQntyScreen> createState() => _CompanyQntyScreenState();
}

class _CompanyQntyScreenState extends State<CompanyQntyScreen> {
  final dataController dateRangeController = Get.put(dataController());

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
                      onTap: () {},
                      child:
                          getAssetWidget("back.svg", height: 26.h, width: 26.h),
                    ),
                    getCustomFont(
                      "Munjapara Fabrics",
                      textColor: Colors.white,
                      textSize: 19.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(),
                  ],
                ),
              ),
            ),
            verticalSpace(20.h),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      getCustomFont("This Week",
                          textColor: const Color(0xff222222),
                          fontWeight: FontWeight.w500),
                      Obx(
                        () {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              getCustomFont(
                                dateRangeController.startDate.value
                                    .toString()
                                    .split(' ')[0],
                                fontWeight: FontWeight.w500,
                                textSize: 14.sp,
                                textColor: const Color(0xff222222),
                              ),
                              horizontalSpace(10.w),
                              getCustomFont(
                                "to",
                                fontWeight: FontWeight.w500,
                                textSize: 12.sp,
                                textColor: const Color(0xff222222),
                              ),
                              horizontalSpace(10.w),
                              getCustomFont(
                                dateRangeController.endDate.value
                                    .toString()
                                    .split(' ')[0],
                                fontWeight: FontWeight.w500,
                                textSize: 14.sp,
                                textColor: const Color(0xff222222),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          getCustomFont("Total Nos",
                              fontWeight: FontWeight.w400,
                              textColor: const Color(0xff686868),
                              textSize: 12.sp),
                          getCustomFont("0.00",
                              fontWeight: FontWeight.w500,
                              textColor: const Color(0xff222222),
                              textSize: 15.sp),
                          // Text("0.00"),
                        ],
                      ),
                      Column(
                        children: [
                          getCustomFont("Total Qnty",
                              fontWeight: FontWeight.w400,
                              textColor: const Color(0xff686868),
                              textSize: 12.sp),
                          getCustomFont("0.00",
                              fontWeight: FontWeight.w500,
                              textColor: const Color(0xff222222),
                              textSize: 15.sp),
                        ],
                      ),
                      const Column(
                        children: [],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomSearchbar(
                "Search Account...",
                (p0) {},
              ),
            ),
            Container(
              height: 40,
              color: const Color(0xff0D5785),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  getCustomFont("BK",
                      fontWeight: FontWeight.w600,
                      textColor: const Color(0xffffffff),
                      textSize: 15.sp),
                  getCustomFont("Chn No",
                      fontWeight: FontWeight.w600,
                      textColor: const Color(0xffffffff),
                      textSize: 15.sp),
                  getCustomFont("Date",
                      fontWeight: FontWeight.w600,
                      textColor: const Color(0xffffffff),
                      textSize: 15.sp),
                  getCustomFont("Qnty",
                      fontWeight: FontWeight.w600,
                      textColor: const Color(0xffffffff),
                      textSize: 15.sp),
                  getCustomFont("Nos",
                      fontWeight: FontWeight.w600,
                      textColor: const Color(0xffffffff),
                      textSize: 15.sp),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
