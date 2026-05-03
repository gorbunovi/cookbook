//
// import 'package:cookbook/feature/presentation/calculator/controller/index.dart';
// import 'package:cookbook/servise_locator.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:cookbook/core/core.dart' as core_widgets;
//
// import '../widgets/calculator_widget.dart';
//
// class CalculatorPage extends StatelessWidget {
//   const CalculatorPage({Key? key}) : super(key: key);
//
//   Widget _buildBody(BuildContext context) {
//     return BlocBuilder<CalculatorsController, CalculatorState>(
//         builder: (context, state) {
//           return state.when(
//             initial: () => VinegarCalculator(),
//             catalog: () => core_widgets.LoadWidget(),
//             calculator: () => VinegarCalculator(),
//             loading: () => core_widgets.LoadWidget(),
//             empty: () => core_widgets.LoadWidget(),
//             error: (failure) => core_widgets.ErrorWidget(failure.message),
//           );
//         });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<CalculatorsController>(
//       create: (context) => sl<CalculatorsController>()..init(),
//       child: _buildBody(context),
//     );
//   }
// }
//
