import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:textile_app/controller/data_controller.dart';
import 'package:textile_app/utils/widget.dart';
import 'package:textile_app/widget/appbar.dart';
import 'package:textile_app/widget/search_bar.dart';

class CompanyGroupScreen extends StatefulWidget {
  const CompanyGroupScreen({super.key});

  @override
  State<CompanyGroupScreen> createState() => _CompanyGroupScreenState();
}

class _CompanyGroupScreenState extends State<CompanyGroupScreen> {
  dataController controller = Get.put(dataController());
  void filterSearchResults(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredCompanyDetails.value = controller.companyDetailsList;
      });
    } else {
      setState(() {
        filteredCompanyDetails.value =
            controller.companyDetailsList.where((companyDetailsList) {
          return (companyDetailsList['title'] as String)
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              (companyDetailsList['Pur Rate'] as String)
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              (companyDetailsList['Sale Rate'] as String)
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              (companyDetailsList['Unit'] as String)
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              (companyDetailsList['HSN'] as String)
                  .toLowerCase()
                  .contains(query.toLowerCase());
        }).toList();
      });
    }
  }

  var filteredCompanyDetails = [].obs;
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    filteredCompanyDetails.value = controller.companyDetailsList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context, "Munjapara Fabrics (03)", false, null),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10, left: 12.w, right: 12.w),
            child: CustomeSearchbar(
              controller: searchController,
              onSearchChanged: (p0) =>
                  filterSearchResults(searchController.text),
            ),
          ),
          Obx(
            () => Expanded(
              child: ListView.builder(
                itemCount: filteredCompanyDetails.length,
                itemBuilder: (context, index) {
                  var invoice = filteredCompanyDetails[index];
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.w),
                    child: Container(
                      height: 80.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color(0xffC1C1C1),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                getCustomFont(
                                  invoice['title']!,
                                  textColor: const Color(0xff0D5785),
                                  textSize: 15.sp,
                                ),
                                getCustomFont(
                                  "Pur Rate : ${invoice['Pur Rate']!} | Sale Rate : ${invoice['Sale Rate']}",
                                  textColor: const Color(0xff686868),
                                  textSize: 14.sp,
                                ),
                                getCustomFont(
                                  "Group : ${invoice['Group']!}",
                                  textColor: const Color(0xff686868),
                                  textSize: 14.sp,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                getCustomFont("HSN : ${invoice['HSN']!}",
                                    textColor: const Color(0xff686868),
                                    textSize: 14.sp,
                                    fontWeight: FontWeight.w400),
                                getCustomFont("Unit : ${invoice['Unit']!}",
                                    textColor: const Color(0xff686868),
                                    textSize: 14.sp,
                                    fontWeight: FontWeight.w400),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
