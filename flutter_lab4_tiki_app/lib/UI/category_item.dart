import 'package:flutter/material.dart';
import '../module/category.dart';
import '../module/product.dart';

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
                fit: BoxFit.cover
            ),
            borderRadius: BorderRadius.circular(10),
        ),

        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(8),
            color: Colors.teal.withOpacity(.7),
            child: Text(
              '${category.content}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),

      ),

    );

  }

}