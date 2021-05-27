import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class CalcEvent extends Equatable {
  const CalcEvent();
}

class NumPressed extends CalcEvent {
  const NumPressed({@required this.number}) : assert(number != null);

  final double number;
  @override
  List<Object> get props => [number];
}

class OperPressed extends CalcEvent {
  const OperPressed({@required this.oper}) : assert(oper != null);

  final String oper;
  @override
  List<Object> get props => [oper];
}

class DotPressed extends CalcEvent {
  const DotPressed();

  @override
  List<Object> get props => [];
}

class CalcResult extends CalcEvent {
  const CalcResult();

  @override
  List<Object> get props => [];
}

class ClearCalc extends CalcEvent {
  const ClearCalc();

  @override
  List<Object> get props => [];
}
