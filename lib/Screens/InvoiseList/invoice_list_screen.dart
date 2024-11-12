import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:textile_app/Screens/Calculate/calculate_screen.dart';
import 'package:textile_app/controller/data_controller.dart';
import 'package:textile_app/utils/widget.dart';

class InvoiceListScreen extends StatefulWidget {
  final String title;

  const InvoiceListScreen({super.key, required this.title});

  @override
  State<InvoiceListScreen> createState() => _InvoiceListScreenState();
}

class _InvoiceListScreenState extends State<InvoiceListScreen> {
  final dataController controller = Get.put(dataController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton: Align(
        alignment: const Alignment(0.9, 0.8), // X and Y alignment

        child: FloatingActionButton(
          backgroundColor: const Color(0xff0D5785),
          onPressed: () {
            Get.to(CalculateScreen(
              title: widget.title,
            ));
          },
          child: getAssetWidget("cals.svg"),
        ),
      ),
      body: Column(
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
                  getAssetWidget("pdf.svg"),
                ],
              ),
            ),
          ),
          verticalSpace(10.h),
          AccountCard(
            companyName: 'Varni Infotech',
            address:
                'Akshya Nagar 1st Block 1st Cross, Rammurthy nagar, Bangalore-560016',
            amount: '₹26,548,23.00',
            broker: "DIRECT",
            onWhatsAppPressed: () {},
            onCallPressed: () {},
            date: '10-09-2024',
          ),
          // verticalSpace(10.h),
          Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: CustomSearchbar(
                    'Search Account...',
                    (value) => controller.updateSearchQuery(value),
                  ),
                ),
                Container(
                  width: 83.w,
                  height: 45.h,
                  decoration: BoxDecoration(
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
          Container(
            height: 40,
            color: const Color(0xff0D5785),
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  getCustomFont("Bill No",
                      fontWeight: FontWeight.w600,
                      textColor: Colors.white,
                      textSize: 15),
                  getCustomFont("Date",
                      fontWeight: FontWeight.w600,
                      textColor: Colors.white,
                      textSize: 15),
                  getCustomFont("Fix",
                      fontWeight: FontWeight.w600,
                      textColor: Colors.white,
                      textSize: 15),
                  getCustomFont("Due",
                      fontWeight: FontWeight.w600,
                      textColor: Colors.white,
                      textSize: 15),
                  getCustomFont("Amount",
                      fontWeight: FontWeight.w600,
                      textColor: Colors.white,
                      textSize: 15),
                ],
              ),
            ),
          ),
          Obx(
            () => Expanded(
              child: ListView.builder(
                itemCount: controller.invoices.length,
                itemBuilder: (context, index) {
                  var invoice = controller.invoices[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: const Color(0xff0D5785).withOpacity(0.1),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              Checkbox(
                                value: controller.isChecked[index],
                                activeColor: const Color(0xff0D5785),
                                onChanged: (value) {
                                  setState(() {
                                    controller.isChecked[index] =
                                        value ?? false;
                                  });
                                },
                              ),
                              Text(invoice['billNo']!),
                            ]),
                            Text(invoice['date']!),
                            Text(invoice['fix']!),
                            Text(invoice['due']!),
                            Text(invoice['amount']!),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            color: const Color(0xff0D5785),
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Bills: 01', style: TextStyle(color: Colors.white)),
                Text('Onty: 507', style: TextStyle(color: Colors.white)),
                Text('₹7,293.00', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    ));
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
    return SizedBox(
      height: 122.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
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
          ),
        ],
      ),
    );
  }
}
