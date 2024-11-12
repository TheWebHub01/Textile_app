import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:textile_app/controller/data_controller.dart';
import 'package:textile_app/utils/widget.dart';

class PurchaseOutstanding extends StatefulWidget {
  const PurchaseOutstanding({super.key});

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
          onPressed: () {},
          child: SvgPicture.asset(
            "assets/svg/back.svg",
          ),
        ),
        centerTitle: true,
        title: const Text(
          "TheWebHub",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Container(
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
                  children: [
                    getCustomFont("Last Synced:",
                        textColor: const Color(0xffffffff), textSize: 18.sp),
                    getCustomFont(formattedDate,
                        textColor: const Color(0xffffffff), textSize: 16.sp),
                    SizedBox(width: 10.w)
                  ],
                ),
                verticalSpace(10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 75.h,
                      width: 180.w,
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
                    Container(
                      height: 75.h,
                      width: 158.w,
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
                  height: 45,
                  width: 350.w,
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
                verticalSpace(20.h),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: controller.imagelist.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 140.h, crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomItem(
                      imageName: controller.imagelist[index].images!,
                      title: controller.imagelist[index].title),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget CustomItem({
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
            padding: const EdgeInsets.only(left: 8.0, top: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getAssetWidget(imageName),
                getCustomFont(title),
              ],
            ),
          ),
          Positioned(
            bottom: 10, // Specify the position
            right: 10,
            child: getAssetWidget("arrow.svg"),
          ),
        ],
      ),
    );
  }
}
