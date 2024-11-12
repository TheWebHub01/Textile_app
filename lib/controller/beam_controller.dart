import 'package:get/get.dart';

class BeamController extends GetxController {
  // Observable data
  var beamData = [
    {"name": "Text 1", "value1": 0, "value2": 0, "value3": 0},
    {"name": "Text 2", "value1": 0, "value2": 0, "value3": 0},
    {"name": "Text 3", "value1": 0, "value2": 0, "value3": 0},
  ].obs;

  // Function to update search query (if needed)
  void updateSearchQuery(String query) {
    // Perform search/filter logic here
  }
}