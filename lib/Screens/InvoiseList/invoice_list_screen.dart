import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:textile_app/Screens/Calculate/calculate_screen.dart';
import 'package:textile_app/controller/data_controller.dart';
import 'package:textile_app/utils/widget.dart';
import 'package:textile_app/widget/appbar.dart';
import 'package:textile_app/widget/search_bar.dart';

class InvoiceListScreen extends StatefulWidget {
  final String title;
  final String startDate;
  final String endDate;

  const InvoiceListScreen(
      {super.key,
      required this.title,
      required this.startDate,
      required this.endDate});

  @override
  State<InvoiceListScreen> createState() => _InvoiceListScreenState();
}

class _InvoiceListScreenState extends State<InvoiceListScreen> {
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
      appBar: customAppbar(
        context,
        widget.title,
        true,
        () {},
      ),
      floatingActionButton: Align(
        alignment: const Alignment(0.9, 0.9),
        child: FloatingActionButton(
          backgroundColor: const Color(0xff0D5785),
          onPressed: () {
            Get.to(CalculateScreen(
              title: widget.title,
              endDate: widget.endDate,
              startDate: widget.startDate,
            ));
          },
          child: getAssetWidget("cals.svg"),
        ),
      ),
      body: Column(
        children: [
          verticalSpace(10.h),
          AccountCard(
            companyName: 'Varni Infotech',
            address:
                'Akshya Nagar 1st Block 1st Cross, Rammurthy nagar, Bangalore-560016',
            amount: '₹26,548,23.00',
            broker: "DIRECT",
            onWhatsAppPressed: () {},
            onCallPressed: () {},
            date: widget.startDate,
          ),
          verticalSpace(10.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Expanded(
                    child: CustomeSearchbar(
                  controller: searchController,
                  onSearchChanged: (p0) =>
                      filterSearchResults(searchController.text),
                )),
                horizontalSpace(10),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xffF6F6F6),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: getCustomFont("All",
                          textColor: const Color(0xff717171),
                          fontWeight: FontWeight.w600)),
                )
              ],
            ),
          ),
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
                        "Bill No",
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
                      child: Text("Date",
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
                        "Fix",
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
                      child: Text("Due",
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
                  // var invoice = controller.invoices[index];
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
                                    child: Text("${invoice['date']!}",
                                        style: const TextStyle(
                                          color: Color(0xff494949),
                                        )),
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
          ),
          Table(
            columnWidths: const {
              0: FlexColumnWidth(1.2),
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(1),
            },
            children: const [
              TableRow(
                decoration: BoxDecoration(color: Color(0xff0D5785)),
                children: [
                  SizedBox(
                    height: 35,
                    child: Center(
                      child: Text(
                        "Bills: 01",
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
                      child: Text("Onty: 507",
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
                        "₹7,293.00",
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

class AccountCard extends StatelessWidget {
  final String companyName;
  final String address;
  final String amount;
  final String broker;
  final String date;
  final VoidCallback onWhatsAppPressed;
  final VoidCallback onCallPressed;

  const AccountCard({
    super.key,
    required this.companyName,
    required this.address,
    required this.amount,
    required this.onWhatsAppPressed,
    required this.onCallPressed,
    required this.broker,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffF6F6F6),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
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
                      textSize: 12.sp,
                      fontWeight: FontWeight.w400),
                  Row(
                    children: [
                      getCustomFont("Broker :",
                          textColor: const Color(0xff686868),
                          textSize: 12.sp,
                          fontWeight: FontWeight.w400),
                      getCustomFont(broker,
                          textColor: const Color(0xff686868),
                          textSize: 13.sp,
                          fontWeight: FontWeight.w500),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getCustomFont("total Price",
                              textColor: const Color(0xff686868),
                              textSize: 12.sp,
                              fontWeight: FontWeight.w400),
                          getCustomFont(amount,
                              textColor: const Color(0xff222222),
                              textSize: 15.sp,
                              fontWeight: FontWeight.w500),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getCustomFont("Last Payment Date",
                              textColor: const Color(0xff686868),
                              textSize: 12.sp,
                              fontWeight: FontWeight.w400),
                          getCustomFont(date,
                              textColor: const Color(0xff222222),
                              textSize: 15.sp,
                              fontWeight: FontWeight.w500),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
