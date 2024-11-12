// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class CompanyGroupScreen extends StatefulWidget {
//   const CompanyGroupScreen({super.key});
//
//   @override
//   State<CompanyGroupScreen> createState() => _CompanyGroupScreenState();
// }
//
// class _CompanyGroupScreenState extends State<CompanyGroupScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(child: Scaffold(body: Column(),));
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:textile_app/controller/data_controller.dart';
import 'package:textile_app/utils/widget.dart';

class CompanyGroupScreen extends StatefulWidget {
  const CompanyGroupScreen({super.key});

  @override
  State<CompanyGroupScreen> createState() => _CompanyGroupScreenState();
}

class _CompanyGroupScreenState extends State<CompanyGroupScreen> {
  dataController controller = Get.put(dataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back),
      //     onPressed: () {
      //       // Handle back button
      //       Navigator.pop(context);
      //     },
      //   ),
      //   title: Text('Munjapara Fabrics (03)'),
      //   backgroundColor: Color(0xFF0A6C9C), // Custom color similar to the image
      // ),
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

          CustomSearchbar(
            "Search Account...",
            (p0) {},
          ),
          // Search Field
          // Padding(
          //   padding: const EdgeInsets.all(10.0),
          //   child: TextField(
          //     decoration: InputDecoration(
          //       prefixIcon: Icon(Icons.search),
          //       hintText: 'Search Account...',
          //       filled: true,
          //       fillColor: Colors.grey[200],
          //       border: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(20.0),
          //         borderSide: BorderSide.none,
          //       ),
          //     ),
          //   ),
          // ),
          // Expanded(
          //   child: ListView(
          //     padding: EdgeInsets.all(10.0),
          //     children: [
          //       // Account Card 1
          //       Container(
          //           height: 75.h,
          //           decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(10),
          //               border: Border.all(color: Color(0xffC1C1C1))),
          //           child: Row(
          //             children: [
          //               Column(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 // crossAxisAlignment: CrossAxisAlignment.center,
          //                 children: [getCustomFont("Varni Infotech")],
          //               ),
          //             ],
          //           )
          //
          //           // Padding(
          //           //   padding: const EdgeInsets.all(10.0),
          //           //   child: Column(
          //           //     crossAxisAlignment: CrossAxisAlignment.start,
          //           //     children: [
          //           //       Text(
          //           //         'Varni Infotech',
          //           //         style: TextStyle(
          //           //           fontWeight: FontWeight.bold,
          //           //           color: Color(0xFF0A6C9C),
          //           //           fontSize: 18.0,
          //           //         ),
          //           //       ),
          //           //       SizedBox(height: 5.0),
          //           //       Text('Pur Rate : 0 | Sale Rate : 0'),
          //           //       SizedBox(height: 5.0),
          //           //       Row(
          //           //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           //         children: [
          //           //           Text('Group :'),
          //           //           Column(
          //           //             crossAxisAlignment: CrossAxisAlignment.end,
          //           //             children: [
          //           //               Text('HSN: 540710'),
          //           //               Text('Unit : KGS'),
          //           //             ],
          //           //           ),
          //           //         ],
          //           //       ),
          //           //     ],
          //           //   ),
          //           // ),
          //           ),
          //       // Account Card 2
          //       Container(
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(10),
          //             border: Border.all(color: Color(0xffC1C1C1))),
          //         child: const Padding(
          //           padding: EdgeInsets.all(10.0),
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Text(
          //                 'Sky Infotech',
          //                 style: TextStyle(
          //                   fontWeight: FontWeight.bold,
          //                   color: Color(0xFF0A6C9C),
          //                   fontSize: 18.0,
          //                 ),
          //               ),
          //               SizedBox(height: 5.0),
          //               Text('Pur Rate : 0 | Sale Rate : 0'),
          //               SizedBox(height: 5.0),
          //               Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   Text('Group :'),
          //                   Column(
          //                     crossAxisAlignment: CrossAxisAlignment.end,
          //                     children: [
          //                       Text('HSN: 540710'),
          //                       Text('Unit : KGS'),
          //                     ],
          //                   ),
          //                 ],
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          Obx(
            () => Expanded(
              child: ListView.builder(
                itemCount: controller.companyDetailsList.length,
                itemBuilder: (context, index) {
                  var invoice = controller.companyDetailsList[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
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
                                getCustomFont(invoice['title']!,
                                    textColor: const Color(0xff0D5785),
                                    textSize: 15.sp,
                                    fontWeight: FontWeight.w600),
                                getCustomFont(
                                    "Pur Rate : ${invoice['Pur Rate']!} | Sale Rate : ${invoice['Sale Rate']}",
                                    textColor: const Color(0xff686868),
                                    textSize: 14.sp,
                                    fontWeight: FontWeight.w400),
                                getCustomFont("Group : ${invoice['Group']!}",
                                    textColor: const Color(0xff686868),
                                    textSize: 14.sp,
                                    fontWeight: FontWeight.w400),
                                // getCustomFont(invoice['title']!),
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
                            )
                            // Text(invoice['title']!),
                            // Text(invoice['date']!),
                            // Text(invoice['fix']!),
                            // Text(invoice['due']!),
                            // Text(invoice['amount']!),
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
