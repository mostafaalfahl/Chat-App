import 'package:chat_app/constant.dart';
import 'package:flutter/material.dart';

class Chatbubble extends StatelessWidget {
  const Chatbubble({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(32),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
          color: kPrimaryColor,
        ),
        child: Text(
          'I\'m a new user',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
