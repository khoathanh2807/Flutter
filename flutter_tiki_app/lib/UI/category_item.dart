import 'package:flutter/material.dart';

import '../module/category.dart';

class CategoryItem extends StatelessWidget{

  Category category;
  CategoryItem(this.category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return InkWell(

      onTap: (){
        print("Tap: ${category.content}");
        Navigator.pushNamed(context, '/CategoryPage', arguments: {'category': category});
      },

      child: Container(

        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(category.image),
                fit: BoxFit.cover,
            ),
            // borderRadius: BorderRadius.circular(10),
        ),

        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(7),
            color: Colors.teal.withOpacity(.7),
            child: Text(category.content, style: const TextStyle(color: Colors.white, fontSize: 17,),),
          ),
        ),

      ),

    );

  }

}