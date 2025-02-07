import 'package:get/get.dart';

class Screen5Controller extends GetxController {
  // State variables
  var isAccepted = false.obs;
  var isRejected = false.obs;

  // Example event information
  var eventDetails = {
    'organizerName': '----',
    'eventType': 'Tournament',
    'mobile': '----',
    'email': '----',
    'matches': '10',
    'registrationFee': '20000 per team',
    'location': 'Hyderabad',
    'description':
        'Join us for an exhilarating Cricket Tournament, where teams from all over come together to showcase their skills and compete for the championship title!',
  }.obs;

  // Methods to accept or reject requests
  void acceptRequest() {
    isAccepted.value = true;
    isRejected.value = false;
    // Add any additional functionality here
    Get.snackbar('Interested', 'You have accepted the request.');
  }

  void rejectRequest() {
    isRejected.value = true;
    isAccepted.value = false;
    // Add any additional functionality here
    Get.snackbar('Rejected', 'You have rejected the request.');
  }

  // Future method for "View Team Profile" (add functionality here)
  void viewTeamProfile() {
    Get.snackbar('View Profile', 'Navigating to Team Profile...');
  }
}
