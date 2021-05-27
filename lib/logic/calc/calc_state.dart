import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../calc_model.dart';

abstract class CalcState extends Equatable {
  const CalcState({
    @required this.calcModel,
  }) : assert(calcModel != null);

  final CalcModel calcModel;

  @override
  List<Object> get props => [calcModel];
}

class CalcInitial extends CalcState {
  const CalcInitial() : super(calcModel: const CalcModel());
}

class CalcChanged extends CalcState {
  const CalcChanged({
    @required this.calcModel,
  })  : assert(calcModel != null),
        super(calcModel: calcModel);

  final CalcModel calcModel;

  @override
  List<Object> get props => [calcModel];
}
