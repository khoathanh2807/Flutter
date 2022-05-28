import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {

  const ChatScreen({Key? key, required this.recipient}) : super(key: key);

  final String recipient;

  @override
  State<ChatScreen> createState() => _ChatScreenState();

}

class _ChatScreenState extends State<ChatScreen> {

  // get recipientName => widget.recipient;

  String messageTyping = '';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Scaffold(

        // resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,

        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xff252525),
          title: Text(widget.recipient),
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

        body: Center(
            child: SingleChildScrollView(

                    child: Text("Say Hello!", style: TextStyle(fontSize: 25),),

            ),
        ),

        bottomNavigationBar: BottomAppBar(
            elevation: 0,
            color: Color(0xff252525),
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                child: Row(
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
                            decoration: const InputDecoration(
                              // contentPadding: EdgeInsets.only(top: 15,bottom: 40,),
                              hintText: 'Messages',
                              hintStyle: TextStyle(fontSize: 16, color: Colors.grey,),
                              border: InputBorder.none,
                            ),
                            onChanged: (value) {
                              setState(() {
                                messageTyping = value.trim() as String;
                              });
                            },
                          ),
                        ),

                        if (messageTyping == '')
                          IconButton(
                            icon: Icon(Icons.more_horiz_outlined, size: 28,),
                            onPressed: () {
                              print('More');
                            },
                          ),

                        if (messageTyping == '')
                          IconButton(
                            icon: Icon(Icons.mic_none, size: 25,),
                            onPressed: () {
                              print('Microphone');
                            },
                          ),

                        if (messageTyping == '')
                          IconButton(
                            icon: Icon(Icons.photo_outlined, size: 24,),
                            onPressed: () {
                              print('Photos');
                            },
                          ),

                        if (messageTyping != '')
                          IconButton(
                            icon: Icon(Icons.send, color: Colors.blue, size: 25,),
                            onPressed: () {
                              print('Send message');
                            },
                          ),

                    ],
                ),
            ),
        ),

      ),
    );

  }

}