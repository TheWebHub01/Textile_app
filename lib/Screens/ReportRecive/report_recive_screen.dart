import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:textile_app/Screens/InvoiseList/invoice_list_screen.dart';
import 'package:textile_app/controller/data_controller.dart';
import 'package:textile_app/utils/widget.dart';

class ReportReciveScreen extends StatelessWidget {
  final String title;
  final dataController controller = Get.put(dataController());

  ReportReciveScreen({super.key, required this.title});

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
                    const SizedBox(),
                  ],
                ),
              ),
            ),

            // Stats section
            Column(
              children: [
                Container(
                  color: Colors.grey[100],
                  height: 60.h,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
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
                // const SizedBox(height: 16),
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
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(InvoiceListScreen(
                        title: title,
                      ));
                    },
                    child: AccountCard(
                      companyName: 'Varni Infotech',
                      address:
                          'Akshya Nagar 1st Block 1st Cross, Rammurthy nagar, Bangalore-560016',
                      amount: '₹26,548,23.00',
                      onWhatsAppPressed: () {},
                      onCallPressed: () {},
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
      children: [
        getCustomFont(title,
            textSize: 12.sp,
            fontWeight: FontWeight.w500,
            textColor: const Color(0xff7C7C7C)),
        getCustomFont(value,
            fontWeight: FontWeight.w500,
            textColor: const Color(0xff222222),
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
