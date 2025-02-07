import 'package:get/get.dart';

class Screen4Controller extends GetxController {
  // Tab Management
  var selectedTab = 'Collaborate'.obs;

  // Sample Request Data
  var requests = <Map<String, String>>[
    {'name': 'Crick_Tournament', 'message': 'has invited you to join their tournament'},
    {'name': 'Sixer_Squad', 'message': 'has invited you to join their team'},
  ].obs;

  // Method to change the selected tab
  void changeTab(String tab) {
    selectedTab.value = tab;
  }

  // Get filtered requests based on the selected tab
  List<Map<String, String>> get filteredRequests {
    if (selectedTab.value == 'Collaborate') {
      return requests;
    } else if (selectedTab.value == 'Connect' || selectedTab.value == 'All') {
      return [];
    }
    return [];
  }
}
