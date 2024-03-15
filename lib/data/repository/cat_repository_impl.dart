import 'package:dartz/dartz.dart';
import 'package:gatitapp/data/datasources/cats_datasource.dart';
import 'package:gatitapp/domain/entities/cats.dart';
import 'package:gatitapp/domain/repository/cat_repository.dart';

class CatRepositoryImpl extends CatRepository {
  final CatsDataSource _dataSource;

  CatRepositoryImpl({required CatsDataSource dataSource})
      : _dataSource = dataSource;

  @override
  Future<Either<Exception, List<Cat>>> fetchCats() async {
    try {
      final response = await _dataSource.fetchCats();
      return Right(response);
    } catch (error) {
      return Left(Exception(error.toString()));
    }
  }
}
