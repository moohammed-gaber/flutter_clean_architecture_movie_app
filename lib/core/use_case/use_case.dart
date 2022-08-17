import 'package:clean_arch_movie_app/core/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class FailureUseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class FutureUseCase<Type, Params> {
  Future<Type> call(Params params);
}

abstract class UseCase<Type, Params> {
  Type call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
