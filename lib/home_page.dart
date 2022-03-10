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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CubitBuilder<CounterCubit, String>(
        builder: ((_, index) => Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1.toInt(),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          index.toString(),
                          style: const TextStyle(
                              color: Colors.black, fontSize: 48),
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 20),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'журнал'.toUpperCase(),
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                    const SizedBox(width: 30),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.drive_file_rename_outline_sharp),
                        color: Colors.grey),
                    const Spacer(),
                    const SizedBox(width: 20),
                    IconButton(
                        onPressed: () =>
                            context.cubit<CounterCubit>().removeLast(),
                        icon: const Icon(Icons.backspace_outlined),
                        color: Colors.blue),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ButtonWidget(
                      textColor: Colors.red,
                      onPressed: (element) =>
                          context.cubit<CounterCubit>().allClear(element),
                      text: 'C',
                    ),
                    ButtonWidget(
                      textColor: Colors.blue,
                      onPressed: (element) =>
                          context.cubit<CounterCubit>().input(element),
                      text: '(',
                    ),
                    ButtonWidget(
                      textColor: Colors.blue,
                      onPressed: (element) =>
                          context.cubit<CounterCubit>().input(element),
                      text: '%',
                    ),
                    ButtonWidget(
                      textColor: Colors.blue,
                      onPressed: (element) =>
                          context.cubit<CounterCubit>().input(element),
                      text: '/',
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ButtonWidget(
                      onPressed: (element) =>
                          context.cubit<CounterCubit>().input(element),
                      text: '7',
                    ),
                    ButtonWidget(
                      onPressed: (element) =>
                          context.cubit<CounterCubit>().input(element),
                      text: '8',
                    ),
                    ButtonWidget(
                      onPressed: (element) =>
                          context.cubit<CounterCubit>().input(element),
                      text: '9',
                    ),
                    ButtonWidget(
                      textColor: Colors.blue,
                      onPressed: (element) =>
                          context.cubit<CounterCubit>().input(element),
                      text: 'X',
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ButtonWidget(
                      onPressed: (element) =>
                          context.cubit<CounterCubit>().input(element),
                      text: '4',
                    ),
                    ButtonWidget(
                      onPressed: (element) =>
                          context.cubit<CounterCubit>().input(element),
                      text: '5',
                    ),
                    ButtonWidget(
                      onPressed: (element) =>
                          context.cubit<CounterCubit>().input(element),
                      text: '6',
                    ),
                    ButtonWidget(
                      textColor: Colors.blue,
                      textSize: 30,
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
                      onPressed: (element) =>
                          context.cubit<CounterCubit>().input(element),
                      text: '1',
                    ),
                    ButtonWidget(
                      onPressed: (element) =>
                          context.cubit<CounterCubit>().input(element),
                      text: '2',
                    ),
                    ButtonWidget(
                      onPressed: (element) =>
                          context.cubit<CounterCubit>().input(element),
                      text: '3',
                    ),
                    ButtonWidget(
                      textColor: Colors.blue,
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
                      onPressed: (element) =>
                          context.cubit<CounterCubit>().input(element),
                      text: '+/-',
                    ),
                    ButtonWidget(
                      onPressed: (element) =>
                          context.cubit<CounterCubit>().input(element),
                      text: '0',
                    ),
                    ButtonWidget(
                      textColor: Colors.black,
                      onPressed: (element) {
                        print('error');
                        context.cubit<CounterCubit>().input(element);
                      },
                      text: ',',
                    ),
                    ButtonWidget(
                      backgroundColor: Colors.blue,
                      textColor: Colors.white,
                      textSize: 38,
                      onPressed: (element) =>
                          context.cubit<CounterCubit>().resultValue(),
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
  CounterCubit() : super('0');

  void input(element) {
    print(state.toString().endsWith("("));
    emit(state + element);
  }

  void removeLast() {
    if (state.isNotEmpty) {
      String result = state.substring(0, state.length - 1);
      emit(result);
    }
  }

  void allClear(String element) {
    emit(element = '');
  }

  void resultValue() {
    Parser p = Parser();
    Expression exp = p.parse(state);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    if (state.isNotEmpty && exp != null) {
      emit(eval.toString());
    } else {
      print('error');
    }
  }

  // @override
  // void onTransition(Transition<int> transition) {
  //   print(transition);
  //   super.onTransition(transition);
  // }
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final int? width;
  final int textSize;
  final Function onPressed;
  final bool border;
  const ButtonWidget(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.width,
      this.textColor = Colors.grey,
      this.backgroundColor = Colors.white,
      this.textSize = 22,
      this.border = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
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
