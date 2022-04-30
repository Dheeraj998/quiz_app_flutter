import 'dart:async';

import 'package:flutter/material.dart';

class LinearProgressIndicatorApp extends StatefulWidget {
  const LinearProgressIndicatorApp({Key? key}) : super(key: key);

  @override
  State<LinearProgressIndicatorApp> createState() =>
      _LinearProgressIndicatorAppState();
}

class _LinearProgressIndicatorAppState
    extends State<LinearProgressIndicatorApp> {
  Timer? _timer;
  int _start = 20;
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
            print(_start);
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Woolha.com Flutter Tutorial'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LinearProgressIndicator(
                backgroundColor: Colors.cyanAccent,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
                value: _start.toDouble(),
              ),
              ElevatedButton(
                child: const Text('Start timer'),
                onPressed: () {
                  setState(() {
                    _start = 20;
                  });
                  startTimer();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
