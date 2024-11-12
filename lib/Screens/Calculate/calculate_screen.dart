import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:textile_app/controller/data_controller.dart';
import 'package:textile_app/utils/widget.dart';

class CalculateScreen extends StatelessWidget {
  final String title;
  final dataController controller = Get.put(dataController());

  CalculateScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      title,
                      textColor: Colors.white,
                      textSize: 19.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    Row(
                      children: [
                        getAssetWidget("chart.svg"),
                        horizontalSpace(8.w),
                        getAssetWidget("pdf.svg"),
                      ],
                    )
                  ],
                ),
              ),
            ),
            verticalSpace(20.h),
            Column(
              children: [
                Container(
                  color: Colors.grey[100],
                  height: 100.h,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() => StatsItem(
                              title: 'Receivable',
                              value:
                                  '₹${controller.receivable.value.toStringAsFixed(2)}',
                            )),
                        const StatsItem(
                          title: 'Bill Type',
                          value: 'All',
                        ),
                        const StatsItem(
                          title: 'Sort By',
                          value: 'Party Asc',
                        ),
                      ],
                    ),
                  ),
                ),
                verticalSpace(10.h),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                  child: CustomSearchbar(
                    'Search Account...',
                    (value) => controller.updateSearchQuery(value),
                  ),
                ),
                verticalSpace(10.h),
                // const SizedBox(height: 16),
                Container(
                  height: 40,
                  color: const Color(0xff0D5785),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getCustomFont("BK",
                            fontWeight: FontWeight.w600,
                            textColor: Colors.white,
                            textSize: 15),
                        getCustomFont("Bill No",
                            fontWeight: FontWeight.w600,
                            textColor: Colors.white,
                            textSize: 15),
                        getCustomFont("Date",
                            fontWeight: FontWeight.w600,
                            textColor: Colors.white,
                            textSize: 15),
                        getCustomFont("Qnty",
                            fontWeight: FontWeight.w600,
                            textColor: Colors.white,
                            textSize: 15),
                        getCustomFont("Amount",
                            fontWeight: FontWeight.w600,
                            textColor: Colors.white,
                            textSize: 15),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class StatsItem extends StatelessWidget {
  final String title;
  final String value;

  const StatsItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getCustomFont(title,
            textSize: 14.sp,
            fontWeight: FontWeight.w500,
            textColor: const Color(0xff222222)),
        getCustomFont(title,
            textSize: 12.sp,
            fontWeight: FontWeight.w400,
            textColor: const Color(0xff7C7C7C)),
        getCustomFont(value,
            textColor: const Color(0xff222222),
            fontWeight: FontWeight.w500,
            textSize: 15.sp),
      ],
    );
  }
}

class AccountCard extends StatelessWidget {
  final String companyName;
  final String address;
  final String amount;
  final VoidCallback onWhatsAppPressed;
  final VoidCallback onCallPressed;

  const AccountCard({
    super.key,
    required this.companyName,
    required this.address,
    required this.amount,
    required this.onWhatsAppPressed,
    required this.onCallPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h,
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffC1C1C1)),
          borderRadius: BorderRadius.circular(12.r),
          color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 10, top: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getCustomFont(companyName,
                      textColor: const Color(0xff0D5785),
                      textSize: 15.sp,
                      fontWeight: FontWeight.w600),
                  getCustomFont(address,
                      textColor: const Color(0xff686868),
                      textSize: 14.sp,
                      fontWeight: FontWeight.w400),
                  getCustomFont(amount,
                      textColor: const Color(0xff222222),
                      textSize: 15.sp,
                      fontWeight: FontWeight.w500),
                ],
              ),
            ),
            Column(
              children: [
                verticalSpace(10),
                getAssetWidget("wp_ic.svg"),
                verticalSpace(10),
                getAssetWidget("call_ic.svg"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
