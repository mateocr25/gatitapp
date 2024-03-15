import 'package:dartz/dartz.dart';
import 'package:gatitapp/core/use_case.dart';
import 'package:gatitapp/domain/entities/cats.dart';
import 'package:gatitapp/domain/repository/cat_repository.dart';

class FetchCatsUseCase extends UseCase<List<Cat>, Unit>{

  final CatRepository _repository;

  FetchCatsUseCase({required CatRepository repository}) : _repository = repository;

  @override
  Future<Either<Exception, List<Cat>>> call(Unit params) {
    return _repository.fetchCats();
  }

}