import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:textile_app/Screens/Report/report_screen.dart';
import 'package:textile_app/controller/data_controller.dart';
import 'package:textile_app/utils/widget.dart';

class PurchaseOutstanding extends StatefulWidget {
  final String title;
  const PurchaseOutstanding({super.key, required this.title});

  @override
  State<PurchaseOutstanding> createState() => _PurchaseOutstandingState();
}

class _PurchaseOutstandingState extends State<PurchaseOutstanding> {
  String formattedDate =
      DateFormat('dd-MMM-yyyy hh:mm a').format(DateTime.now());
  final dataController controller = dataController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D5785),
        leading: TextButton(
          onPressed: () {
            Get.back();
          },
          child: SvgPicture.asset(
            "assets/svg/back.svg",
          ),
        ),
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.w),
            decoration: BoxDecoration(
              color: const Color(0xff0D5785),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20.r),
                bottomLeft: Radius.circular(20.r),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    getCustomFont("Last Synced:   ",
                        textColor: const Color(0xffffffff), textSize: 18.sp),
                    getCustomFont(formattedDate,
                        textColor: const Color(0xffffffff), textSize: 16.sp),
                  ],
                ),
                verticalSpace(10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 14.h, horizontal: 45.w),
                      decoration: BoxDecoration(
                          color: const Color(0xffffffff).withOpacity(0.1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          getCustomFont("Receivable",
                              textColor: const Color(0xffffffff),
                              textSize: 16.sp),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              getAssetWidget("rs.svg"),
                              getCustomFont(
                                "00.00",
                                textSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                textColor: const Color(0xffffffff),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    horizontalSpace(10.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 14.h, horizontal: 45.w),
                      decoration: BoxDecoration(
                          color: const Color(0xffffffff).withOpacity(0.1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          getCustomFont("Payable",
                              textColor: const Color(0xffffffff),
                              textSize: 16.sp),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              getAssetWidget("rs.svg"),
                              getCustomFont(
                                "00.00",
                                textSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                textColor: const Color(0xffffffff),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                verticalSpace(9.h),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.h),
                  decoration: BoxDecoration(
                      color: const Color(0xffffffff).withOpacity(0.1),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      getAssetWidget("rs.svg"),
                      getCustomFont(
                        "00.00",
                        textSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        textColor: const Color(0xffffffff),
                      ),
                      getCustomFont(
                        " Rec.",
                        textSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        textColor: const Color(0xffffffff),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                itemCount: controller.imagelist.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10.0, // Vertical spacing between items
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 1.3,
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(ReportScreen(
                        title: controller.companyList[index].title,
                      ));
                    },
                    child: customItem(
                        imageName: controller.imagelist[index].images!,
                        title: controller.imagelist[index].title),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget customItem({
    required String imageName,
    required String title,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffDDF2FF),
        borderRadius: BorderRadius.circular(15.1),
        border: Border.all(
          width: 2,
          color: const Color(0xff0D5785),
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                getAssetWidget(imageName),
                getCustomFont(title),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Padding(padding: EdgeInsets.all(50)),
                getAssetWidget("arrow.svg"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
