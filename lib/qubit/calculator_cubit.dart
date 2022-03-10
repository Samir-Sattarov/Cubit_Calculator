import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorCubit extends Cubit<String> {
  CalculatorCubit() : super('0');

  void increment(element) => emit(state + element);

  /// Decrements the [Cubit] state by 1.
  void decrement(String element) {
    List<String> c = element.split("");

    emit(c.removeLast());
  }

  void allClear(String element) {
    emit(element = ' ');
    emit(element = '');
    // setState(() {
    //   history = ' ';
    //   result = ' ';
    // });
  }

  void resultValue(String element) {
    Parser p = Parser();
    Expression exp = p.parse(element);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    if (element.isNotEmpty && exp != null) {
      emit(eval.toString());
    } else {
      print('error');
    }
  }

  // @override
  // void onTransition(Transition<int> transition) {
  //   /// Log all state changes (transitions).
  //   print(transition);
  //   super.onTransition(transition);
  // }
}
