import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:textile_app/controller/data_controller.dart';
import 'package:textile_app/utils/widget.dart';
import 'package:textile_app/widget/appbar.dart';
import 'package:textile_app/widget/custom_item.dart';
import 'package:textile_app/widget/search_bar.dart';

class BalanceScreen extends StatefulWidget {
  const BalanceScreen({super.key});

  @override
  State<BalanceScreen> createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
  final dataController controller = Get.put(dataController());
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
    super.initState();
    controller.filteredBalanceDetails = controller.balancelist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context, "Munjapara Fabrics (03)", false, null),
      body: Column(
        children: [
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
          Expanded(
            child: ListView.builder(
              itemCount: controller.filteredBalanceDetails.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
                  child: customItem(
                    controller.filteredBalanceDetails[index].title,
                    controller.filteredBalanceDetails[index].balance,
                    controller.filteredBalanceDetails[index].images,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
