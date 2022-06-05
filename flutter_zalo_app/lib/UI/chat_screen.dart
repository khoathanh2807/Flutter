import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {

  const ChatScreen({Key? key, required this.recipientName}) : super(key: key);

  final String recipientName;

  @override
  State<ChatScreen> createState() => _ChatScreenState();

}

class _ChatScreenState extends State<ChatScreen> {

  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Scaffold(

        // resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,

        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xff252525),
          title: Text(widget.recipientName, maxLines: 1, overflow: TextOverflow.fade,),
          actions: [
            IconButton(
              icon: const Icon(Icons.call_outlined,),
              onPressed: () {
              },
            ),
            IconButton(
              icon: const Icon(Icons.videocam_outlined, size: 29,),
              onPressed: () {
              },
            ),
            IconButton(
              icon: const Icon(Icons.format_list_bulleted),
              onPressed: () {
              },
            ),
          ],
        ),

        body: StreamBuilder(

          stream: FirebaseFirestore.instance.collection('chats').orderBy('createdAt', descending: true,).snapshots(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> chatSnapshot) {
            if (chatSnapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text('Loading...', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500,),),
                    SizedBox(height: 45),
                    CircularProgressIndicator(color: Colors.white,),
                  ],
                ),
              );
            }
            final chatDocs = chatSnapshot.data.docs;
            if (chatDocs.isEmpty){
              return Center(
                child: Text('Say Hello to ${widget.recipientName}', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 23,),),
              );
            } else {
              return ListView.builder(
                // shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10,),
                reverse: true,
                itemCount: chatDocs.length,
                itemBuilder: (BuildContext context, int index) {
                  // print(chatDocs[index].id);
                  return MessageBubble(chatDocs[index]['text'], chatDocs[index]['userId'] == currentUser!.uid, key: ValueKey(chatDocs[index].id),);   // 'chatDocs[index].id' is ID of document
                },
              );
            }
          },

        ),

        bottomNavigationBar: BottomAppBar(
            elevation: 0,
            color: Color(0xff252525),
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                child: InputMessageBar(),
            ),
        ),

      ),
    );

  }

}

class MessageBubble extends StatelessWidget {

  MessageBubble(this.message, this.isMe, {required this.key});

  final String message;
  final bool isMe;
  final Key key;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isMe)
          Container(
              margin: EdgeInsets.only(top: 10,),
              decoration: const ShapeDecoration(
                shape: CircleBorder (
                  side: BorderSide(color: Colors.grey, width: 1, style: BorderStyle.solid,),
                ),
              ),
              child: const CircleAvatar(
                radius: 10,
                backgroundImage: NetworkImage('http://assets.stickpng.com/images/585e4bf3cb11b227491c339a.png'),
              ),
          ),
        if (!isMe)
          SizedBox(width: 10,),

        Container(
          width: message.length <= 10 ? 145 : message.length <= 20 ? 170 : message.length <= 30 ? 195 : 340,
          margin: EdgeInsets.symmetric(vertical: 5,),
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20,),
          decoration: BoxDecoration(
            color: isMe ? Colors.blueGrey[700] : Color(0xff323232),
            borderRadius: BorderRadius.circular(13),
          ),
          child: Text(message, style: TextStyle(fontSize: 16,),),
        ),

      ],
    );
  }
}

class InputMessageBar extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _InputMessageBarState();

}

class _InputMessageBarState extends State<InputMessageBar> {

  String _enteredMessage = '';

  final enteredMessageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        IconButton(
          icon: Icon(Icons.emoji_emotions_outlined, size: 25,),
          onPressed: () {
            print('Emoji');
          },
        ),
        SizedBox(width: 5,),

        Flexible(
          fit: FlexFit.tight,
          flex: 2,
          child: TextField(
            autofocus: true,
            controller: enteredMessageController,
            decoration: const InputDecoration(
              // contentPadding: EdgeInsets.only(top: 15,bottom: 40,),
              hintText: 'Messages',
              hintStyle: TextStyle(fontSize: 16, color: Colors.grey,),
              border: InputBorder.none,
            ),
            onChanged: (value) {
              setState(() {
                _enteredMessage = value.trim() as String;
              });
            },
          ),
        ),

        if (_enteredMessage == '')
          IconButton(
            icon: Icon(Icons.more_horiz_outlined, size: 28,),
            onPressed: () {
              print('More');
            },
          ),

        if (_enteredMessage == '')
          IconButton(
            icon: Icon(Icons.mic_none, size: 25,),
            onPressed: () {
              print('Microphone');
            },
          ),

        if (_enteredMessage == '')
          IconButton(
            icon: Icon(Icons.photo_outlined, size: 24,),
            onPressed: () {
              print('Photos');
            },
          ),

        if (_enteredMessage != '')
          IconButton(
            icon: Icon(Icons.send, color: Colors.blue, size: 25,),
            onPressed: _sendMessage,
          ),

      ],
    );
  }

  void _sendMessage() {

    // FocusScope.of(context).unfocus();

    FirebaseFirestore.instance.collection('chats').add({
      'text': _enteredMessage,
      'createdAt': Timestamp.now(),
      'userId': FirebaseAuth.instance.currentUser!.uid,
    });

    enteredMessageController.clear();

  }

}