import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:textile_app/controller/data_controller.dart';
import 'package:textile_app/utils/widget.dart';
import 'package:textile_app/widget/appbar.dart';
import 'package:textile_app/widget/custom_item.dart';
import 'package:textile_app/widget/search_bar.dart';

class CompanyDetailsScreen extends StatefulWidget {
  const CompanyDetailsScreen({super.key});

  @override
  State<CompanyDetailsScreen> createState() => _CompanyDetailsScreenState();
}

class _CompanyDetailsScreenState extends State<CompanyDetailsScreen> {
  dataController controller = Get.put(dataController());
  TextEditingController searchController = TextEditingController();

  filterSearchResults(String query) {
    if (query.isEmpty) {
      setState(() {
        controller.filteredBalanceDetails = controller.balancelist;
      });
    } else {
      setState(() {
        controller.filteredBalanceDetails =
            controller.balancelist.where((Balance) {
          return Balance.title.toLowerCase().contains(query.toLowerCase()) ||
              Balance.balance.toLowerCase().contains(query.toLowerCase());
        }).toList();
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller.filteredBalanceDetails = controller.balancelist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context, "Munjapara Fabrics(03)", false, null),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12),
        child: Column(
          children: [
            CustomeSearchbar(
              controller: searchController,
              onSearchChanged: (p0) =>
                  filterSearchResults(searchController.text),
            ),
            verticalSpace(10.h),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffC1C1C1)),
                  borderRadius: BorderRadius.circular(12)),
              child: AccountCardDetails(
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
            verticalSpace(10.h),
            Expanded(
              child: ListView.builder(
                itemCount: controller.filteredBalanceDetails.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: customItem(
                      controller.filteredBalanceDetails[index].title,
                      controller.filteredBalanceDetails[index].balance,
                      "menu_ic.svg",
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AccountCardDetails extends StatelessWidget {
  final String companyName;
  final String address;
  final String amount;
  final String broker;
  final String date;
  final String number;
  final VoidCallback onWhatsAppPressed;
  final VoidCallback onCallPressed;

  const AccountCardDetails({
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Stack(alignment: Alignment.topRight, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getCustomFont(
              companyName,
              textColor: const Color(0xff0D5785),
              textSize: 15.sp,
              fontWeight: FontWeight.w600,
            ),
            getCustomFont(
              address,
              textColor: const Color(0xff686868),
              textSize: 12.sp,
            ),
            getCustomFont(
              number,
              textColor: const Color(0xff686868),
              textSize: 12.sp,
            ),
            Row(
              children: [
                getCustomFont(
                  "Broker :",
                  textColor: const Color(0xff686868),
                  textSize: 12.sp,
                ),
                getCustomFont(
                  broker,
                  textColor: const Color(0xff686868),
                  textSize: 13.sp,
                ),
              ],
            ),
            getCustomFont(
              amount,
              textColor: const Color(0xff222222),
              textSize: 15.sp,
            ),
          ],
        ),
        GestureDetector(
          onTapDown: (TapDownDetails details) async {
            final RenderBox overlay =
                Overlay.of(context).context.findRenderObject() as RenderBox;

            await showMenu(
              color: Colors.white,
              context: context,
              position: RelativeRect.fromRect(
                details.globalPosition & const Size(55, 55),
                Offset.zero & overlay.size,
              ),
              items: [
                PopupMenuItem(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: getAssetWidget(
                          "wp_ic.svg",
                          height: 35,
                          width: 35,
                        ),
                        onPressed: () {
                          Navigator.pop(context); // Close menu
                          // Add your logic here
                        },
                      ),
                      IconButton(
                        icon: getAssetWidget(
                          "call_ic.svg",
                          height: 35,
                          width: 35,
                        ),
                        onPressed: () {
                          Navigator.pop(context); // Close menu
                          // Add your logic here
                        },
                      ),
                      IconButton(
                        icon: getAssetWidget(
                          "forward ic.svg",
                          height: 35,
                          width: 35,
                        ),
                        onPressed: () {
                          Navigator.pop(context); // Close menu
                          // Add your logic here
                        },
                      ),
                      IconButton(
                        icon: getAssetWidget(
                          "location ic.svg",
                          height: 35,
                          width: 35,
                        ),
                        onPressed: () {
                          Navigator.pop(context); // Close menu
                          // Add your logic here
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          child: getAssetWidget("menu_ic.svg"),
        ),
      ]),
    );
  }
}
