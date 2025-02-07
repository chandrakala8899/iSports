import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Screen3Controller extends GetxController {
  // Observable variables to hold player data and loading state
  var isLoading = true.obs;
  var playerInfo = {}.obs;

  // Function to fetch player data from API
  Future<void> fetchPlayerData() async {
    try {
      isLoading(true);

      // Replace with your API endpoint
      var url = Uri.parse('https://api.example.com/player-request');

      // HTTP GET request
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Decode JSON response
        var data = json.decode(response.body);
        
        // Update player data
        playerInfo.value = data['player'] ?? {};
      } else {
        // Handle error response
        Get.snackbar(
          'Error',
          'Failed to load player data: ${response.statusCode}',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      // Catch network or parsing errors
      Get.snackbar(
        'Error',
        'An error occurred: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading(false);
    }
  }
}
