import 'package:get/get.dart';

class PlayerRequestController extends GetxController {
  // Observable variables for loading and player data
  var isLoading = true.obs;
  var playerInfo = {}.obs; // This will store the player data.

  // Fetch player data (simulating an API call)
  Future<void> fetchPlayerData() async {
    try {
      // Simulate API call with a delay
      await Future.delayed(Duration(seconds: 2));

      // Simulating a successful API response
      playerInfo.value = {
        'name': 'Kumar_M',
        'sport': 'Cricket',
        'role': 'Player',
        'position': 'Spin Bowler',
        'location': 'Hyderabad',
        'team': 'Self'
      };
    } catch (e) {
      // Handle any errors
      print('Error fetching player data: $e');
    } finally {
      // Stop loading
      isLoading.value = false;
    }
  }
}
