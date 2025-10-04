import 'package:cookbook/feature/presentation/calculator/controller/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorsController extends Cubit<CalculatorState>{
  CalculatorsController():super(Initial());

  Future<void> init() async{
    final currentState = state;
    emit(const Loading());
    if(currentState is Loading) return;

    emit(Calculator());

  }
}