import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/calc/calc_bloc.dart';
import 'screens/calc_screen.dart';

class AppWidget extends StatefulWidget {
  const AppWidget();

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Scaffold(
        body: BlocProvider(
          create: (context) {
            return CalcBloc();
          },
          child: CalcScreen(),
        ),
      ),
    );
  }
}
