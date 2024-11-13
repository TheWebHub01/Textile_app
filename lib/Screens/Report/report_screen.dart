import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:textile_app/Screens/ReportRecive/report_recive_screen.dart';
import 'package:textile_app/utils/widget.dart';
import 'package:textile_app/widget/appbar.dart';
import 'package:textile_app/widget/custom_textfild.dart';

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
    return Scaffold(
      appBar: customAppbar(
        context,
        widget.title,
        false,
        () {},
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                customTextformfield(
                    "Enter Report On",
                    "",
                    reportOnController,
                    null,
                    labelText: false,
                    TextInputType.emailAddress,
                    false,
                    null,
                    null),
                verticalSpace(10.h),
                getCustomFont("Due Invoice Days",
                    textColor: const Color(0xff686868), textSize: 13.sp),
                verticalSpace(8.h),
                customTextformfield(
                    "Enter invoice days",
                    labelText: false,
                    "",
                    dueInvoiceDaysController,
                    null,
                    TextInputType.emailAddress,
                    false,
                    null,
                    null),
                verticalSpace(10.h),
                getCustomFont("Period",
                    textColor: const Color(0xff686868), textSize: 13.sp),
                verticalSpace(8.h),
                Row(
                  children: [
                    Expanded(
                      child: customTextformfield(
                        "Start Date",
                        labelText: false,
                        "",
                        startDateController,
                        null,
                        TextInputType.emailAddress,
                        false,
                        null,
                        null,
                        readOnly: true,
                        onTap: () => _selectDate(context, startDateController),
                      ),
                    ),
                    horizontalSpace(10.w),
                    getCustomFont("to",
                        textColor: const Color(0xff9A9A9A), textSize: 17.sp),
                    horizontalSpace(10.w),
                    Expanded(
                      child: customTextformfield(
                        "end Date",
                        labelText: false,
                        "",
                        endDateController,
                        null,
                        TextInputType.emailAddress,
                        false,
                        null,
                        null,
                        readOnly: true,
                        onTap: () => _selectDate(context, endDateController),
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
                    Get.to(ReportReciveScreen(
                      title: modifiedText,
                      startDate: startDateController.text,
                      endDate: endDateController.text,
                    ));
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
    );
  }
}
