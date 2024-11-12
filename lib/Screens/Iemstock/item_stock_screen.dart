import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:textile_app/controller/data_controller.dart';
import 'package:textile_app/utils/widget.dart';

class ItemStockScreen extends StatefulWidget {
  const ItemStockScreen({super.key});

  @override
  State<ItemStockScreen> createState() => _ItemStockScreenState();
}

class _ItemStockScreenState extends State<ItemStockScreen> {
  dataController controller = Get.put(dataController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
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
                      "Munjapara Fabrics",
                      textColor: Colors.white,
                      textSize: 19.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(),
                  ],
                ),
              ),
            ),
            verticalSpace(10.h),
            Flexible(
              // flex: ,
              child: ListView.builder(
                itemCount: controller.itemList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(right: 10, left: 10, bottom: 10),
                    child: GestureDetector(
                      onTap: () {
                        // Get.to(ReportScreen(
                        //   title: controller.companyList[index].title,
                        // ));
                      },
                      child: Container(
                        width: 335,
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: const Color(0xffC1C1C1)),
                        ),
                        child: Row(
                          children: [
                            horizontalSpace(15.w),
                            // getAssetWidget(controller.companyList[index].images),
                            // horizontalSpace(7.w),
                            getCustomFont(controller.itemList[index].title,
                                textSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                textColor: const Color(0xff686868))
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
