import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:textile_app/Screens/Calculate/calculate_screen.dart';
import 'package:textile_app/controller/data_controller.dart';
import 'package:textile_app/utils/widget.dart';
import 'package:textile_app/widget/appbar.dart';
import 'package:textile_app/widget/search_bar.dart';

class CompanyQntyScreen extends StatefulWidget {
  final String startDate;
  final String endDate;
  const CompanyQntyScreen(
      {super.key, required this.startDate, required this.endDate});

  @override
  State<CompanyQntyScreen> createState() => _CompanyQntyScreenState();
}

class _CompanyQntyScreenState extends State<CompanyQntyScreen> {
  final dataController controller = Get.put(dataController());
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context, "Munjapara Fabrics", false, null),
      body: Column(
        children: [
          verticalSpace(10.h),
          Container(
            color: Colors.grey.shade100,
            height: 100.h,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const StatsItem(
                    sub: "This Month",
                    title: 'Total Nos',
                    value: '0.00',
                  ),
                  StatsItem(
                    sub: widget.startDate,
                    title: 'Total Qnty',
                    value: '0.00',
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 14),
                    child: Text("to"),
                  ),
                  StatsItem(
                    sub: widget.endDate,
                    title: '',
                    value: '',
                  ),
                ],
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: CustomeSearchbar(
                controller: searchController,
                onSearchChanged: (p0) {},
              )),
          Table(
            columnWidths: const {
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(1),
              3: FlexColumnWidth(1),
              4: FlexColumnWidth(1),
            },
            children: const [
              TableRow(
                decoration: BoxDecoration(color: Color(0xff0D5785)),
                children: [
                  SizedBox(
                    height: 35,
                    child: Center(
                      child: Text(
                        "BK",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                    child: Center(
                      child: Text("Bill No",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                    child: Center(
                      child: Text(
                        "Date",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                    child: Center(
                      child: Text("Qnty",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                    child: Center(
                      child: Text(
                        "Nos",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
