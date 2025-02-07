import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../organiser/subscription.dart';
import '../request_messages/requestsAll.dart';
import '../request_messages/screen7.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const HomeScreen(),
    const FeedScreen(),
    const NetworkScreen(),
    const SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], 
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, 
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/home.png',
              width: 24,
              height: 24,
              color: _currentIndex == 0
                  ? Colors.blueAccent
                  : Colors.grey, 
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/feed.png',
              width: 24,
              height: 24,
              color: _currentIndex == 1
                  ? Colors.blueAccent
                  : Colors.grey,
            ),
            label: "Feed",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/network.png',
              width: 24,
              height: 24,
              color: _currentIndex == 2
                  ? Colors.blueAccent
                  : Colors.grey, 
            ),
            label: "Network",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/setting.png',
              width: 24,
              height: 24,
              color: _currentIndex == 3
                  ? Colors.blueAccent
                  : Colors.grey, 
            ),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "Welcome to iSports",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(255, 40, 82, 154),
                    ),
                  ),
                  const Image(
                    image: AssetImage('assets/images/notification.png'),
                    width: 45, 
                    height: 45, 
                  ),
                ],
              ),
            ),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Profile",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                                color: Color.fromARGB(255, 12, 13, 13),
                              ),
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      AssetImage('assets/images/profile.png'),
                                ),
                                const SizedBox(width: 12),
                                const Text(
                                  "Roshan",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Mobile Number : 9090909090"),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Text("Subscription Plan : Basic"),
                                    const SizedBox(width: 5),
                                    TextButton(
                                      onPressed: () {
                                        Get.to(
                                            () => OrganizationSubscription());
                                      },
                                      child: const Text(
                                        "Upgrade plan",
                                        style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                          decorationColor: Colors
                                              .blueAccent, 
                                          decorationThickness:
                                              2, 
                                          height: 1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => RequestsApp());
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/request.png',
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 4),
                              const Text("Requests"),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/edit_profile.png',
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 4),
                              const Text("Edit Profile"),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => Screen7());
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/msg.png',
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 4),
                              const Text("Messages"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Sports",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/cricketbat.png',
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 4),
                              const Text("cricket"),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/football.png',
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 4),
                              const Text("football"),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/add_sport.png',
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 4),
                              const Text("add_sport"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/create.png',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 4),
                      const Text("create"),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/search.png',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 4),
                      const Text("search Profile"),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/payment.png',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 4),
                      const Text("payment"),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            Container(
              width: double.infinity, 
              child: Image.asset(
                "assets/images/sports_journey.png",
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Feed Screen"));
  }
}

class NetworkScreen extends StatelessWidget {
  const NetworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Network Screen"));
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Settings Screen"));
  }
}
