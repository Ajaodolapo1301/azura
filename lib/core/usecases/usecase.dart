import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failures.dart';

abstract class UseCase<Type> {
  Future<Either<Failure, Type>> call();
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
