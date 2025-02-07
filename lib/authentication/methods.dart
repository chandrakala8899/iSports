import 'package:flutter/material.dart';

// Build and Manage Teams Widget
Widget buildAndManageTeams(double screenHeight) {
  return Padding(
    padding: const EdgeInsets.all(16.0), // Optional: Add some padding
    child: SizedBox(
      height: screenHeight * 0.7, // Use 70% of the screen height
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image Widget
          Image.asset(
            'assets/images/cricket.png',
            height: 300,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 30),

          // Title and Subtitle
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Build and Manage Teams',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Easily create teams, add players, and coordinate with your squad for upcoming events.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  height: 1.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Indicator Dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildDot(Colors.grey),
              const SizedBox(width: 8),
              _buildDot(Colors.blue),
              const SizedBox(width: 8),
              _buildDot(Colors.grey),
            ],
          ),
        ],
      ),
    ),
  );
}
// Helper function to build dot indicators
Widget _buildDot(Color color) {
  return Container(
    width: 10,
    height: 10,
    decoration: BoxDecoration(
      color: color,
      shape: BoxShape.circle,
    ),
  );
}

Widget createAndHostEvents(double screenHeight) {
  return Padding(
    padding: const EdgeInsets.all(16.0), // Optional: Add some padding
    child: SizedBox(
      height: screenHeight * 0.7, // Use 70% of the screen height
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image Widget
          Image.asset(
            'assets/images/cricketballvsimage.png',
            height: 300,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 30),

          // Title and Subtitle
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Create and Host Events',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Organize sporting events with just a few clicks. Set up tournaments, matches, and more!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  height: 1.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Indicator Dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildDot(Colors.grey),
              const SizedBox(width: 8),
              _buildDot(Colors.blue),
              const SizedBox(width: 8),
              _buildDot(Colors.grey),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget searchAndHirePlayers(double screenHeight) {
  return Padding(
    padding: const EdgeInsets.all(16.0), // Optional: Add some padding
    child: SizedBox(
      height: screenHeight * 0.7, // Use 70% of the screen height
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image Widget
          Image.asset(
            'assets/images/cricketbatting.png',
            height: 300,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 30),

          // Title and Subtitle
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Search and Hire Players',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Looking for skilled players? Browse profiles and hire players for your team or event.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  height: 1.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Indicator Dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildDot(Colors.grey),
              const SizedBox(width: 8),
              _buildDot(Colors.blue),
              const SizedBox(width: 8),
              _buildDot(Colors.grey),
            ],
          ),
        ],
      ),
    ),
  );
}


