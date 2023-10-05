import 'package:cookbook/core/error/failure.dart';
import 'package:cookbook/core/services/rest/service/network_info.dart';
import 'package:cookbook/feature/data/datasources/save_cookbook/local/local_data_source.dart';
import 'package:cookbook/feature/data/datasources/save_cookbook/remote/remote_data_source.dart';
import 'package:cookbook/feature/domain/repositories/save_cookbook.dart';
import 'package:dartz/dartz.dart';

class SaveCookBookRepositoryImpl implements SaveCookBookRepository {
  SaveCookBookRepositoryImpl({
    required this.saveCookBookLocalDataSorce,
    required this.saveCookBookRemoteDataSource,
    required this.networkInfo,
  });

  final SaveCookBookLocalDataSorce saveCookBookLocalDataSorce;
  final SaveCookBookRemoteDataSource saveCookBookRemoteDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, bool>> saveCookBook() async {
    if (await networkInfo.isConnected) {
      try {
        final saveCookBook = await saveCookBookRemoteDataSource.saveCookBook();


        return const Right(true);
      } catch (e) {
        return const Right(false);
        // return Left(CacheFailure(''));
      }
    } else {
      try {
        return const Right(false);
      } catch (e) {
        return Left(CacheFailure('$e'));
      }
    }
  }
}
