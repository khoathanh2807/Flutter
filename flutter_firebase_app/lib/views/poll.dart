import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PollScreen extends StatefulWidget {
  @override
  _PollScreenState createState() => _PollScreenState();
}

class _PollScreenState extends State<PollScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Poll'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(96.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [Icon(Icons.icecream), Text('Ice-cream')]),
                  onPressed: () {
                    vote(false);
                  },
                ),
                ElevatedButton(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [Icon(Icons.local_pizza), Text('Pizza')]),
                  onPressed: () {
                    vote(true);
                  },
                ),
              ]),
        ));
  }

  Future vote(bool voteForPizza) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference collection = db.collection('poll');
    QuerySnapshot snapshot = await collection.get();

    List<QueryDocumentSnapshot> list = snapshot.docs;

    DocumentSnapshot document = list[0];
    final id = document.id;

    if (voteForPizza) {
      int pizzaVotes = document.get('pizza');
      collection.doc(id).update({'pizza': ++pizzaVotes});
    } else {
      int icecreamVotes = document.get('icecream');
      collection.doc(id).update({'icecream': ++icecreamVotes});
    }
  }
}
