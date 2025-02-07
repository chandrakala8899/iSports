import 'package:flutter/material.dart';

class RequestsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Screen2(),
    );
  }
}

class Screen2 extends StatefulWidget {
  @override
  _RequestsScreenState createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<Screen2> {
  String selectedTab = 'All';
 



  final List<Map<String, String>> requestsall = [
    
    {'name': 'Kumar_m', 'message': 'has sent you a connection request'},
    
    {'name': 'Cric_Tournment', 'message': 'has invited you to join their tournment'},
    
    {'name': 'Sixer_Squad', 'message': 'has invited you to join their team'},
  ];
  final List<Map<String, String>> requests = [
    
    {'name': 'Sixer_Squad', 'message': 'has invited you to join their team'},
  ];

  final List<Map<String, String>> requestscol = [
    
    {'name': 'Cric_Tournment', 'message': 'has invited you to join their tournment'},
    {'name': 'Sixer_Squad', 'message': 'has invited you to join their team'},
  ];

  void onTabChanged(String tab) {
    setState(() {
      selectedTab = tab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A4774), // Dark blue color
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
    bool isSelected = selectedTab == title;
    return GestureDetector(
      onTap: () => onTabChanged(title),
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
  }


Widget _buildRequestList() {
  if (selectedTab == 'All') {
    // Display the list of requests for the 'All' tab
    return ListView.builder(
      itemCount: requestsall.length,
      itemBuilder: (context, index) {
        return _buildRequestCard(
          name: requestsall[index]['name']!,
          message: requestsall[index]['message']!,
        );
      },
    );
  } else if (selectedTab == 'Connect') {
    // Display the list of requests for the 'Connect' tab
    return ListView.builder(
      itemCount: requests.length,
      itemBuilder: (context, index) {
        return _buildRequestCard(
          name: requests[index]['name']!,
          message: requests[index]['message']!,
        );
      },
    );
  } else if (selectedTab == 'Collaborate') {
    // Display the list of requests for the 'Collaborate' tab
    return ListView.builder(
      itemCount: requestscol.length,
      itemBuilder: (context, index) {
        return _buildRequestCard(
          name: requestscol[index]['name']!,
          message: requestscol[index]['message']!,
        );
      },
    );
  } else {
    return Container();
  }
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
          color: Color(0xFFE8F0FE),
          offset: Offset(0, 4),
          blurRadius: 5,
        ),
      ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start, // Align items to the top
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
        Container(
          margin: EdgeInsets.only(top: 2), 
          child: ElevatedButton(
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
        ),
      ],
    ),
  );
}
}
