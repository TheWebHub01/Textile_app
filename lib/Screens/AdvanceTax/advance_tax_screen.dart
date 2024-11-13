import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:textile_app/controller/data_controller.dart';
import 'package:textile_app/utils/widget.dart';
import 'package:textile_app/widget/appbar.dart';

class AdvanceTaxScreen extends StatelessWidget {
  AdvanceTaxScreen({super.key});
  final dataController dateRangeController = Get.put(dataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        context,
        "Advance Tax",
        true,
        () {},
      ),
      body: Column(
        children: [
          verticalSpace(5.h),
          Container(
            color: Colors.black.withOpacity(0.1),
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
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
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xffC1C1C1))),
              child: ListTile(
                title: getCustomFont("Opening Balance",
                    textColor: const Color(0xff0d5785),
                    textSize: 15.sp,
                    fontWeight: FontWeight.w600),
                subtitle: getCustomFont("₹ 69,000.00 Dr",
                    textColor: const Color(0xff222222),
                    textSize: 15.sp,
                    fontWeight: FontWeight.w500),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    getCustomFont("Debit",
                        textSize: 13.sp, textColor: const Color(0xff009914)),
                    getCustomFont("Credit",
                        textSize: 13.sp, textColor: const Color(0xffF14336)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
