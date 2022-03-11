// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:cubit/cubit.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:math_expressions/math_expressions.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  bool openHistoryMenu = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String history = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: openHistoryMenu == true
          ? Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width / 1.5,
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'asdfasdf',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'asdf',
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            )
          : null,
      body: CubitBuilder<CounterCubit, String>(
        builder: ((_, index) => Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 100.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                index.toString(),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 48),
                              ),
                              // SizedBox(height: 10),
                              // Text(
                              //   index.toString(),
                              // ),
                            ],
                          ),
                        ),

                        //  Text(
                        //   index.toString(),
                        //   style: index.length < 10
                        //       ? TextStyle(
                        //           color: Colors.black,
                        //           fontSize: 48,
                        //         )
                        //       : TextStyle(
                        //           color: Colors.black,
                        //           fontSize: 40,
                        //         ),
                        // ),
                      ),
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 10),
                    TextButton(
                      style: TextButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                        shadowColor: Colors.transparent,
                      ),
                      onPressed: () {
                        _scaffoldKey.currentState?.openDrawer();
                        setState(() {
                          openHistoryMenu != openHistoryMenu;
                        });
                      },
                      child: Text(
                        'журнал'.toUpperCase(),
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                    const SizedBox(width: 30),
                    IconButton(
                        splashRadius: 0.1,
                        splashColor: Colors.transparent,
                        onPressed: () {},
                        icon: const Icon(Icons.drive_file_rename_outline_sharp),
                        color: Colors.grey),
                    const Spacer(),
                    const SizedBox(width: 20),
                    IconButton(
                      splashRadius: 0.1,
                      splashColor: Colors.transparent,
                      onPressed: () =>
                          context.cubit<CounterCubit>().removeLast(),
                      icon: const Icon(Icons.backspace_outlined),
                      color: Colors.blue,
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ButtonWidget(
                      textColor: Colors.red,
                      onDoubleTap: (text) {},
                      onPressed: (element) =>
                          context.cubit<CounterCubit>().allClear(element),
                      text: 'C',
                    ),
                    ButtonWidget(
                      textColor: Colors.blue,
                      onDoubleTap: (element) =>
                          context.cubit<CounterCubit>().closeBrackets(element),
                      onPressed: (element) =>
                          context.cubit<CounterCubit>().openBrackets(element),
                      text: '(  )',
                    ),
                    ButtonWidget(
                      textColor: Colors.blue,
                      onDoubleTap: (text) {},
                      onPressed: (element) =>
                          context.cubit<CounterCubit>().input(element),
                      text: '%',
                    ),
                    ButtonWidget(
                      textColor: Colors.blue,
                      textSize: 32,
                      onDoubleTap: (text) {},
                      onPressed: (element) =>
                          context.cubit<CounterCubit>().input('/'),
                      text: '÷',
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ButtonWidget(
                      onDoubleTap: (text) {},
                      onPressed: (element) =>
                          context.cubit<CounterCubit>().input(element),
                      text: '7',
                    ),
                    ButtonWidget(
                      onDoubleTap: (text) {},
                      onPressed: (element) =>
                          context.cubit<CounterCubit>().input(element),
                      text: '8',
                    ),
                    ButtonWidget(
                      onDoubleTap: (text) {},
                      onPressed: (element) =>
                          context.cubit<CounterCubit>().input(element),
                      text: '9',
                    ),
                    ButtonWidget(
                      textSize: 20,
                      textColor: Colors.blue,
                      onDoubleTap: (text) {},
                      onPressed: (element) =>
                          context.cubit<CounterCubit>().input('*'),
                      text: 'X',
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ButtonWidget(
                      onDoubleTap: (text) {},
                      onPressed: (element) =>
                          context.cubit<CounterCubit>().input(element),
                      text: '4',
                    ),
                    ButtonWidget(
                      onDoubleTap: (text) {},
                      onPressed: (element) =>
                          context.cubit<CounterCubit>().input(element),
                      text: '5',
                    ),
                    ButtonWidget(
                      onDoubleTap: (text) {},
                      onPressed: (element) =>
                          context.cubit<CounterCubit>().input(element),
                      text: '6',
                    ),
                    ButtonWidget(
                      onDoubleTap: (text) {},
                      textColor: Colors.blue,
                      textSize: 40,
                      onPressed: (element) =>
                          context.cubit<CounterCubit>().input(element),
                      text: '-',
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ButtonWidget(
                      onDoubleTap: (text) {},
                      onPressed: (element) =>
                          context.cubit<CounterCubit>().input(element),
                      text: '1',
                    ),
                    ButtonWidget(
                      onDoubleTap: (text) {},
                      onPressed: (element) =>
                          context.cubit<CounterCubit>().input(element),
                      text: '2',
                    ),
                    ButtonWidget(
                      onDoubleTap: (text) {},
                      onPressed: (element) =>
                          context.cubit<CounterCubit>().input(element),
                      text: '3',
                    ),
                    ButtonWidget(
                      textColor: Colors.blue,
                      onDoubleTap: (text) {},
                      onPressed: (element) =>
                          context.cubit<CounterCubit>().input(element),
                      text: '+',
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ButtonWidget(
                      textColor: Colors.black,
                      onDoubleTap: (element) =>
                          context.cubit<CounterCubit>().reversePlus(element),
                      onPressed: (element) =>
                          context.cubit<CounterCubit>().reverseMinus(element),
                      text: '+/-',
                    ),
                    ButtonWidget(
                      onDoubleTap: (text) {},
                      onPressed: (element) =>
                          context.cubit<CounterCubit>().input(element),
                      text: '0',
                    ),
                    ButtonWidget(
                      textColor: Colors.black,
                      onDoubleTap: (text) {},
                      onPressed: (element) =>
                          context.cubit<CounterCubit>().input('.'),
                      text: ',',
                    ),
                    ButtonWidget(
                      backgroundColor: Colors.blue,
                      textColor: Colors.white,
                      textSize: 38,
                      onDoubleTap: (text) {},
                      onPressed: (element) {
                        context.cubit<CounterCubit>().resultValue(element);
                      },
                      text: '=',
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}

class CounterCubit extends Cubit<String> {
  CounterCubit() : super(' ');

  void openBrackets(String element) {
    emit(state + '(');
  }

  void closeBrackets(String element) {
    emit(state + ')');
  }

  void reverseMinus(String element) {
    try {
      Parser p = Parser();
      Expression exp = p.parse(state);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      if (state.isNotEmpty && exp != null) {
        final reverse = -eval.abs();
        emit(element = reverse.toString());
      }
    } catch (e) {
      print(e);
    }
  }

  void reversePlus(String element) {
    try {
      Parser p = Parser();
      Expression exp = p.parse(state);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      if (state.isNotEmpty && exp != null) {
        final reverse = eval.abs();
        emit(element = reverse.toString());
      }
    } catch (e) {
      print(e);
    }
  }

  void input(String element) {
    if (state.endsWith('r')) {
      emit(element = ' ');
    } else {
      emit(state + element);
    }
  }

  void removeLast() {
    if (state.isNotEmpty) {
      String result = state.substring(0, state.length - 1);
      emit(result);
      if (state == '') {
        emit(state + '0');
      }
    }
  }

  void allClear(String element) {
    emit(element = ' ');
  }

  void resultValue(String element) {
    try {
      Parser p = Parser();
      Expression exp = p.parse(state);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      if (state.isNotEmpty && exp != null) {
        emit(eval.toString());
      }
    } catch (error) {
      print(error);
    }
  }
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final int? width;
  final int textSize;
  final bool border;
  final Function onPressed;
  final Function onDoubleTap;
  const ButtonWidget(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.width,
      this.textColor = Colors.grey,
      this.backgroundColor = Colors.white,
      this.textSize = 22,
      this.border = true,
      required this.onDoubleTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onDoubleTap: () {
          onDoubleTap(text);
        },
        onTap: () {
          onPressed(text);
        },
        child: Container(
          height: 70,
          width: width?.toDouble(),
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(0),
              border: border == true
                  ? Border.all(color: Colors.blue.shade50, width: 0.8)
                  : null),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: textSize.toDouble(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
