import 'package:chat_app/widgets/chat_messages.dart';
import 'package:chat_app/widgets/new_message.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firebase = FirebaseAuth.instance;

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  void _logout() async {
    try {
      await _firebase.signOut();
    } on FirebaseAuthException catch (error) {
      // If you want to handle specific errors in different ways check the error.code
      // if (error.code == 'email-already-in-use') {

      // }

      if (mounted) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.message ?? 'Logout Failed'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Chat'),
        actions: [
          IconButton(
            onPressed: _logout,
            icon: const Icon(Icons.exit_to_app),
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
      body: const SafeArea(
        bottom: true,
        top: true,
        child: Column(
          children: [
            Expanded(
              child: ChatMessages(),
            ),
            NewMessage(),
          ],
        ),
      ),
    );
  }
}
