import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screen8.dart';

class Screen7 extends StatelessWidget {
  const Screen7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MessagesScreen(),
    );
  }
}

class MessagesScreen extends StatelessWidget {
  final List<Message> messages = [
    Message(
        sender: "My team",
        content: "Hey team, have you guys seen the lineup...",
        isUnread: true,
        unreadCount: 2),
    Message(
        sender: "Coach",
        content:
            "Yes, exactly. Also, try to communicate more wit...", // Truncated content
        isUnread: false),
    Message(
        sender: "Player 1",
        content: "Hey, up for a friendly match this weekend? A fe...",
        isUnread: false),
    Message(
        sender: "Organizer 1",
        content: "Hi there! We're organizing a local tournament ne...",
        isUnread: false),
  ];

  MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Light grey background
      appBar: AppBar(
        backgroundColor: const Color(0xFF003366), // Dark blue color
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Subtitle Section
          Container(
            height: 187, // Set the height directly
            color: const Color(0xFF003366), // Dark blue color
            padding: const EdgeInsets.only(left: 16.0, bottom: 20.0),
            child: SafeArea(
              // Ensures proper spacing for the status bar
              child: Align(
                alignment: Alignment.bottomLeft, // Align content to the bottom
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Messages",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Talk, Share, Engage!!",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 8),
          // Messages List
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return MessageTile(message: messages[index]);
              },
            ),
          ),
          // Add Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {
                  // Action for add button
                  Get.to(() => Screen8());
                },
                backgroundColor: const Color(0xFF003366),
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String sender;
  final String content;
  final bool isUnread;
  final int? unreadCount;

  Message({
    required this.sender,
    required this.content,
    this.isUnread = false,
    this.unreadCount,
  });
}

class MessageTile extends StatelessWidget {
  final Message message;

  const MessageTile({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          leading: const CircleAvatar(
            backgroundColor: Color(0xFFE8F0FE),
            child: Icon(
              Icons.person,
              color: Colors.black54,
            ),
          ),
          title: Text(
            message.sender,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            message.content,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
          trailing: message.isUnread
              ? CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.red,
                  child: Text(
                    message.unreadCount?.toString() ?? "",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
