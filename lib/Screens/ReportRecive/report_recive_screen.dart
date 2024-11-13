import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:textile_app/Screens/InvoiseList/invoice_list_screen.dart';
import 'package:textile_app/controller/data_controller.dart';
import 'package:textile_app/utils/widget.dart';
import 'package:textile_app/widget/appbar.dart';
import 'package:textile_app/widget/search_bar.dart';

class ReportReciveScreen extends StatefulWidget {
  final String title;
  final String startDate;
  final String endDate;

  ReportReciveScreen(
      {super.key,
      required this.title,
      required this.startDate,
      required this.endDate});

  @override
  State<ReportReciveScreen> createState() => _ReportReciveScreenState();
}

class _ReportReciveScreenState extends State<ReportReciveScreen> {
  final dataController controller = Get.put(dataController());

  @override
  void initState() {
    super.initState();
    controller.filteredCompanyDetails = controller.companyDetails;
  }

  filterSearchResults(String query) {
    if (query.isEmpty) {
      setState(() {
        controller.filteredCompanyDetails = controller.companyDetails;
      });
    } else {
      setState(() {
        controller.filteredCompanyDetails =
            controller.companyDetails.where((company) {
          return company.title.toLowerCase().contains(query.toLowerCase()) ||
              company.address.toLowerCase().contains(query.toLowerCase());
        }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context, widget.title, false, null),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(10.h),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            color: Colors.grey[100],
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() => StatsItem(
                        title: 'Receivable',
                        value:
                            '₹${controller.receivable.value.toStringAsFixed(2)}',
                      )),
                  StatsItem(
                    title: 'Bill Type',
                    value: controller.billType.value,
                  ),
                  StatsItem(
                    title: 'Sort By',
                    value: controller.sortBy.value,
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
          Expanded(
            child: ListView.builder(
              itemCount: controller.filteredCompanyDetails.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(InvoiceListScreen(
                        title: widget.title,
                        endDate: widget.endDate,
                        startDate: widget.startDate,
                      ));
                    },
                    child: AccountCard(
                      companyName:
                          controller.filteredCompanyDetails[index].title,
                      address: controller.filteredCompanyDetails[index].address,
                      amount: controller.filteredCompanyDetails[index].balance,
                      onWhatsAppPressed: () {},
                      onCallPressed: () {},
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class StatsItem extends StatelessWidget {
  final String title;
  final String value;

  const StatsItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getCustomFont(title,
            textSize: 12.sp,
            fontWeight: FontWeight.w500,
            textColor: const Color(0xff7C7C7C)),
        getCustomFont(value,
            fontWeight: FontWeight.w500,
            textColor: const Color(0xff222222),
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
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffC1C1C1)),
          borderRadius: BorderRadius.circular(12.r),
          color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          right: 10,
        ),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
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
                getAssetWidget("wp_ic.svg"),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                ),
                getAssetWidget("call_ic.svg"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
