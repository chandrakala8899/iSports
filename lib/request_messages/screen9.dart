import 'package:flutter/material.dart';

class Screen9 extends StatelessWidget {
  const Screen9({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Team'),
        //CrossAxisAlignment.start
        centerTitle: false,
        leading: const Icon(Icons.arrow_back),
      ),
      body: Column(
        children: [
          // Date header
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Oct 1, 2024',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF697586),
              ),
            ),
          ),

          // Chat Messages
          Expanded(
            child: ListView(
              children: const [
                // Team Captain's message
                ChatMessage(
                  sender: 'Team Captain',
                  message:
                      'Hey team! \n\nI was thinking we should switch up our formation for tomorrow',
                  isCurrentUser: false,
                ),
                ChatMessage(
                  sender: '',
                  message:
                      'Hey team! \n\nI was thinking we should switch up our formation for tomorrow\'s game. How about we go with a 4-3-3 to strengthen our midfield and control the game?',
                  isCurrentUser: false,
                ),

                // Team Player 1
                ChatMessage(
                  sender: 'Team Player 1',
                  message:
                      'Good idea! I think it’ll help us keep possession better.',
                  isCurrentUser: false,
                ),

                // Team Player 2
                ChatMessage(
                  sender: 'Team Player 2',
                  message:
                      'I agree. Plus, it’ll give us more attacking options. I’m in.',
                  isCurrentUser: false,
                ),

                // Current User Message
                ChatMessage(
                  sender: 'You',
                  message:
                      'Sounds great! I’ll adjust my positioning accordingly.',
                  isCurrentUser: true,
                ),
              ],
            ),
          ),

          // Message Input Field
          const _MessageInputField(),
        ],
      ),
    );
  }
}

// Message Bubble Widget
class ChatMessage extends StatelessWidget {
  final String sender;
  final String message;
  final bool isCurrentUser;

  const ChatMessage({
    Key? key,
    required this.sender,
    required this.message,
    required this.isCurrentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Align(
        alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Column(
          crossAxisAlignment:
              isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            // Message bubble with sender included
            Container(
              decoration: BoxDecoration(
                color: isCurrentUser ? Color(0xFF003572) : Color(0xFFF2F6F8),
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(12),
                  topRight: const Radius.circular(12),
                  bottomLeft: isCurrentUser
                      ? const Radius.circular(12)
                      : const Radius.circular(0),
                  bottomRight: isCurrentUser
                      ? const Radius.circular(0)
                      : const Radius.circular(12),
                ),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              child: RichText(
                text: TextSpan(
                  children: [
                    // Sender Title at the top
                    TextSpan(
                      text: '$sender\n',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: isCurrentUser
                            ? Colors.white70
                            : Color(0xFF231F20), // Lighter for contrast
                      ),
                    ),
                    // Actual message text
                    TextSpan(
                      text: message,
                      style: TextStyle(
                        fontSize: 14,
                        color: isCurrentUser ? Colors.white : Color(0xFF697586),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Message Input Field
class _MessageInputField extends StatelessWidget {
  const _MessageInputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
      ),
      child: Row(
        children: [
          const Icon(Icons.add, color: Colors.blue),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type a message...',
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.white),
              onPressed: () {
                // Add your sending logic here
              },
            ),
          ),
        ],
      ),
    );
  }
}
