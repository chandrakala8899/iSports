import 'package:get/get.dart';

class RequestsController extends GetxController {
  // Observable list of requests
  var requests = <Map<String, String>>[].obs; 

  // Observable selectedTab to manage current tab state
  var selectedTab = 'All'.obs;

  // Simulating some data fetching or updating
  void fetchRequests() {
    // Example: you can populate the requests list here when fetching data
    requests.addAll([
      {'name': 'John Doe', 'message': 'Hello!'},
      {'name': 'Jane Smith', 'message': 'Let\'s connect!'},
    ]);
  }
  

  // Change tab logic
  void onTabChanged(String tab) {
    selectedTab.value = tab;
    // Fetch new data or update the requests list based on the selected tab
    if (tab == 'Connect') {
      // Filter requests or fetch requests related to "Connect"
      fetchRequests(); // Just an example, you can add your own logic here
    } else if (tab == 'Collaborate') {
      // Fetch requests related to "Collaborate"
      fetchRequests(); 
    } else {
      fetchRequests(); // Default data for "All"
    }
  }

  // Simulate increment or some button action logic
  void increment() {
    // Add new requests or update data
    requests.add({'name': 'New User', 'message': 'I want to connect!'});
  }
}
