import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/calc/calc_bloc.dart';
import '../widgets/calc_button_widget.dart';
import '../logic/calc_model.dart';
import '../widgets/result_widget.dart';

class CalcScreen extends StatefulWidget {
  @override
  _CalcScreenState createState() => _CalcScreenState();
}

class _CalcScreenState extends State<CalcScreen> {
  double width = 0.0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalcBloc, CalcState>(
      builder: (context, CalcState state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 4,
              child: ResultWidget(text: _getDisplayText(state.calcModel)),
            ),
            // const Spacer(),
            Expanded(
              flex: 2,
              child: CalcButtonWidget(
                label: 'C',
                onTap: clear,
                backgroundColor: const Color.fromRGBO(220, 220, 220, 1),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  CalcButtonWidget(label: '7', onTap: () => numPressed(7)),
                  CalcButtonWidget(label: '8', onTap: () => numPressed(8)),
                  CalcButtonWidget(label: '9', onTap: () => numPressed(9)),
                  CalcButtonWidget(
                    label: '/',
                    onTap: () => operPressed('/'),
                    backgroundColor: const Color.fromRGBO(220, 220, 220, 1),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  CalcButtonWidget(label: '4', onTap: () => numPressed(4)),
                  CalcButtonWidget(label: '5', onTap: () => numPressed(5)),
                  CalcButtonWidget(label: '6', onTap: () => numPressed(6)),
                  CalcButtonWidget(
                    label: 'x',
                    onTap: () => operPressed('*'),
                    backgroundColor: const Color.fromRGBO(220, 220, 220, 1),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  CalcButtonWidget(label: '1', onTap: () => numPressed(1)),
                  CalcButtonWidget(label: '2', onTap: () => numPressed(2)),
                  CalcButtonWidget(label: '3', onTap: () => numPressed(3)),
                  CalcButtonWidget(
                    label: '-',
                    onTap: () => operPressed('-'),
                    backgroundColor: const Color.fromRGBO(220, 220, 220, 1),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  CalcButtonWidget(
                    label: '=',
                    onTap: calcResult,
                    backgroundColor: Colors.orange,
                    labelColor: Colors.white,
                  ),
                  CalcButtonWidget(label: '0', onTap: () => numPressed(0)),
                  CalcButtonWidget(
                    label: '.',
                    onTap: () {},
                  ),
                  CalcButtonWidget(
                    label: '+',
                    onTap: () => operPressed('+'),
                    backgroundColor: const Color.fromRGBO(220, 220, 220, 1),
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        );
      },
    );
  }

  void numPressed(int number) =>
      BlocProvider.of<CalcBloc>(context).add(NumPressed(number: number.toDouble()));
  void operPressed(String oper) => BlocProvider.of<CalcBloc>(context).add(OperPressed(oper: oper));
  void calcResult() => BlocProvider.of<CalcBloc>(context).add(const CalcResult());
  void clear() => BlocProvider.of<CalcBloc>(context).add(const ClearCalc());
  String _getDisplayText(CalcModel model) {
    if (model.result != null) {
      return '${model.result}';
    } else if (model.secondOperand != null) {
      return '${model.firstOperand}${model.oper}${model.secondOperand}';
    } else if (model.oper != null) {
      return '${model.firstOperand}${model.oper}';
    } else if (model.firstOperand != null) {
      return '${model.firstOperand}';
    } else {
      return "${model.result ?? 0}";
    }
  }
}
