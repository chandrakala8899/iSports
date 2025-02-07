import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'info_row.dart';
import 'screen_3_controller.dart';

class PlayerRequestScreen extends StatelessWidget {
  const PlayerRequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Screen3Controller controller = Get.put(Screen3Controller());
    controller.fetchPlayerData();

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }

          // Get the player data
          var playerData = controller.playerInfo;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Navigation Bar
              Container(
                color: const Color(0xFF003366),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),

              // Main Card Section
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 310,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color(0xFFE8F0FE),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Profile with Name & Verification
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage(
                              'assets/images/profile.png',
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            playerData['name'] ?? 'Player Name',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Icon(
                            Icons.verified,
                            color: Colors.blue,
                            size: 20,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Info Rows
                      InfoRow(
                          title: 'Primary Sport',
                          value: playerData['sport'] ?? 'N/A'),
                      InfoRow(
                          title: 'Role', value: playerData['role'] ?? 'N/A'),
                      InfoRow(
                          title: 'Position',
                          value: playerData['position'] ?? 'N/A'),
                      InfoRow(
                          title: 'Location',
                          value: playerData['location'] ?? 'N/A'),
                      InfoRow(
                          title: 'Team', value: playerData['team'] ?? 'N/A'),
                      const SizedBox(height: 16),
                      // Buttons Row
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Reject Button
                            Container(
                              width: 80,
                              height: 36,
                              margin: const EdgeInsets.only(right: 8),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  padding:
                                      const EdgeInsets.fromLTRB(18, 7, 19, 7),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: () {
                                  // Reject button functionality
                                },
                                child: const Text(
                                  'Reject',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                            ),
                            // Accept Button
                            Container(
                              width: 80,
                              height: 36,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF003366),
                                  padding:
                                      const EdgeInsets.fromLTRB(18, 7, 19, 7),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(12),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  // Accept button functionality
                                },
                                child: const Text(
                                  'Accept',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
