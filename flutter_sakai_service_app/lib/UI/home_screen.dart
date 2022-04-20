import 'package:flutter/material.dart';

import './login_screen.dart';
import '../model/course.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<StatefulWidget> {

  @override
  Widget build(BuildContext context) {

    List<Course> courseList = ModalRoute.of(context)!.settings.arguments as List<Course>;
    print('arguments: courseList = $courseList');

    // assert(courseList != null);

    return Scaffold(

      appBar: AppBar(
        title: Text('Sakai Service App'),
        actions: [
          _logOut()
        ],
      ),

      body: ListView.separated(
          
          padding: EdgeInsets.all(30),

          itemCount: courseList.length,
          itemBuilder: (BuildContext context, int index) {

            var course = courseList[index];

            return ListTile(

              title: Text(course.title),

              subtitle: Container(
                // padding: const EdgeInsets.only(top: 5.0),
                child: ListBody(
                    children: [

                      Container(padding: EdgeInsets.only(top: 5.0),),
                      Text('${course.owner}'),

                      Container(padding: EdgeInsets.only(top: 5.0),),
                      Text('${course.url}'),

                    ],
                ),
              ),

            );

          },

          separatorBuilder: (BuildContext context, int index) => const Divider(),

      ),


    );

  }

  Widget _logOut() {

    return IconButton(

      icon: Icon(Icons.logout),
      tooltip: 'Log Out',
      onPressed: () {
        // Navigator.of(context).pushReplacementNamed('/login');
        // Navigator.pushReplacementNamed(context, '/login');
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      },

    );

  }

}