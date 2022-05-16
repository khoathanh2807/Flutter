import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PollScreen extends StatefulWidget {

  @override
  _PollScreenState createState() => _PollScreenState();

}

class _PollScreenState extends State<PollScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

          appBar: AppBar(
            elevation: 0,
            title: const Text('Firebase Firestore'),
          ),

          body: Center(
                // padding: const EdgeInsets.all(30.0),
                child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                            const Text('What food do you like?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
                            SizedBox(height: 50,),

                            ElevatedButton(
                                    child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: const [
                                              Icon(Icons.icecream, size: 22),
                                              SizedBox(width: 15,),
                                              Text('Ice-cream'),
                                          ],
                                    ),
                                    style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 15.0, bottom: 15.0),
                                    ),
                                    onPressed: () {
                                      vote(false);
                                    },
                            ),
                            SizedBox(height: 50,),

                            ElevatedButton(
                                    child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: const [
                                              Icon(Icons.local_pizza, size: 22),
                                              SizedBox(width: 15,),
                                              Text('Pizza'),
                                          ],
                                    ),
                                    style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 15.0, bottom: 15.0),
                                    ),
                                    onPressed: () {
                                      vote(true);
                                    },
                            ),

                      ],
                ),
          ),

    );

  }

  Future vote(bool voteForPizza) async {

    FirebaseFirestore firestoreDatabase = FirebaseFirestore.instance;
    CollectionReference collection = firestoreDatabase.collection('poll');    // get collection 'poll'

    QuerySnapshot querySnapshot = await collection.get();
    List<QueryDocumentSnapshot> listDocuments = querySnapshot.docs;    // get all documents in collection 'poll', add them to list

    DocumentSnapshot document = listDocuments[0];    // get first document in collection 'poll'
    final id = document.id;                 // get ID of first document
    print('id = $id');

    if (voteForPizza) {
      int pizzaVotes = document.get('pizza');
      collection.doc(id).update({'pizza': ++pizzaVotes});
      Fluttertoast.showToast(msg: 'Pizza: $pizzaVotes', fontSize: 15, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.blue);
    } else {
      int icecreamVotes = document.get('icecream');
      collection.doc(id).update({'icecream': ++icecreamVotes});
      Fluttertoast.showToast(msg: 'Ice-cream: $icecreamVotes', fontSize: 15, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.blue);
    }

  }

}
