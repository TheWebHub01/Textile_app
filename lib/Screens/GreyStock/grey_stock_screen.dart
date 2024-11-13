import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:textile_app/controller/data_controller.dart';
import 'package:textile_app/controller/stock_controller.dart';
import 'package:textile_app/utils/widget.dart';
import 'package:textile_app/widget/search_bar.dart';

class GreyStockScreen extends StatefulWidget {
  const GreyStockScreen({super.key});

  @override
  State<GreyStockScreen> createState() => _GreyStockScreenState();
}

class _GreyStockScreenState extends State<GreyStockScreen> {
  final StockController stockController = Get.put(StockController());
  final dataController controller = Get.put(dataController());
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 50.h,
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
                      "Grey Stock",
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  getCustomFont(
                    "This Financial Year",
                    textColor: const Color(0xff222222),
                    fontWeight: FontWeight.w500,
                    textSize: 14.sp,
                  ),
                  Obx(
                    () {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          getCustomFont(
                            stockController.startDate.value
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
                            stockController.endDate.value
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
            ListTile(
                leading: Checkbox(
                  value: stockController.isChecked1,
                  activeColor: const Color(0xff0D5785),
                  onChanged: (value) {
                    setState(() {
                      stockController.isChecked1 = value ?? false;
                    });
                  },
                ),
                title: getCustomFont("Skip 0 Balance?",
                    textColor: const Color(0xff494949))),

            CustomeSearchbar(
              controller: searchController,
              onSearchChanged: (p0) {},
            ),
            // Header Row
            Container(
              height: 40,
              color: const Color(0xff0D5785),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  getCustomFont("Opening",
                      fontWeight: FontWeight.w600,
                      textColor: const Color(0xffffffff),
                      textSize: 15.sp),
                  getCustomFont("Inward",
                      fontWeight: FontWeight.w600,
                      textColor: const Color(0xffffffff),
                      textSize: 15.sp),
                  getCustomFont("Outward",
                      fontWeight: FontWeight.w600,
                      textColor: const Color(0xffffffff),
                      textSize: 15.sp),
                  getCustomFont("Closing",
                      fontWeight: FontWeight.w600,
                      textColor: const Color(0xffffffff),
                      textSize: 15.sp),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: ListView(
                children: [
                  _buildStockSection("Title 01", 12, 1654.0, 33, 5414.0, 27,
                      4826.0, 18, 2242.0),
                  _buildStockSection(
                      "Title 02", 15, 2515.0, 76, 12083.0, 0, 0.0, 91, 14598.0),
                ],
              ),
            ),

            /// Footer Totals
            Container(
              height: 50.h,
              color: const Color(0xff0D5785),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("27",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp)),
                      Text("4169.000",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("109",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp)),
                      Text("17497.000",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("27",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp)),
                      Text("4826.000",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("109",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp)),
                      Text("16840.000",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStockSection(
      String title,
      int opening,
      double openingAmount,
      int inward,
      double inwardAmount,
      int outward,
      double outwardAmount,
      int closing,
      double closingAmount) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          color: const Color(0xffD3EEFF),
          padding: const EdgeInsets.all(8.0),
          child: getCustomFont(title,
              textSize: 14.sp,
              fontWeight: FontWeight.w600,
              textColor: const Color(0xff0D5785)),
        ),
        // Data row
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStockColumn(opening, openingAmount),
              _buildStockColumn(inward, inwardAmount, color: Colors.blue),
              _buildStockColumn(outward, outwardAmount, color: Colors.red),
              _buildStockColumn(closing, closingAmount, color: Colors.green),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStockColumn(int value, double amount, {Color? color}) {
    return Column(
      children: [
        getCustomFont(value.toString(),
            textColor: color ?? Colors.black,
            textSize: 12.sp,
            fontWeight: FontWeight.w500),
        getCustomFont(
          amount.toStringAsFixed(3),
          textColor: color ?? Colors.black,
          textSize: 12.sp,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}
