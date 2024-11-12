import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:textile_app/Screens/ReportRecive/report_recive_screen.dart';
import 'package:textile_app/utils/widget.dart';

class ReportScreen extends StatefulWidget {
  final String title;

  const ReportScreen({super.key, required this.title});

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  TextEditingController reportOnController = TextEditingController();
  TextEditingController dueInvoiceDaysController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    reportOnController.text = "Party Wise";
    dueInvoiceDaysController.text = "00";
    startDateController.text = "01-04-2024";
    endDateController.text = "01-09-2024";
  }

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        controller.text = DateFormat('dd-MM-yyyy').format(picked);
      });
    }
  }

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
                      widget.title,
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
              padding: EdgeInsets.only(left: 15.w, right: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(15.h),
                  Center(
                      child: getCustomFont("Outstanding Report",
                          textSize: 20.sp, textColor: const Color(0xff000000))),
                  verticalSpace(10.h),
                  getCustomFont("Report On",
                      textColor: const Color(0xff686868), textSize: 13.sp),
                  verticalSpace(8.h),
                  TextFormField(
                    controller: reportOnController,
                    decoration: const InputDecoration(
                        labelStyle: TextStyle(color: Color(0xff797979)),
                        hintText: 'Party Wise',
                        enabled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffCDCDCD)),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffCDCDCD)),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffCDCDCD)))),
                  ),
                  verticalSpace(10.h),
                  getCustomFont("Due Invoice Days",
                      textColor: const Color(0xff686868), textSize: 13.sp),
                  verticalSpace(8.h),
                  TextFormField(
                    controller: dueInvoiceDaysController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(color: Color(0xff797979)),
                      enabled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffCDCDCD)),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffCDCDCD)),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffCDCDCD),
                        ),
                      ),
                    ),
                  ),
                  verticalSpace(10.h),
                  getCustomFont("Period",
                      textColor: const Color(0xff686868), textSize: 13.sp),
                  verticalSpace(8.h),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          readOnly: true,
                          controller: startDateController,
                          keyboardType: TextInputType.number,
                          onTap: () =>
                              _selectDate(context, startDateController),
                          decoration: const InputDecoration(
                            labelStyle: TextStyle(color: Color(0xff797979)),
                            enabled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffCDCDCD)),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffCDCDCD)),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffCDCDCD),
                              ),
                            ),
                          ),
                        ),
                      ),
                      horizontalSpace(10.w),
                      getCustomFont("to",
                          textColor: const Color(0xff9A9A9A), textSize: 17.sp),
                      horizontalSpace(10.w),
                      Expanded(
                        child: TextFormField(
                          controller: endDateController,
                          readOnly: true,
                          onTap: () => _selectDate(context, endDateController),
                          decoration: const InputDecoration(
                            labelStyle: TextStyle(color: Color(0xff797979)),
                            enabled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffCDCDCD)),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffCDCDCD)),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffCDCDCD),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(40.h),
                  GestureDetector(
                    onTap: () {
                      String originalText = widget.title;
                      String modifiedText = originalText
                          .substring(0, originalText.indexOf('('))
                          .trim();
                      Get.to(ReportReciveScreen(title: modifiedText));
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.h),
                          color: const Color(0xff0D5785)),
                      child: getCustomFont("Generate Report",
                          fontWeight: FontWeight.w500,
                          textSize: 18.sp,
                          textColor: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
