import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:textile_app/Screens/chart/chart_screen.dart';
import 'package:textile_app/controller/data_controller.dart';
import 'package:textile_app/utils/widget.dart';
import 'package:textile_app/widget/search_bar.dart';

class CalculateScreen extends StatefulWidget {
  final String title;
  final String startDate;
  final String endDate;

  CalculateScreen(
      {super.key,
      required this.title,
      required this.startDate,
      required this.endDate});

  @override
  State<CalculateScreen> createState() => _CalculateScreenState();
}

class _CalculateScreenState extends State<CalculateScreen> {
  final dataController controller = Get.put(dataController());

  void filterSearchResults(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredInvoices.value = controller.invoices;
      });
    } else {
      setState(() {
        filteredInvoices.value = controller.invoices.where((invoice) {
          return (invoice['billNo'] as String)
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              (invoice['date'] as String)
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              (invoice['amount'] as String)
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              (invoice['fix'] as String)
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              (invoice['due'] as String)
                  .toLowerCase()
                  .contains(query.toLowerCase());
        }).toList();
      });
    }
  }

  var filteredInvoices = [].obs;
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    filteredInvoices.value = controller.invoices;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff0D5785),
        leading: TextButton(
          onPressed: () {
            Get.back();
          },
          child: getAssetWidget("back.svg"),
        ),
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Get.to(const PurchaseAnalysisScreen());
              },
              child: getAssetWidget("chart.svg")),
          horizontalSpace(8.w),
          getAssetWidget("pdf.svg"),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  Obx(() => StatsItem(
                        sub: "This Month",
                        title: 'Receivable',
                        value:
                            '₹${controller.receivable.value.toStringAsFixed(2)}',
                      )),
                  StatsItem(
                    sub: widget.startDate,
                    title: 'Bill Type',
                    value: 'All',
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 14),
                    child: Text("to"),
                  ),
                  StatsItem(
                    sub: widget.endDate,
                    title: 'Sort By',
                    value: 'Party Asc',
                  ),
                ],
              ),
            ),
          ),
          verticalSpace(10.h),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: CustomeSearchbar(
                controller: controller.searchController,
                onSearchChanged: (p0) =>
                    filterSearchResults(controller.searchController.text),
              )),
          verticalSpace(10.h),
          Table(
            columnWidths: const {
              0: FlexColumnWidth(1.2),
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
                        "Amount",
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
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: filteredInvoices.value.length,
                itemBuilder: (context, index) {
                  var invoice = filteredInvoices.value[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Table(
                          columnWidths: const {
                            0: FlexColumnWidth(1.2),
                            1: FlexColumnWidth(1),
                            2: FlexColumnWidth(1),
                            3: FlexColumnWidth(1),
                            4: FlexColumnWidth(1),
                          },
                          children: [
                            TableRow(
                              decoration: BoxDecoration(
                                  color:
                                      const Color(0xff0D5785).withOpacity(0.1)),
                              children: [
                                SizedBox(
                                  height: 35,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Checkbox(
                                        value: invoice['chack'] == 'true',
                                        onChanged: (value) {
                                          setState(() {
                                            invoice['chack'] = value == true
                                                ? 'true'
                                                : 'false';
                                            print(
                                                "invoice['chack']: => ${invoice['chack']}");
                                          });
                                        },
                                        checkColor: Colors.white,
                                        shape: const RoundedRectangleBorder(),
                                        side: const BorderSide(
                                            color: Color(0xff494949), width: 1),
                                      ),
                                      Text(
                                        "${invoice['billNo']!}",
                                        style: const TextStyle(
                                            color: Color(0xff494949)),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 35,
                                  child: Center(
                                    child: Text(
                                      "${invoice['fix']!}",
                                      style: const TextStyle(
                                          color: Color(0xff494949)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 35,
                                  child: Center(
                                    child: Text("${invoice['date']!}",
                                        style: const TextStyle(
                                          color: Color(0xff494949),
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  height: 35,
                                  child: Center(
                                    child: Text("${invoice['due']!}",
                                        style: const TextStyle(
                                          color: Color(0xff494949),
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  height: 35,
                                  child: Center(
                                    child: Text(
                                      "${invoice['amount']!}",
                                      style: const TextStyle(
                                          color: Color(0xff494949)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class StatsItem extends StatelessWidget {
  final String title;
  final String sub;
  final String value;

  const StatsItem(
      {super.key, required this.title, required this.value, required this.sub});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getCustomFont(sub,
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
