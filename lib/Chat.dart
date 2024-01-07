import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodie/Firestore/Services/ChatService.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodie/Riverpod.dart';
import 'package:riverpod/riverpod.dart';

class ChatScreen extends ConsumerWidget {
  final ChatService chatService = ChatService();
  final String chatId;

  ChatScreen({required this.chatId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user =
        ref.watch(userProvider); /* 
    print('user');
    print(user); */

    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Room'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: chatService.getMessagesStream(chatId),
              builder: (context,
                  AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                      snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                final chat = snapshot.data?.data() ??
                    {}; /* 
                print('chat');
                print(chat); */
                final messages = chat[
                    'messages']; /* 
                print('messages');
                print(messages); */

                return ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index] as Map<String, dynamic>;
                    print('user["id"] : ' + user['id']);
                    print('message["userId"] : ' + message['userId']);

                    if (user['id'] == message['userId']) {
                      return ChatBubble(
                        clipper:
                            ChatBubbleClipper1(type: BubbleType.sendBubble),
                        alignment: Alignment.topRight,
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.only(
                          left: 10,
                          top: 10,
                          right: 30,
                          bottom: 10,
                        ),
                        backGroundColor: Colors.blue,
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.7,
                          ),
                          child: Text(
                            message['text'],
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    } else {
                      return ChatBubble(
                        clipper:
                            ChatBubbleClipper1(type: BubbleType.receiverBubble),
                        backGroundColor: Color(0xffE7E7ED),
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.only(
                          left: 30,
                          top: 10,
                          right: 10,
                          bottom: 10,
                        ),
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.7,
                          ),
                          child: Text(
                            message['text'],
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ),

          // Add a text input field and a button for sending messages
          // Call chatService.sendMessage(chatId, text) when the button is pressed
        ],
      ),
    );
  }
}
