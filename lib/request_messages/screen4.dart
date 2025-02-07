
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screen_4.dart';


class ScreenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Screen4(),
    );
  }
}

class Screen4 extends StatelessWidget {
  final Screen4Controller controller = Get.put(Screen4Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A4774),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildHeader(),
          _buildTabs(),
          Expanded(child: Obx(() => _buildRequestList())),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: Color(0xFF0A4774),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
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
                'android/assets/b530b2c7f689ab5ba178506ace4ff273.png',
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
    return GestureDetector(
      onTap: () => controller.changeTab(title),
      child: Obx(() {
        bool isSelected = controller.selectedTab.value == title;
        return Container(
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
        );
      }),
    );
  }

  Widget _buildRequestList() {
    var requests = controller.filteredRequests;

    if (requests.isEmpty) {
      return Center(
        child: Text(
          'No requests available for "${controller.selectedTab}".',
          style: TextStyle(color: Colors.black54, fontSize: 16),
        ),
      );
    }

    return ListView.builder(
      itemCount: requests.length,
      itemBuilder: (context, index) {
        return _buildRequestCard(
          name: requests[index]['name']!,
          message: requests[index]['message']!,
        );
      },
    );
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
            color: Colors.grey.withOpacity(0.3),
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
