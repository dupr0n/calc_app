import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'calc_event.dart';
import 'calc_state.dart';

export 'calc_event.dart';
export 'calc_state.dart';

class CalcBloc extends Bloc<CalcEvent, CalcState> {
  CalcBloc() : super(const CalcInitial());

  @override
  Stream<CalcState> mapEventToState(
    CalcEvent event,
  ) async* {
    if (event is NumPressed) {
      yield await _mapNumberPressedToState(event);
    } else if (event is OperPressed) {
      yield await _mapOperatorPressedToState(event);
    } else if (event is DotPressed) {
    } else if (event is CalcResult) {
      yield* _mapCalculateResultToState(event);
    } else if (event is ClearCalc) {
      final resultModel = const CalcInitial().calcModel.copyWith();
      yield CalcChanged(calcModel: resultModel);
    }
  }

  Future<CalcState> _mapNumberPressedToState(
    NumPressed event,
  ) async {
    final model = state.calcModel;
    if (model.result != null) {
      final newModel = model.copyWith(firstOperand: () => event.number, result: () => null);
      return CalcChanged(calcModel: newModel);
    } else if (model.firstOperand == null) {
      final newModel = model.copyWith(firstOperand: () => event.number);
      return CalcChanged(calcModel: newModel);
    } else if (model.oper == null) {
      final newModel = model.copyWith(
          firstOperand: () => double.parse('${model.firstOperand * 10 + event.number}'));
      return CalcChanged(calcModel: newModel);
    } else if (model.secondOperand == null) {
      final newModel = model.copyWith(secondOperand: () => event.number);
      return CalcChanged(calcModel: newModel);
    } else {
      return CalcChanged(
        calcModel: model.copyWith(
          secondOperand: () => double.parse('${model.secondOperand * 10 + event.number}'),
        ),
      );
    }
  }

  Future<CalcState> _mapOperatorPressedToState(
    OperPressed event,
  ) async {
    final allowedOperators = ['+', '-', '*', '/'];
    if (!allowedOperators.contains(event.oper)) {
      return state;
    } else {
      final model = state.calcModel;
      final newModel = state.calcModel
          .copyWith(firstOperand: () => model.firstOperand ?? 0, oper: () => event.oper);
      return CalcChanged(calcModel: newModel);
    }
  }

  Stream<CalcState> _mapCalculateResultToState(
    CalcResult event,
  ) async* {
    double result = 0;
    final model = state.calcModel;
    if (model.oper == null || model.secondOperand == null) {
      yield state;
      return;
    }
    switch (model.oper) {
      case '+':
        result = model.firstOperand + model.secondOperand;
        break;
      case '-':
        result = model.firstOperand - model.secondOperand;
        break;
      case '*':
        result = model.firstOperand * model.secondOperand;
        break;
      case '/':
        if (model.secondOperand == 0) {
          result = 0;
        } else {
          result = model.firstOperand / model.secondOperand;
        }
        break;
    }
    final newModel = const CalcInitial().calcModel.copyWith(firstOperand: () => result);
    yield CalcChanged(calcModel: newModel);
  }

  @override
  void onChange(Change<CalcState> change) {
    log(change.currentState.calcModel.toString());
    log(change.nextState.calcModel.toString());
    super.onChange(change);
  }
}
