import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestsController extends GetxController {
  // Observable list of requests
  var requests = <Map<String, String>>[].obs;

  // Observable selectedTab to manage current tab state
  var selectedTab = 'All'.obs;

  // Simulating data fetching
  void fetchRequests() {
    // Example: populate the requests list here when fetching data
    requests.value = [
      {'name': 'Kumar_M', 'message': 'has sent you a connection request'},
      {'name': 'Crick_Tournament', 'message': 'has invited you to join their tournament'},
      {'name': 'Sixer_Squad', 'message': 'has invited you to join their team'},
      
    ];
  }

  // Tab change logic
  void onTabChanged(String tab) {
    selectedTab.value = tab;
    // Add filtering or fetching logic here based on `tab`
    if (tab == 'Connect') {
      requests.value = []; // Example: Filter data for Connect tab
    } else if (tab == 'Collaborate') {
      requests.value = []; // Example: Filter data for Collaborate tab
    } else {
      fetchRequests(); // Default to all requests
    }
  }
}

class RequestsScreen extends StatelessWidget {
  final RequestsController controller = Get.put(RequestsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A4774),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildHeader(),
          _buildTabs(),
          Expanded(child: _buildRequestList()),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: Color(0xFF0A4774),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end, // Align all elements at the bottom
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Requests",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Connect, Collaborate, Compete!",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Image.asset(
                'assets/images/national-sports.png', 
                height: 100,
                width: 70,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          _buildTabButton('All'),
          SizedBox(width: 10),
          _buildTabButton('Connect'),
          SizedBox(width: 10),
          _buildTabButton('Collaborate'),
        ],
      ),
    );
  }

  Widget _buildTabButton(String title) {
    return Obx(() {
      bool isSelected = controller.selectedTab.value == title;
      return GestureDetector(
        onTap: () => controller.onTabChanged(title),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          decoration: BoxDecoration(
            color: isSelected ? Color(0xFF0A4774) : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Color(0xFF0A4774)),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : Color(0xFF697586),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    });
  }

  Widget _buildRequestList() {
    return Obx(() {
      if (controller.requests.isEmpty) {
        return Center(
          child: Text(
            'No requests available for "${controller.selectedTab.value}".',
            style: TextStyle(color: Colors.black54, fontSize: 16),
          ),
        );
      }
      return ListView.builder(
        itemCount: controller.requests.length,
        itemBuilder: (context, index) {
          return _buildRequestCard(
            name: controller.requests[index]['name']!,
            message: controller.requests[index]['message']!,
          );
        },
      );
    });
  }

  Widget _buildRequestCard({required String name, required String message}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFFE8F0FE),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 4),
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, color: Color(0xFF0A4774)),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF231F20),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF0A4774),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            ),
            child: Text(
              "View",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
