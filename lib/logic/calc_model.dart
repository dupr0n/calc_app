import 'package:equatable/equatable.dart';

class CalcModel extends Equatable {
  const CalcModel({
    this.firstOperand,
    this.oper,
    this.secondOperand,
    this.result,
  });

  final double firstOperand;
  final String oper;
  final double secondOperand;
  final double result;

  CalcModel copyWith({
    double Function() firstOperand,
    String Function() oper,
    double Function() secondOperand,
    double Function() result,
  }) {
    return CalcModel(
      firstOperand: firstOperand?.call() ?? this.firstOperand,
      oper: oper?.call() ?? this.oper,
      secondOperand: secondOperand?.call() ?? this.secondOperand,
      result: result?.call() ?? this.result,
    );
  }

  CalcModel.fromJson(Map<String, dynamic> json)
      : firstOperand = json['firstOperand'] as double,
        oper = json['operator'] as String,
        secondOperand = json['secondOperand'] as double,
        result = json['result'] as double;

  Map<String, dynamic> toJson() => {
        'firstOperand': firstOperand,
        'operator': oper,
        'secondOperand': secondOperand,
        'result': result,
      };

  @override
  String toString() {
    return "$firstOperand$oper$secondOperand=$result";
  }

  @override
  List<Object> get props => [firstOperand, oper, secondOperand, result];
}
