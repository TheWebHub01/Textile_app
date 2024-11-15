import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:textile_app/controller/data_controller.dart';
import 'package:textile_app/utils/widget.dart';
import 'package:textile_app/widget/appbar.dart';
import 'package:textile_app/widget/search_bar.dart';

class BeamScreen extends StatefulWidget {
  const BeamScreen({super.key});

  @override
  State<BeamScreen> createState() => _BeamScreenState();
}

class _BeamScreenState extends State<BeamScreen> {
  dataController controller = Get.put(dataController());
  void filterSearchResults(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredBiles.value = controller.biles;
      });
    } else {
      setState(() {
        filteredBiles.value = controller.biles.where((biles) {
          return (biles['billNo'] as String)
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              (biles['date'] as String)
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              (biles['fix'] as String)
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              (biles['due'] as String)
                  .toLowerCase()
                  .contains(query.toLowerCase());
        }).toList();
      });
    }
  }

  var filteredBiles = [].obs;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredBiles.value = controller.biles;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context, "Munjapara Fabrics (03)", false, null),
      body: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xffF6F6F6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: getCustomFont(
                        "On Machine",
                        textColor: const Color(0xffF14336),
                      )),
                    )
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: filteredBiles.length,
                reverse: true,
                itemBuilder: (context, index) {
                  var invoice = filteredBiles[index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
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
                              color: const Color(0xff0D5785).withOpacity(0.1)),
                          children: [
                            SizedBox(
                              height: 35,
                              child: Center(
                                child: Text(invoice['billNo'] ?? "",
                                    style: const TextStyle(
                                      color: Color(0xff494949),
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 35,
                              child: Center(
                                child: Text(
                                  invoice['fix'] ?? "",
                                  style:
                                      const TextStyle(color: Color(0xff494949)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 35,
                              child: Center(
                                child: Text(invoice['due'] ?? "",
                                    style: const TextStyle(
                                      color: Color(0xff009914),
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 35,
                              child: Center(
                                child: Text(
                                  invoice['date'] ?? "",
                                  style:
                                      const TextStyle(color: Color(0xffF14336)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          verticalSpace(10.h),
          Table(
            columnWidths: const {
              0: FlexColumnWidth(1.2),
              1: FlexColumnWidth(1),
            },
            children: [
              TableRow(
                decoration: const BoxDecoration(color: Color(0xff0D5785)),
                children: [
                  SizedBox(
                    height: 40,
                    child: Center(
                      child: Text("Total Loaded Beam :",
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: const Color(0xffffffff),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: Center(
                      child: Text(
                        "00.00",
                        style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 15.sp,
                        ),
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
