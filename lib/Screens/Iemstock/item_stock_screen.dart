import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:textile_app/controller/data_controller.dart';
import 'package:textile_app/utils/widget.dart';
import 'package:textile_app/widget/appbar.dart';

class ItemStockScreen extends StatefulWidget {
  const ItemStockScreen({super.key});

  @override
  State<ItemStockScreen> createState() => _ItemStockScreenState();
}

class _ItemStockScreenState extends State<ItemStockScreen> {
  dataController controller = Get.put(dataController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context, "Munjapara Fabrics", false, null),
      body: Column(
        children: <Widget>[
          verticalSpace(10.h),
          Flexible(
            // flex: ,
            child: ListView.builder(
              itemCount: controller.itemList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15.w),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xffC1C1C1)),
                      ),
                      child: Row(
                        children: [
                          horizontalSpace(15.w),
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
    );
  }
}
