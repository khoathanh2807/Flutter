import 'package:flutter/material.dart';
import 'dart:async';
import './login_screen.dart';
import './platform_alert.dart';

class StopwatchScreen extends StatefulWidget {

  static const route = '/stopwatch';

  @override
  State<StopwatchScreen> createState() {
    return StopwatchScreenState();
  }

}

class StopwatchScreenState extends State<StopwatchScreen> {

  // final formKey = GlobalKey<FormState>();

  int milliseconds = 0;
  int seconds = 0;
  late Timer timer;
  final laps = <int>[];
  bool isTicking = false;

  final itemHeight = 60.0;
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {

    final String email = ModalRoute.of(context)!.settings.arguments as String;
    // print('arguments: emailAddress = $email');

    return MaterialApp(

      title: 'Stopwatch App - Main Screen',

      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),

      home: Scaffold(

        appBar: AppBar(title: Text(email),),
        // backgroundColor: Colors.blueGrey,

        // body: Container(
          // color: Theme.of(context).primaryColor,
          // margin: EdgeInsets.all(20.0),
          // child: Column(
          // ),

        body: Column(
          children: [
            Expanded(child: _buildCounter(context)),
            Expanded(child: _buildLapDisplay()),
            // Expanded(child: _safeArea()),
          ],
        ),

        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.home),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(LoginScreen.route);
          },
        ),

      ),

    );

  }

  Widget _buildCounter(BuildContext context) {

    return Container(
          // color: Theme.of(context).primaryColor,
          color: Colors.teal,
          // margin: EdgeInsets.all(20.0),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text(
                'Lap ${laps.length + 1}',
                style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: Colors.white),
              ),
              Text(
                _secondsText(milliseconds),
                style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: Colors.white)
              ),
              SizedBox(height: 20),
              _buildControls()
            ],

          ),
    );

  }

  Row _buildControls() {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),

            child: Text('Start'),

            onPressed:
              isTicking ? null : _startTimer,

        ),

        SizedBox(width: 20),
        ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black54),
            ),

            child: Text('Lap'),

            onPressed:
              isTicking ? _lap : null,

        ),

        SizedBox(width: 20),
        Builder(
            builder: (context) => TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),

                child: Text('Stop'),

                onPressed:
                  isTicking ? () => _stopTimer(context) : null,

            )
        )

      ],
    );

  }

  Widget _buildLapDisplay() {
    return Scrollbar(
        child: ListView.builder(
          controller: scrollController,
          itemExtent: itemHeight,
          itemCount: laps.length,
          itemBuilder: (context, index) {
              final milliseconds = laps[index];
              return ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 50),
                title: Text('Lap ${index + 1}'),
                trailing: Text(_secondsText(milliseconds)),
              );
          },
        )
    );
  }

  String _secondsText(int milliseconds) {
    final seconds = milliseconds / 1000;
    print('seconds = $seconds');

    return '$seconds seconds';
  }

  void _startTimer() {
    timer = Timer.periodic(Duration(milliseconds: 100), _onTick);
    setState(() {
      milliseconds = 0;
      laps.clear();
      isTicking = true;
    });
  }

  void _stopTimer(BuildContext context) {

    timer.cancel();
    setState(() {
      isTicking = false;
    });

    final controller = showBottomSheet(context: context, builder: _buildRunCompleteSheet);

    Future.delayed(Duration(seconds: 15)).then((_) {
      controller.close();
    });

    int totalRuntime = 0;
    laps.forEach((e) =>  totalRuntime += e);
    totalRuntime += milliseconds;
    print('STOP: milliseconds = $milliseconds');
    print('STOP: totalRuntime = $totalRuntime');

    final alert = PlatformAlert(
      title: 'Run Completed!',
      message: 'Total Run Time of all lap(s) is ${_secondsText(totalRuntime)}.',
    );
    alert.show(context);

  }

  void _onTick(Timer time) {
    setState(() {
      milliseconds += 100;
    });
  }

  void _lap() {
    scrollController.animateTo(
      itemHeight * laps.length,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
    setState(() {
      laps.add(milliseconds);
      milliseconds = 0;
      print('Lap ${laps.length}');
    });
  }

  Widget _buildRunCompleteSheet(BuildContext context) {
    // final totalRuntime = laps.fold(milliseconds, (total, lap) =>
    // int.parse((total ?? '0') as String) + lap);
    // final totalRuntime = laps.fold(milliseconds, (total, lap) => total + lap);
    int totalRuntime = 0;
    laps.forEach((e) =>  totalRuntime += e);

    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
        child: Container(
          color: Theme.of(context).cardColor,
          width: double.infinity,
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30.0),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                      Text('Run Finished!', style: textTheme.headline6),
                      Text('Total Run Time of ${laps.length} lap(s) is ${_secondsText(totalRuntime)}.')
                  ]
              )
          ),
        )
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

}