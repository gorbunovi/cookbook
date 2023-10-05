import 'package:cookbook/core/error/failure.dart';
import 'package:cookbook/core/usecase/usecase.dart';
import 'package:cookbook/feature/domain/repositories/save_cookbook.dart';
import 'package:dartz/dartz.dart';

class SaveCookbook extends UseCaseNoParams<bool>{
  SaveCookbook(this.saveCookBookRepository);

  final SaveCookBookRepository saveCookBookRepository;

  @override
  Future<Either<Failure, bool>> call() async {
    try{
      return saveCookBookRepository.saveCookBook();
    } catch(e){
      return Left(CacheFailure(e.toString()));
    }
  }
}