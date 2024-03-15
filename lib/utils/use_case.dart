import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Params> {
  const UseCase();

  Future<Either<Exception, Type>> call(Params params);
}