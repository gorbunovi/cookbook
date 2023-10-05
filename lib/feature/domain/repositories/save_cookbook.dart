import 'package:dartz/dartz.dart';
import 'package:cookbook/core/error/failure.dart';

abstract class SaveCookBookRepository{
  Future<Either<Failure,bool>> saveCookBook();
}