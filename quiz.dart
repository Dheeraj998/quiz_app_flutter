import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app_bloc/controller/pagechange/pagechange_cubit.dart';
import 'package:quiz_app_bloc/models/data_resp/TestModel.dart';
import 'package:quiz_app_bloc/screens/resultScreen.dart';

class Quiz extends StatefulWidget {
  Quiz(
      {Key? key,
      required this.fetchedData,
      required this.pageIndex,
      required this.colors,
      required this.size,
      required this.totalCount,
      required this.count,
      required this.ctx})
      : super(key: key);

  final List<TestModel> fetchedData;
  int pageIndex;
  final List<MaterialColor> colors;
  final Size size;
  final Function totalCount;
  final int count;
  final BuildContext ctx;
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> with SingleTickerProviderStateMixin {
  var colors1 = [
    Colors.blue,
    Colors.cyan,
    Colors.orange,
    Colors.red,
  ];
  Color? changeColor;
  bool isPressed = false;
  int? selectedIndex;
  Timer? _timer;

  int marKcount = 0;
  double value = 0;
  List<bool> showQty = [];
  int updatedPageIndex = 0;
  AnimationController? controller;
  Animation<double>? animation;
  int count = 0;

  double? _startt;
  final double _progress = 0;
  //  var screenHeight = window.physicalSize.height / window.devicePixelRatio;
  void startTimer(BuildContext context) {
    // _startt = widget.fetchedData[widget.pageIndex].time! * 30;
    _startt = MediaQuery.of(widget.ctx).size.width;
    double _value = MediaQuery.of(widget.ctx).size.width;
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_startt! < 0) {
          if (widget.pageIndex >= 5) {
            timer.cancel();
          }
          setState(() {
            widget.pageIndex += 1;
            if (widget.pageIndex >= 5) {
              _timer?.cancel();

              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => ResultScreen(totalCount: marKcount)));
            }
            if (widget.pageIndex < 5) {
              startTimer(widget.ctx);
            } else {
              timer.cancel();
            }
          });
          print(_startt);
        } else {
          setState(() {
            _startt = (_startt! -
                (_value / widget.fetchedData[widget.pageIndex].time!));
            print(_startt);
          });
        }
      },
    );
  }

  @override
  void initState() {
    startTimer(widget.ctx);
  }
  //   _start = widget.fetchedData[widget.pageIndex].time;

  //   controller =
  //       AnimationController(duration: Duration(seconds: _start!), vsync: this);
  //   animation = Tween(begin: 1.0, end: 0.0).animate(controller!)
  //     ..addListener(() {
  //       setState(() {});
  //     });

  //   controller!.repeat();

  //   super.initState();
  // }

  // changeIndex() {
  //   setState(() {
  //     widget.pageIndex = widget.pageIndex + 1;
  //   });
  // }
  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          width: sizeWidth,
          decoration: BoxDecoration(
              border: Border.all(
                  width: 1, color: const Color.fromARGB(255, 19, 7, 21))),
          child: Align(
            alignment: Alignment.topLeft,
            child: AnimatedContainer(
              decoration: BoxDecoration(
                  color: _startt! < 150
                      ? Colors.red
                      : _startt! < 300
                          ? Colors.yellow
                          : Colors.green,
                  border: Border.all(width: 2, color: Colors.black)),
              height: 5,
              width: _startt!.toDouble(),
              duration: const Duration(milliseconds: 1000),
            ),
          ),
        ),
        // LinearProgressIndicator(
        //   backgroundColor: Colors.cyanAccent,
        //   valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
        //   value: controller!.value,
        // ),
        Container(
          height: 35,
          width: double.infinity,
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Container(
                    color: Colors.grey[600],
                    child: FittedBox(
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            isPressed = !isPressed;
                          });
                        },
                        icon: Icon(
                          isPressed == false ? Icons.play_arrow : Icons.pause,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Container(
                    color: Colors.grey[800],
                    child: FittedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(
                          widget.count.toString() +
                              "/" +
                              widget.fetchedData.length.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    height: 35,
                    width: 150,
                    color: Colors.grey[900],
                    child: Row(children: const [
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: FittedBox(
                            child: Text(
                          'streak',
                          style: TextStyle(color: Colors.white),
                        )),
                      )
                    ]),
                  ),
                ),
                const Spacer(),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Container(
                    height: 35,
                    width: 110,
                    color: Colors.grey[900],
                    child: FittedBox(
                      child: Row(children: const [
                        Icon(Icons.medical_services),
                        Icon(Icons.remove),
                        VerticalDivider(
                          thickness: 5,
                          indent: 1.0,
                          color: Colors.black,
                        ),
                        Icon(
                          Icons.money,
                          color: Colors.orange,
                        ),
                        Text(
                          '0',
                          style: TextStyle(color: Colors.white),
                        )
                      ]),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 3,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Container(
                    height: 35,
                    width: 15,
                    color: Colors.grey[900],
                    child: const FittedBox(child: Icon(Icons.square)),
                  ),
                )
              ],
            ),
          ),
        ),

        // Container(
        //  800  )),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            height: 500,
            width: double.infinity,
            color: const Color.fromARGB(255, 28, 4, 57),
            child: Center(
                child: Text(
              widget.fetchedData[widget.pageIndex].question ?? '',
              style: const TextStyle(color: Colors.white, fontSize: 25),
            )),
          ),
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: widget.fetchedData[widget.pageIndex].options?.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () async {
                  await Future.delayed(const Duration(seconds: 1));
                  startTimer(context);
                  widget.totalCount(widget.fetchedData[widget.pageIndex]
                          .options?[index].correct ??
                      false);

                  setState(() {
                    if (widget.fetchedData[widget.pageIndex].options?[index]
                            .correct ==
                        true) {
                      marKcount += 1;
                    }
                  });
                  if (!mounted) return;
                  // startTimer(index, widget.fetchedData);
                  setState(() {
                    isPressed = true;
                  });
                  // selectedIndex = widget
                  //     .fetchedData[widget.pageIndex].options![index].optionId!;
                  selectedIndex = index;
                  if (isPressed = true &&
                      widget.fetchedData[widget.pageIndex].options![index]
                              .correct ==
                          true) {
                    setState(() {
                      widget.colors[index] = Colors.green;
                    });
                  } else if (isPressed = true &&
                      widget.fetchedData[widget.pageIndex].options![index]
                              .correct !=
                          true) {
                    setState(() {
                      widget.colors[index] = Colors.red;
                    });
                  }
                  final snackBar = SnackBar(
                    backgroundColor: widget.fetchedData[widget.pageIndex]
                                .options![index].correct ==
                            true
                        ? Colors.green
                        : Colors.red,
                    duration: const Duration(seconds: 3),
                    content: SizedBox(
                      height: 19,
                      width: double.infinity,
                      child: FittedBox(
                        child: Center(
                          child: Text(
                            widget.fetchedData[widget.pageIndex].options![index]
                                .correct
                                .toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  await Future.delayed(const Duration(seconds: 3));
                  setState(() {
                    isPressed = false;
                    selectedIndex = null;
                  });
                  context.read<PagechangeCubit>().changePage();
                  setState(() {
                    widget.colors[index] = colors1[index];
                  });
                },
                child: selectedIndex == null
                    ? Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                              height: 250,
                              width: widget.size.width * .23,
                              color: widget.colors[index],
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(4),
                                        child: Container(
                                            height: 15,
                                            width: 15,
                                            color: colors1[index][900],
                                            child: FittedBox(
                                                child: Text(
                                              '${index + 1}',
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ))),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 60,
                                  ),
                                  Center(
                                    child: Text(
                                      widget.fetchedData[widget.pageIndex]
                                              .options?[index].option ??
                                          '',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            height: 250,
                            width: widget.size.width * .23,
                            color: (selectedIndex == index &&
                                    (widget.fetchedData[widget.pageIndex]
                                            .options?[selectedIndex!].correct ==
                                        true)
                                ? Colors.green
                                : (selectedIndex == index &&
                                        (widget
                                                .fetchedData[widget.pageIndex]
                                                .options?[selectedIndex!]
                                                .correct ==
                                            false)
                                    ? Colors.red
                                    : const Color.fromARGB(255, 28, 4, 57))),
                            // : widget.fetchedData[widget.pageIndex]
                            //             .options?[selectedIndex! - 1].correct ==
                            //         true
                            //     ? Colors.green
                            //     : Colors.red,
                            child: Center(
                              child: Text(
                                widget.fetchedData[widget.pageIndex]
                                        .options?[index].option ??
                                    '',
                                style: TextStyle(
                                  color: (selectedIndex == index &&
                                          (widget
                                                  .fetchedData[widget.pageIndex]
                                                  .options?[selectedIndex!]
                                                  .correct ==
                                              true)
                                      ? Colors.white
                                      : (selectedIndex == index &&
                                              (widget
                                                      .fetchedData[
                                                          widget.pageIndex]
                                                      .options?[selectedIndex!]
                                                      .correct ==
                                                  false)
                                          ? Colors.white
                                          : const Color.fromARGB(
                                              255, 28, 4, 57))),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 43,
        )
      ],
    );
  }
}
