import 'package:flutter/material.dart';

class ProgressIndicatorDemo extends StatefulWidget {
  const ProgressIndicatorDemo({Key? key}) : super(key: key);

  @override
  _ProgressIndicatorDemoState createState() => _ProgressIndicatorDemoState();
}

class _ProgressIndicatorDemoState extends State<ProgressIndicatorDemo>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 20), vsync: this);
    animation = Tween(begin: 1.0, end: 0.0).animate(controller!)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    controller!.repeat();
  }

  @override
  void dispose() {
    controller!.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: LinearProgressIndicator(
        value: animation!.value,
      ),
    ));
  }
}
