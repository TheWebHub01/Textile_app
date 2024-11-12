import 'package:get/get.dart';

class PurchaseAnalysisController extends GetxController {
  var monthlySales = [40, 35, 25, 20].obs; // Sales in Lac for months
  var itemSalesPercentages = [
    {"name": "Kumari", "percentage": 60.19},
    {"name": "R X L", "percentage": 22.15},
    {"name": "Kota Checks", "percentage": 6.13},
    // Add the remaining data here
  ].obs;
}