import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/post.dart';

class TimelineScreen extends StatefulWidget {

  @override
  State<TimelineScreen> createState() => _TimelineScreenState();

}

class _TimelineScreenState extends State<TimelineScreen> {

  final currentUser = FirebaseAuth.instance.currentUser;

  List<Post> postList = <Post>[
    Post(
        userDisplayName: 'Zalo User 99',
        userPhotoURL: 'http://assets.stickpng.com/images/585e4bf3cb11b227491c339a.png',
        postingTime: 'Today at 09:00',
        contentText: null,
        contentPhotoURL: 'https://media.baobinhphuoc.com.vn/upload/news/12_2021/tuyen_viet_nam_king_01_14365630122021.jpg',
        isLiked: true,
        likeAmount: 4,
        commentAmount: 7,
    ),
    Post(
        userDisplayName: 'Zalo User 100',
        userPhotoURL: 'http://assets.stickpng.com/images/585e4bf3cb11b227491c339a.png',
        postingTime: 'Yesterday at 13:30',
        contentText: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, '
                     'when an unknown printer took a galley of type and scrambled it to make a type specimen book. '
                     'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. '
                     'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, '
                     'and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
        contentPhotoURL: 'https://www.postplanner.com/hubfs/how%20to%20write%20a%20facebook%20post.jpg',
        isLiked: false,
        likeAmount: 33,
        commentAmount: 99,
    ),
    Post(
        userDisplayName: 'Zalo User 101',
        userPhotoURL: 'http://assets.stickpng.com/images/585e4bf3cb11b227491c339a.png',
        postingTime: 'May 22 at 11:00',
        contentText: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, '
                     'making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, '
                     'consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.',
        contentPhotoURL: null,
        isLiked: false,
        likeAmount: 11,
        commentAmount: 24,
    ),
  ];

  // bool isLiked = false;

  @override
  Widget build(BuildContext context) {

    String photoURL = currentUser!.photoURL ?? '';

    return  Scaffold(

      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff252525),
        // flexibleSpace: const SafeArea(
        //   child: Center(
        //     child: Padding(
        //       padding: EdgeInsets.only(left: 20, right: 20),
        //       child: CupertinoTheme(
        //         data: CupertinoThemeData(
        //           brightness: Brightness.dark,
        //         ),
        //         child: CupertinoSearchTextField(),
        //       ),
        //     ),
        //   ),
        // ),
        leading: Row(
          children: const [
            SizedBox(width: 25,),
            Icon(Icons.search, size: 26)
          ],
        ),
        title: const TextField(
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: TextStyle(fontSize: 19),
            border: InputBorder.none,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_note),
            onPressed: () {

            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {

            },
          ),
        ],
      ),

      body: SingleChildScrollView(

          child: Column(
            children: [

              Container(
                color: Color(0xff181818),
                child: Column(
                  children: [

                      // Row(
                      //   children: [
                      //     Container(
                      //       decoration: const ShapeDecoration(
                      //           shape: CircleBorder (
                      //               side: BorderSide(color: Colors.white, width: 1, style: BorderStyle.solid,),
                      //           ),
                      //       ),
                      //       child: const CircleAvatar(
                      //         radius: 22,
                      //         backgroundImage: NetworkImage('http://assets.stickpng.com/images/585e4bf3cb11b227491c339a.png'),
                      //       ),
                      //     ),
                      //     SizedBox(width: 22,),
                      //     Text('How are you today?', style: TextStyle(fontSize: 18, color: Colors.grey,),)
                      //   ],
                      // ),

                      SizedBox(height: 10,),

                      ListTile(
                          leading: Container(
                            decoration: const ShapeDecoration(
                              shape: CircleBorder (
                                side: BorderSide(color: Colors.grey, width: 1, style: BorderStyle.solid,),
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 23,
                              backgroundImage: photoURL != '' ? NetworkImage(photoURL) : NetworkImage('http://assets.stickpng.com/images/585e4bf3cb11b227491c339a.png'),
                            ),
                          ),
                          title: const TextField(
                            decoration: InputDecoration(
                              hintText: 'How are you today?',
                              hintStyle: TextStyle(fontSize: 17,),
                              border: InputBorder.none,
                            ),
                          ),
                      ),
                      SizedBox(height: 5,),

                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Color(0xff424242)),
                              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 0, horizontal: 30)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              ),
                            ),
                            child: Row(
                              children: const [
                                Icon(Icons.image, color: Colors.lightGreen, size: 21),
                                SizedBox(width: 5,),
                                Text('Photo', style: TextStyle(color: Colors.white, fontSize: 12,),)
                              ],
                            ),
                            onPressed: () {
                            },
                          ),
                          SizedBox(width: 5,),

                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Color(0xff424242)),
                              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 0, horizontal: 30)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              ),
                            ),
                            child: Row(
                              children: const [
                                Icon(Icons.videocam, color: Colors.redAccent, size: 23,),
                                SizedBox(width: 5,),
                                Text('Video', style: TextStyle(color: Colors.white, fontSize: 12,),)
                              ],
                            ),
                            onPressed: () {
                            },
                          ),
                          SizedBox(width: 5,),

                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Color(0xff424242)),
                              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 0, horizontal: 30)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              ),
                            ),
                            child: Row(
                              children: const [
                                Icon(Icons.photo_album, color: Colors.blue, size: 19,),
                                SizedBox(width: 5,),
                                Text('Album', style: TextStyle(color: Colors.white, fontSize: 12,),)
                              ],
                            ),
                            onPressed: () {
                            },
                          ),

                        ],
                      ),
                      SizedBox(height: 15,),

                  ],
                ),
              ),

              const Divider(
                height: 0,
                color: Colors.black,
                thickness: 8,
              ),

              Container(
                color: Color(0xff181818),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Padding(
                      padding: EdgeInsets.only(top: 12, bottom: 15, left: 20,),
                      child: Text("Story", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                    ),

                    // SingleChildScrollView(
                    //   scrollDirection: Axis.horizontal,
                    //   child:
                    // ),

                    SizedBox(
                        height: 160,
                        child: ListView.builder(

                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          primary: false,
                          shrinkWrap: true,   // make ListView to use a little space as possible

                          itemCount: 9,
                          itemBuilder: (BuildContext context, int index) {

                            return Container(

                                margin: const EdgeInsets.only(left: 8, right: 8),
                                width: 100,

                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    image: DecorationImage(
                                        image: NetworkImage('https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/271da6e7-c07f-4f9c-a0b7-0ca034d5282d/dcmv3gu-fefe0cc4-daf4-4bd1-a36e-473d59d1fb4e.jpg/v1/fill/w_774,h_1033,q_70,strp/pretty_sunset_by_theawesomeg_dcmv3gu-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTM2NiIsInBhdGgiOiJcL2ZcLzI3MWRhNmU3LWMwN2YtNGY5Yy1hMGI3LTBjYTAzNGQ1MjgyZFwvZGNtdjNndS1mZWZlMGNjNC1kYWY0LTRiZDEtYTM2ZS00NzNkNTlkMWZiNGUuanBnIiwid2lkdGgiOiI8PTEwMjQifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.FyyeA2wVQT80qH3JTpXiZg5BkEHq_ihG6ZDXBlNpK6U'),
                                        fit: BoxFit.cover,
                                    ),
                                ),

                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [

                                        const CircleAvatar(
                                            radius: 16,
                                            backgroundImage: NetworkImage('http://assets.stickpng.com/images/585e4bf3cb11b227491c339a.png'),
                                        ),
                                        SizedBox(height: 8,),

                                        Text('Zalo User ${index + 1}', style: TextStyle(fontSize: 12),),
                                        SizedBox(height: 9,),

                                    ],
                                ),

                            );

                          },

                        ),
                    ),
                    SizedBox(height: 20,),

                  ],
                ),
              ),

              const Divider(
                height: 0,
                color: Colors.black,
                thickness: 8,
              ),

              // Container(
              //   color: Color(0xff181818),
              //   child: Column(
              //     children: [
              //
              //       // ListTile(
              //       //
              //       //   leading: const CircleAvatar(
              //       //     radius: 27,
              //       //     backgroundImage: NetworkImage('http://assets.stickpng.com/images/585e4bf3cb11b227491c339a.png'),
              //       //   ),
              //       //
              //       //   title: Row(
              //       //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       //     children: <Widget>[
              //       //       const Text(
              //       //         'Zalo User',
              //       //         maxLines: 1,
              //       //         overflow: TextOverflow.ellipsis,
              //       //         style: TextStyle(fontWeight: FontWeight.bold),
              //       //       ),
              //       //       IconButton(
              //       //         icon: Icon(Icons.more_horiz),
              //       //         onPressed: () {
              //       //         },
              //       //       ),
              //       //     ],
              //       //   ),
              //       //
              //       //   subtitle: Container(
              //       //     padding: const EdgeInsets.only(top: 5.0),
              //       //     child: const Text(
              //       //       'Today at 10:10',
              //       //       maxLines: 1,
              //       //       overflow: TextOverflow.ellipsis,
              //       //       style: TextStyle(color: Colors.grey, fontSize: 13,),
              //       //     ),
              //       //   ),
              //       //
              //       //   onTap: () {
              //       //   },
              //       //
              //       // ),
              //
              //       SizedBox(height: 13),
              //
              //       Row(
              //             children: [
              //
              //               SizedBox(width: 15,),
              //
              //               const CircleAvatar(
              //                   radius: 23,
              //                   backgroundImage: NetworkImage('http://assets.stickpng.com/images/585e4bf3cb11b227491c339a.png'),
              //               ),
              //               SizedBox(width: 20,),
              //
              //               Expanded(
              //                   flex: 2,
              //                   child: Column(
              //                     mainAxisAlignment: MainAxisAlignment.center,
              //                     crossAxisAlignment: CrossAxisAlignment.start,
              //                     children: const [
              //                       Text(
              //                           'Zalo User 99',
              //                           maxLines: 1,
              //                           overflow: TextOverflow.ellipsis,
              //                           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),
              //                       ),
              //                       SizedBox(height: 6,),
              //                       Text(
              //                         'Today at 09:00',
              //                         maxLines: 1,
              //                         overflow: TextOverflow.ellipsis,
              //                         style: TextStyle(color: Colors.grey, fontSize: 12,),
              //                       )
              //                     ],
              //                   ),
              //               ),
              //
              //               IconButton(
              //                 icon: Icon(Icons.more_horiz),
              //                 onPressed: () {
              //                 },
              //               ),
              //               SizedBox(width: 15,),
              //
              //             ],
              //       ),
              //       SizedBox(height: 18),
              //
              //       Image.network('https://media.baobinhphuoc.com.vn/upload/news/12_2021/tuyen_viet_nam_king_01_14365630122021.jpg'),
              //
              //       const Divider(
              //         height: 0,
              //         color: Colors.grey,
              //         thickness: 0.1,
              //       ),
              //
              //       Row(
              //           children: [
              //             SizedBox(width: 2,),
              //
              //             IconButton(
              //               alignment: Alignment.centerRight,
              //               padding: EdgeInsets.only(right: 5),
              //               icon: isLiked ? Icon(Icons.favorite, size: 23, color: Colors.red,) : Icon(Icons.favorite_border, size: 23,),
              //               onPressed: () {
              //                 setState(() {
              //                   isLiked = !isLiked;
              //                 });
              //               },
              //             ),
              //             Text('4', style: TextStyle(fontSize: 15,),),
              //             SizedBox(width: 5,),
              //
              //             IconButton(
              //               alignment: Alignment.centerRight,
              //               padding: EdgeInsets.only(right: 5),
              //               icon: Icon(Icons.textsms_outlined, size: 23,),
              //               onPressed: () {
              //               },
              //             ),
              //             Text('7', style: TextStyle(fontSize: 15,),),
              //             Spacer(),
              //
              //             Text('Liked by', style: TextStyle(fontSize: 12, color: Colors.grey,),),
              //             SizedBox(width: 10,),
              //
              //             const CircleAvatar(
              //               radius: 8,
              //               backgroundImage: NetworkImage('http://assets.stickpng.com/images/585e4bf3cb11b227491c339a.png'),
              //             ),
              //             const CircleAvatar(
              //               radius: 8,
              //               backgroundImage: NetworkImage('http://assets.stickpng.com/images/585e4bf3cb11b227491c339a.png'),
              //             ),
              //             SizedBox(width: 16,),
              //           ],
              //       ),
              //       SizedBox(height: 8),
              //
              //     ],
              //   ),
              // ),
              //
              // const Divider(
              //   height: 0,
              //   color: Colors.black,
              //   thickness: 8,
              // ),
              //
              // Container(
              //   color: Color(0xff181818),
              //   child: Column(
              //     children: [
              //
              //       SizedBox(height: 13),
              //
              //       Row(
              //           children: [
              //
              //             SizedBox(width: 15,),
              //
              //             const CircleAvatar(
              //               radius: 23,
              //               backgroundImage: NetworkImage('http://assets.stickpng.com/images/585e4bf3cb11b227491c339a.png'),
              //             ),
              //             SizedBox(width: 20,),
              //
              //             Expanded(
              //               flex: 2,
              //               child: Column(
              //                 mainAxisAlignment: MainAxisAlignment.center,
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: const [
              //                   Text(
              //                     'Zalo User 100',
              //                     maxLines: 1,
              //                     overflow: TextOverflow.ellipsis,
              //                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),
              //                   ),
              //                   SizedBox(height: 6,),
              //                   Text(
              //                     'Yesterday at 13:30',
              //                     maxLines: 1,
              //                     overflow: TextOverflow.ellipsis,
              //                     style: TextStyle(color: Colors.grey, fontSize: 12,),
              //                   )
              //                 ],
              //               ),
              //             ),
              //
              //             IconButton(
              //               icon: Icon(Icons.more_horiz),
              //               onPressed: () {
              //               },
              //             ),
              //             SizedBox(width: 15,),
              //
              //           ],
              //       ),
              //       SizedBox(height: 18,),
              //
              //       const Padding(
              //           padding: EdgeInsets.only(left: 20, right: 20),
              //           child: Text(
              //             'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, '
              //                 'when an unknown printer took a galley of type and scrambled it to make a type specimen book. '
              //                 'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. '
              //                 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, '
              //                 'and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'
              //           ),
              //       ),
              //       SizedBox(height: 20,),
              //
              //       Image.network('https://www.postplanner.com/hubfs/how%20to%20write%20a%20facebook%20post.jpg'),
              //
              //       const Divider(
              //         height: 0,
              //         color: Colors.grey,
              //         thickness: 0.1,
              //       ),
              //
              //       Row(
              //           children: [
              //             SizedBox(width: 2,),
              //
              //             IconButton(
              //               alignment: Alignment.centerRight,
              //               padding: EdgeInsets.only(right: 5),
              //               icon: Icon(Icons.favorite_border, size: 23,),
              //               onPressed: () {
              //               },
              //             ),
              //             Text('33', style: TextStyle(fontSize: 15,),),
              //             SizedBox(width: 5,),
              //
              //             IconButton(
              //               alignment: Alignment.centerRight,
              //               padding: EdgeInsets.only(right: 5),
              //               icon: Icon(Icons.textsms_outlined, size: 23,),
              //               onPressed: () {
              //               },
              //             ),
              //             Text('99', style: TextStyle(fontSize: 15,),),
              //             Spacer(),
              //
              //             Text('Liked by', style: TextStyle(fontSize: 12, color: Colors.grey,),),
              //             SizedBox(width: 10,),
              //
              //             const CircleAvatar(
              //               radius: 8,
              //               backgroundImage: NetworkImage('http://assets.stickpng.com/images/585e4bf3cb11b227491c339a.png'),
              //             ),
              //             const CircleAvatar(
              //               radius: 8,
              //               backgroundImage: NetworkImage('http://assets.stickpng.com/images/585e4bf3cb11b227491c339a.png'),
              //             ),
              //             SizedBox(width: 16,),
              //           ],
              //       ),
              //       SizedBox(height: 8),
              //
              //     ],
              //   ),
              // ),
              //
              // const Divider(
              //   height: 0,
              //   color: Colors.black,
              //   thickness: 8,
              // ),
              //
              // Container(
              //   color: Color(0xff181818),
              //   child: Column(
              //         children: [
              //
              //           SizedBox(height: 13),
              //
              //           Row(
              //               children: [
              //
              //                 SizedBox(width: 15,),
              //
              //                 const CircleAvatar(
              //                   radius: 23,
              //                   backgroundImage: NetworkImage('http://assets.stickpng.com/images/585e4bf3cb11b227491c339a.png'),
              //                 ),
              //                 SizedBox(width: 20,),
              //
              //                 Expanded(
              //                   flex: 2,
              //                   child: Column(
              //                     mainAxisAlignment: MainAxisAlignment.center,
              //                     crossAxisAlignment: CrossAxisAlignment.start,
              //                     children: const [
              //                       Text(
              //                         'Zalo User 101',
              //                         maxLines: 1,
              //                         overflow: TextOverflow.ellipsis,
              //                         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),
              //                       ),
              //                       SizedBox(height: 6,),
              //                       Text(
              //                         'May 22 at 11:00',
              //                         maxLines: 1,
              //                         overflow: TextOverflow.ellipsis,
              //                         style: TextStyle(color: Colors.grey, fontSize: 12,),
              //                       )
              //                     ],
              //                   ),
              //                 ),
              //
              //                 IconButton(
              //                   icon: Icon(Icons.more_horiz),
              //                   onPressed: () {
              //                   },
              //                 ),
              //                 SizedBox(width: 15,),
              //
              //               ],
              //           ),
              //           SizedBox(height: 18,),
              //
              //           const Padding(
              //             padding: EdgeInsets.only(left: 20, right: 20),
              //             child: Text(
              //                 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, '
              //                     'making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, '
              //                     'consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.'
              //             ),
              //           ),
              //           SizedBox(height: 20,),
              //
              //           const Divider(
              //             height: 0,
              //             color: Colors.grey,
              //             thickness: 0.1,
              //           ),
              //
              //           Row(
              //               children: [
              //                 SizedBox(width: 2,),
              //
              //                 IconButton(
              //                   alignment: Alignment.centerRight,
              //                   padding: EdgeInsets.only(right: 5),
              //                   icon: Icon(Icons.favorite_border, size: 23,),
              //                   onPressed: () {
              //                   },
              //                 ),
              //                 Text('11', style: TextStyle(fontSize: 15,),),
              //                 SizedBox(width: 5,),
              //
              //                 IconButton(
              //                   alignment: Alignment.centerRight,
              //                   padding: EdgeInsets.only(right: 5),
              //                   icon: Icon(Icons.textsms_outlined, size: 23,),
              //                   onPressed: () {
              //                   },
              //                 ),
              //                 Text('24', style: TextStyle(fontSize: 15,),),
              //                 Spacer(),
              //
              //                 Text('Liked by', style: TextStyle(fontSize: 12, color: Colors.grey,),),
              //                 SizedBox(width: 10,),
              //
              //                 const CircleAvatar(
              //                   radius: 8,
              //                   backgroundImage: NetworkImage('http://assets.stickpng.com/images/585e4bf3cb11b227491c339a.png'),
              //                 ),
              //                 const CircleAvatar(
              //                   radius: 8,
              //                   backgroundImage: NetworkImage('http://assets.stickpng.com/images/585e4bf3cb11b227491c339a.png'),
              //                 ),
              //                 SizedBox(width: 16,),
              //               ],
              //           ),
              //           SizedBox(height: 8),
              //
              //         ],
              //   ),
              // ),

              ListView.separated(

                physics: const NeverScrollableScrollPhysics(),
                primary: false,
                shrinkWrap: true,
                itemCount: postList.length,
                itemBuilder: (BuildContext context, int index) {

                  String userDisplayName = postList[index].userDisplayName;
                  String userPhotoURL = postList[index].userPhotoURL;
                  String postingTime = postList[index].postingTime;
                  String? contentText = postList[index].contentText;
                  String? contentPhotoURL = postList[index].contentPhotoURL;
                  int likeAmount = postList[index].likeAmount;
                  int commentAmount = postList[index].commentAmount;

                  return Container(
                    color: Color(0xff181818),
                    child: Column(
                      children: [

                        SizedBox(height: 13),

                        Row(
                          children: [

                            SizedBox(width: 15,),

                            CircleAvatar(
                              radius: 23,
                              backgroundImage: NetworkImage(userPhotoURL),
                            ),
                            SizedBox(width: 20,),

                            Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    userDisplayName,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),
                                  ),
                                  SizedBox(height: 6,),
                                  Text(
                                    postingTime,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.grey, fontSize: 12,),
                                  )
                                ],
                              ),
                            ),

                            IconButton(
                              icon: Icon(Icons.more_horiz),
                              onPressed: () {
                              },
                            ),
                            SizedBox(width: 15,),

                          ],
                        ),
                        SizedBox(height: 18,),

                        if (contentText != null)
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Text(contentText),
                          ),
                        if (contentText != null)
                          SizedBox(height: 20,),

                        if (contentPhotoURL != null)
                          Image.network(contentPhotoURL),

                        const Divider(
                          height: 0,
                          color: Colors.grey,
                          thickness: 0.1,
                        ),

                        Row(
                          children: [
                            SizedBox(width: 2,),

                            IconButton(
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.only(right: 5),
                              icon: postList[index].isLiked! ? Icon(Icons.favorite, size: 23, color: Colors.red,) : Icon(Icons.favorite_border, size: 23,),
                              onPressed: () {
                                print('Pressed Like Button');
                                setState(() {
                                  postList[index].isLiked = !postList[index].isLiked!;
                                  postList[index].isLiked! ? ++postList[index].likeAmount : --postList[index].likeAmount;
                                });
                              },
                            ),
                            Text(likeAmount.toString(), style: TextStyle(fontSize: 15,),),
                            SizedBox(width: 5,),

                            IconButton(
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.only(right: 5),
                              icon: Icon(Icons.textsms_outlined, size: 23,),
                              onPressed: () {
                              },
                            ),
                            Text(commentAmount.toString(), style: TextStyle(fontSize: 15,),),
                            Spacer(),

                            Text('Liked by', style: TextStyle(fontSize: 12, color: Colors.grey,),),
                            SizedBox(width: 10,),

                            const CircleAvatar(
                              radius: 8,
                              backgroundImage: NetworkImage('http://assets.stickpng.com/images/585e4bf3cb11b227491c339a.png'),
                            ),
                            const CircleAvatar(
                              radius: 8,
                              backgroundImage: NetworkImage('http://assets.stickpng.com/images/585e4bf3cb11b227491c339a.png'),
                            ),
                            SizedBox(width: 16,),
                          ],
                        ),
                        SizedBox(height: 8),

                      ],
                    ),
                  );

                },
                separatorBuilder: (BuildContext context, int index) => const Divider(
                  height: 0,
                  color: Colors.black,
                  thickness: 8,
                ),
              ),

              const Divider(
                height: 0,
                color: Colors.black,
                thickness: 8,
              ),

            ],
          ),

      ),

    );

  }

}
