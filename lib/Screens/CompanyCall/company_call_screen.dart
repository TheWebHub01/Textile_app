import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:textile_app/controller/data_controller.dart';
import 'package:textile_app/utils/widget.dart';
import 'package:textile_app/widget/appbar.dart';
import 'package:textile_app/widget/search_bar.dart';

class CompanyCallScreen extends StatefulWidget {
  const CompanyCallScreen({super.key});

  @override
  State<CompanyCallScreen> createState() => _CompanyCallScreenState();
}

class _CompanyCallScreenState extends State<CompanyCallScreen> {
  dataController controller = Get.put(dataController());

  filterSearchResults(String query) {
    if (query.isEmpty) {
      setState(() {
        controller.filteredCallDetails = controller.callList;
      });
    } else {
      setState(() {
        controller.filteredCallDetails = controller.callList.where((datamodel) {
          return datamodel.title.toLowerCase().contains(query.toLowerCase()) ||
              datamodel.images!.toLowerCase().contains(query.toLowerCase());
        }).toList();
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller.filteredCallDetails = controller.callList;
  }

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context, "Munjapara Fabrics (03)", false, null),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomeSearchbar(
                controller: searchController,
                onSearchChanged: (p0) =>
                    filterSearchResults(searchController.text),
              )),
          Expanded(
            child: ListView.builder(
              itemCount: controller.callList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xffC1C1C1))),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 15.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              getCustomFont(controller.callList[index].title,
                                  textColor: const Color(0xff0D5785),
                                  textSize: 15.sp,
                                  fontWeight: FontWeight.w600),
                              getCustomFont(controller.callList[index].images!),
                            ],
                          ),
                          Row(
                            children: [
                              getAssetWidget("wp_ic.svg"),
                              horizontalSpace(10.w),
                              getAssetWidget("call_ic.svg"),
                            ],
                          )
                        ],
                      ),
                    ),
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
