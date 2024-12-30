import 'package:chat_app/constant.dart';
import 'package:chat_app/widget/chatbubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  static String id = 'ChatPage';
  CollectionReference messages =
      FirebaseFirestore.instance.collection(KmessagesCollections);
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            kLogo,
            height: 50,
          ),
          Text(
            'Chat',
            style:
                TextStyle(fontFamily: 'pacifico', fontWeight: FontWeight.bold),
          ),
        ]),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return Chatbubble();
            }),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: TextField(
              controller: controller,
              onSubmitted: (data) {
                messages.add({
                  'mesages': data,
                });
                controller.clear();
              },
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.send,
                  color: kPrimaryColor,
                ),
                hintText: 'Send Message...',
                hintStyle: TextStyle(
                    fontFamily: 'pacifico', fontWeight: FontWeight.bold),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
