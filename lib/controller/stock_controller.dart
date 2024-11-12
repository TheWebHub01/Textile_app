import 'package:get/get.dart';

class StockController extends GetxController {
  var skipZeroBalance = false.obs;
  var searchQuery = ''.obs;
  // var stockData = [
  //   {
  //     "title": "Title 01",
  //     "opening": 12,
  //     "inward": 33,
  //     "outward": 27,
  //     "closing": 18,
  //     "openingAmount": 1654.0,
  //     "inwardAmount": 5414.0,
  //     "outwardAmount": 4826.0,
  //     "closingAmount": 2242.0,
  //   },
  //   {
  //     "title": "Title 02",
  //     "opening": 15,
  //     "inward": 76,
  //     "outward": 0,
  //     "closing": 91,
  //     "openingAmount": 2515.0,
  //     "inwardAmount": 12083.0,
  //     "outwardAmount": 0.0,
  //     "closingAmount": 14598.0,
  //   }
  // ].obs;

  void toggleSkipZeroBalance() {
    skipZeroBalance.value = !skipZeroBalance.value;
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }
  bool isChecked1 = false;

  var startDate = DateTime(2024, 8, 5).obs;
  var endDate = DateTime(2024, 8, 11).obs;

}
