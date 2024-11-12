import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:textile_app/utils/widget.dart';

class CompanyDetailsScreen extends StatefulWidget {
  const CompanyDetailsScreen({super.key});

  @override
  State<CompanyDetailsScreen> createState() => _CompanyDetailsScreenState();
}

class _CompanyDetailsScreenState extends State<CompanyDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
                    onTap: () {},
                    child:
                        getAssetWidget("back.svg", height: 26.h, width: 26.h),
                  ),
                  getCustomFont(
                    "Munjapara Fabrics(03)",
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
            padding: const EdgeInsets.all(8.0),
            child: CustomSearchbar(
              "Search Account...",
              (p0) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffC1C1C1)),
                  borderRadius: BorderRadius.circular(12)),
              child: AccountCard(
                companyName: 'Varni Infotech',
                address:
                    'Akshya Nagar 1st Block 1st Cross,\nRammurthy nagar, Bangalore-560016',
                amount: '₹26,548,23.00',
                broker: "DIRECT",
                onWhatsAppPressed: () {},
                onCallPressed: () {},
                date: '10-09-2024',
                number: '25DCE*********I',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 72.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffC1C1C1)),
                  borderRadius: BorderRadius.circular(10.r)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        getCustomFont("Varni Infotech",
                            textColor: const Color(0xff0D5785),
                            textSize: 15.sp,
                            fontWeight: FontWeight.w600),
                        Row(
                          children: [
                            getAssetWidget("rs.svg", color: Colors.black),
                            getCustomFont("69,000.00",
                                textSize: 15.sp, fontWeight: FontWeight.w500),
                          ],
                        ),
                      ],
                    ),
                    getAssetWidget("menu_ic.svg"),
                  ],
                ),
              ),
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
  final String number;
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
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getCustomFont(companyName,
                            textColor: const Color(0xff0D5785),
                            textSize: 15.sp,
                            fontWeight: FontWeight.w600),
                        GestureDetector(
                            onTap: () {}, child: getAssetWidget("menu_ic.svg"))
                      ]),
                  getCustomFont(address,
                      textColor: const Color(0xff686868),
                      textSize: 12.sp,
                      fontWeight: FontWeight.w400),
                  getCustomFont(number,
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
