import 'package:flutter/material.dart';



class Screen8 extends StatelessWidget {
  const Screen8({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContactListScreen(),
    );
  }
}

class ContactListScreen extends StatelessWidget {
  final List<Map<String, String>> contacts = [
    {'name': 'Team Player 1', 'role': 'Captain'},
    {'name': 'Team Player 1', 'role': 'Vice Captain'},
    {'name': 'Team Player 1', 'role': 'Wicketkeeper'},
    {'name': 'Team Player 1', 'role': 'Batsman'},
    {'name': 'Team Player 1', 'role': 'Batsman'},
    {'name': 'Team Player 1', 'role': 'Batsman'},
    {'name': 'Team Player 1', 'role': 'Spin Bowler'},
    {'name': 'Player 1', 'role': 'Spin Bowler'},
    {'name': 'Player 2', 'role': 'Spin Bowler'},
  ];

  ContactListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: const Text(
          'Select Contact',
          style: TextStyle(color: Color(0xFF231F20), fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.more_vert, color: Colors.black),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: Color(0xFF003572)),
                hintText: 'Search',
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.all(0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(color: Color(0xFFDADFE7), width: 1.0),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: contacts.length,
              separatorBuilder: (context, index) => const Divider(
                height: 1,
                indent: 72,
                color: Color(0xFFDADFE7),
              ),
              itemBuilder: (context, index) {
                final contact = contacts[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue.shade50,
                    child: const Icon(Icons.person, color: Color(0xFF003572)),
                  ),
                  title: Text(
                    contact['name'] ?? '',
                    style: const TextStyle(
                      color: Color(0xFF231F20),
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  subtitle: Text(
                    contact['role'] ?? '',
                    style: TextStyle(
                      color: Color(0xFF697586),
                      fontSize: 12,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
