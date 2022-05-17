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

        elevation: 0,

        flexibleSpace: const SafeArea(
          child: Center(
            child: Padding(

              padding: EdgeInsets.only(left: 20, right: 20),

              child: CupertinoSearchTextField(backgroundColor: Colors.white,),

            ),
          ),
        ),

      ),

      body: ListView(

        // crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          GridView(
            padding: const EdgeInsets.all(15),
            shrinkWrap: true,
            children: ProductCategories.map((e) => CategoryItem(e)).toList(),
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
