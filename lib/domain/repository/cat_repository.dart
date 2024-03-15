import 'package:dartz/dartz.dart';
import 'package:gatitapp/domain/entities/cats.dart';

abstract class CatRepository{
  Future<Either<Exception, List<Cat>>> fetchCats();
}