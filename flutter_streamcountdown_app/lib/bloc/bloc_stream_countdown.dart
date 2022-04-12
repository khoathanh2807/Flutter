import 'dart:async';

class BlocCountdown {

  int seconds = 120;
  StreamController _secondsStreamController = StreamController();

  Stream get secondsStream => _secondsStreamController.stream;
  StreamSink get secondsSink => _secondsStreamController.sink;

  BlocCountdown();

  Future decreaseSeconds() async {
    await Future.delayed(const Duration(seconds: 1));
    seconds--;
    // _secondsStreamController.sink.add(seconds);
    secondsSink.add(seconds);
  }

  countDown() async {
    for (var i = seconds; i > 0; i--) {
      await decreaseSeconds();
    }
  }

  void dispose() {
    _secondsStreamController.close();
  }

}
