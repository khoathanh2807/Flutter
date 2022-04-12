import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../fake_data/fake_data.dart';
import './category_item.dart';

class CategoryScreen extends StatefulWidget {

  @override
  _CategoryScreenState createState() => _CategoryScreenState();

}

class _CategoryScreenState extends State<CategoryScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        flexibleSpace: ListView(

          padding: EdgeInsets.only(top: 33.5, left: 20, right: 20),

          children: [
            CupertinoSearchTextField(
              backgroundColor: Colors.white,
            ),
          ],

        ),

      ),

      body: ListView(

        // crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          GridView(
            padding: EdgeInsets.all(15),
            shrinkWrap: true,
            children: FAKE_CATEGORIES.map((e) => CategoryItem(e)).toList(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              childAspectRatio: 3/3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
          )
        ],

      ),

    );

  }

}
