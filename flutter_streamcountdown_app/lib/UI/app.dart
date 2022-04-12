import 'package:flutter/material.dart';
import '../bloc/bloc_stream_countdown.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Countdown',
      home: HomeScreen(),
    );

  }

}

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() {
    return HomeScreenState();
  }

}

class HomeScreenState extends State<HomeScreen> {

  late BlocCountdown blocCountdown;
  late int seconds;

  @override
  void initState() {
    blocCountdown = BlocCountdown();
    seconds = blocCountdown.seconds;
    blocCountdown.countDown();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
          child: StreamBuilder(
            stream: blocCountdown.secondsStream,
            initialData: seconds,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

              if (snapshot.hasError) {
                print(snapshot.error);
              }

              if (snapshot.hasData) {
                return Center(
                  child: Text(
                    snapshot.data.toString(),
                    style: TextStyle(fontSize: 100),
                  ),
                );
              } else {
                return Center();
              }

            },
          )
      ),
    );

  }

}
