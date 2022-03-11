import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_expressions/math_expressions.dart';

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

  void resultValue(String element, history) {
    try {
      Parser p = Parser();
      Expression exp = p.parse(state);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      if (state.isNotEmpty && exp != null) {
        emit(history + eval.toInt());
      }
    } catch (error) {
      print(error);
      // emit(element = 'Error');
      // emit(state = error.toString());
    }
  }

  // @override
  // void onTransition(Transition<int> transition) {
  //   print(transition);
  //   super.onTransition(transition);
  // }
}
