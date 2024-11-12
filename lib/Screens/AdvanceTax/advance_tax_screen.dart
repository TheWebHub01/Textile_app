import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:textile_app/controller/data_controller.dart';
import 'package:textile_app/utils/widget.dart';

class AdvanceTaxScreen extends StatelessWidget {
  final dataController dateRangeController = Get.put(dataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Advance Tax"),
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back),
      //     onPressed: () {
      //       // Navigate back
      //       Navigator.pop(context);
      //     },
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.picture_as_pdf),
      //       onPressed: () {
      //         // Implement PDF download functionality
      //       },
      //     ),
      //   ],
      // ),
      body: Column(
        children: [
          // Date Range Selector Row

          ///appbar
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
                    "Advance Tax",
                    textColor: Colors.white,
                    textSize: 19.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  // SizedBox(),
                  getAssetWidget("pdf.svg"),
                ],
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
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
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 70,
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
