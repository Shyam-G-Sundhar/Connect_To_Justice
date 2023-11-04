import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class LawChat extends StatefulWidget {
  const LawChat({Key? key}) : super(key: key);

  @override
  _LawChatState createState() => _LawChatState();
}

class _LawChatState extends State<LawChat> {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = [];

  @override
  void initState() {
    super.initState();

    _messages.add(ChatMessage(
        sender: 'User', text: 'Hi', color: Colors.red, isUser: true));

    _messages.add(ChatMessage(
        sender: 'Chatbot',
        text: 'Hello! How can I assist you?',
        color: Colors.black,
        isUser: false));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          toolbarHeight: 65,
          backgroundColor: Colors.red,
          title: Text(
            'Name',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return ChatMessageWidget(message: _messages[index]);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.send,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      _sendMessage();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage() {
    if (_textController.text.isNotEmpty) {
      setState(() {
        _messages.add(ChatMessage(
            sender: 'User',
            text: _textController.text,
            color: Colors.red,
            isUser: true));
        // Simulating a reply from the chatbot
        _messages.add(ChatMessage(
            sender: 'Chatbot',
            text: 'I received your message',
            color: Colors.black,
            isUser: false));
        _textController.clear();
      });
    }
  }
}

class ChatMessage {
  final String sender;
  final String text;
  final Color color;
  final bool isUser;

  ChatMessage(
      {required this.sender,
      required this.text,
      this.color = Colors.grey,
      this.isUser = false});
}

class ChatMessageWidget extends StatelessWidget {
  final ChatMessage message;

  ChatMessageWidget({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: message.color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (message.isUser)
                Icon(Icons.account_circle, color: Colors.white),
              if (!message.isUser) Icon(Icons.android, color: Colors.white),
              SizedBox(
                width: 10,
              ), // Replace with your robot icon
              Text(
                message.sender,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 5.0),
          Text(
            message.text,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
