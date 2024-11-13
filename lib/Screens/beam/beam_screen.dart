import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:textile_app/controller/data_controller.dart';
import 'package:textile_app/utils/widget.dart';
import 'package:textile_app/widget/search_bar.dart';

class BeamScreen extends StatefulWidget {
  const BeamScreen({super.key});

  @override
  State<BeamScreen> createState() => _BeamScreenState();
}

class _BeamScreenState extends State<BeamScreen> {
  dataController controller = Get.put(dataController());
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ///appbar
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
                    "Munjapara Fabrics (03)",
                    textColor: Colors.white,
                    textSize: 19.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  const SizedBox(),
                  // getAssetWidget("pdf.svg"),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    child: CustomeSearchbar(
                  controller: searchController,
                  onSearchChanged: (p0) {},
                )),
                Container(
                  height: 45.h,
                  width: 95.w,
                  decoration: BoxDecoration(
                    color: const Color(0xffF6F6F6),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Center(
                    child: getCustomFont(
                      "On Machine",
                      fontWeight: FontWeight.w500,
                      textSize: 14.sp,
                      textColor: const Color(0xffF14336),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          const Spacer(),
          // Spacer(),
          Obx(
            () => Expanded(
              child: ListView.builder(
                itemCount: controller.biles.length,
                itemBuilder: (context, index) {
                  var bile = controller.biles[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 40,
                      // color: Color(0xff0D5785).withOpacity(0.1),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            getCustomFont(bile['billNo']!),
                            getCustomFont(bile['date']!),
                            getCustomFont(bile['fix']!,
                                textColor: const Color(0xff009914)),
                            getCustomFont(bile['due']!,
                                textColor: const Color(0xffF14336)),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                getCustomFont("Total Loaded Beam :",
                    textColor: const Color(0xffffffff),
                    textSize: 15.sp,
                    fontWeight: FontWeight.w600),
                getCustomFont("00.00",
                    textColor: const Color(0xffffffff),
                    textSize: 15.sp,
                    fontWeight: FontWeight.w500)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
