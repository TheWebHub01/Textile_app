import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:textile_app/controller/data_controller.dart';
import 'package:textile_app/controller/stock_controller.dart';
import 'package:textile_app/utils/widget.dart';
import 'package:textile_app/widget/appbar.dart';
import 'package:textile_app/widget/search_bar.dart';

class GreyStockScreen extends StatefulWidget {
  final String startDate;
  final String endDate;
  const GreyStockScreen(
      {super.key, required this.endDate, required this.startDate});

  @override
  State<GreyStockScreen> createState() => _GreyStockScreenState();
}

class _GreyStockScreenState extends State<GreyStockScreen> {
  final StockController stockController = Get.put(StockController());
  final dataController controller = Get.put(dataController());
  TextEditingController searchController = TextEditingController();

  void filterSearchResults(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredStock.value = controller.invoices;
      });
    } else {
      setState(() {
        filteredStock.value = stockController.stockData.where((stockData) {
          return (stockData['title'] as String)
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              (stockData['opening'] as String)
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              (stockData['inward'] as String)
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              (stockData['outward'] as String)
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              (stockData['closing'] as String)
                  .toLowerCase()
                  .contains(query.toLowerCase());
        }).toList();
      });
    }
  }

  var filteredStock = [].obs; // Observable list for filtered invoices

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filteredStock.value = stockController.stockData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context, "Grey Stock", false, null),
      body: Column(
        children: [
          verticalSpace(10.h),
          Container(
            color: Colors.black.withOpacity(0.1),
            padding: const EdgeInsets.symmetric(vertical: 14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                getCustomFont("This Financial Year",
                    textColor: const Color(0xff222222),
                    fontWeight: FontWeight.w500),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    getCustomFont(
                      widget.startDate,
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
                    // getCustomFont(
                    //   dateRangeController.endDate.value
                    //       .toString()
                    //       .split(' ')[0],
                    getCustomFont(
                      widget.endDate,
                      fontWeight: FontWeight.w500,
                      textSize: 14.sp,
                      textColor: const Color(0xff222222),
                    ),
                  ],
                ),
              ],
            ),
          ),

          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Row(
              children: [
                Checkbox(
                  value: controller.isChecked1,
                  activeColor: const Color(0xff0D5785),
                  onChanged: (value) {
                    setState(() {
                      controller.isChecked1 = value ?? false;
                    });
                  },
                ),
                getCustomFont(
                  "Skip 0 Balance?",
                  textColor: const Color(0xff494949),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: CustomeSearchbar(
              controller: searchController,
              onSearchChanged: (p0) =>
                  filterSearchResults(searchController.text),
            ),
          ),
          verticalSpace(10.h),
          Table(
            columnWidths: const {
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(1),
              3: FlexColumnWidth(1),
            },
            children: const [
              TableRow(
                decoration: BoxDecoration(color: Color(0xff0D5785)),
                children: [
                  SizedBox(
                    height: 35,
                    child: Center(
                      child: Text(
                        "Opening",
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
                      child: Text("Inward",
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
                        "Outward",
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
                      child: Text("Closing",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Obx(
            () => Expanded(
              child: ListView.builder(
                itemCount: filteredStock.length,
                itemBuilder: (context, index) {
                  var invoice = filteredStock[index];
                  return Column(
                    children: [
                      Table(
                        columnWidths: const {
                          0: FlexColumnWidth(1),
                          1: FlexColumnWidth(1),
                          2: FlexColumnWidth(1),
                          3: FlexColumnWidth(1),
                        },
                        children: [
                          TableRow(
                            decoration:
                                const BoxDecoration(color: Color(0xffD3EEFF)),
                            children: [
                              SizedBox(
                                height: 35,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("${invoice['title']}",
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                            color: Color(0xff494949),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Table(
                          columnWidths: const {
                            0: FlexColumnWidth(1.2),
                            1: FlexColumnWidth(1),
                            2: FlexColumnWidth(1),
                            3: FlexColumnWidth(1),
                          },
                          children: [
                            TableRow(
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.1)),
                              children: [
                                SizedBox(
                                  height: 80,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("${invoice['opening']}",
                                          style: const TextStyle(
                                            color: Color(0xff494949),
                                          )),
                                      Text("${invoice['openingAmount']}",
                                          style: const TextStyle(
                                            color: Color(0xff494949),
                                          )),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 80,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${invoice['inward']}",
                                        style: const TextStyle(
                                            color: Color(0xff494949)),
                                      ),
                                      Text(
                                        "${invoice['inwardAmount']}",
                                        style: const TextStyle(
                                            color: Color(0xff494949)),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 80,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("${invoice['outward']}",
                                          style: const TextStyle(
                                            color: Color(0xff009914),
                                          )),
                                      Text("${invoice['outwardAmount']}",
                                          style: const TextStyle(
                                            color: Color(0xff009914),
                                          )),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 80,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${invoice['closing']}",
                                        style: const TextStyle(
                                            color: Color(0xffF14336)),
                                      ),
                                      Text(
                                        "${invoice['closingAmount']}",
                                        style: const TextStyle(
                                            color: Color(0xffF14336)),
                                      ),
                                    ],
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
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Table(
              columnWidths: const {
                0: FlexColumnWidth(1.2),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(1),
                3: FlexColumnWidth(1),
              },
              children: const [
                TableRow(
                  decoration: BoxDecoration(color: Color(0xff0D5785)),
                  children: [
                    SizedBox(
                      height: 80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("27",
                              style: TextStyle(
                                color: Color(0xffFFFFFF),
                              )),
                          Text("4169.000",
                              style: TextStyle(
                                color: Color(0xffFFFFFF),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("27",
                              style: TextStyle(
                                color: Color(0xffFFFFFF),
                              )),
                          Text("4169.000",
                              style: TextStyle(
                                color: Color(0xffFFFFFF),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("27",
                              style: TextStyle(
                                color: Color(0xffFFFFFF),
                              )),
                          Text("4169.000",
                              style: TextStyle(
                                color: Color(0xffFFFFFF),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("27",
                              style: TextStyle(
                                color: Color(0xffFFFFFF),
                              )),
                          Text("4169.000",
                              style: TextStyle(
                                color: Color(0xffFFFFFF),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// Footer Totals
        ],
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
