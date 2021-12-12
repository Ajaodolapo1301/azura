


import 'package:azura_lab/core/error/failures.dart';
import 'package:azura_lab/core/usecases/usecase.dart';
import 'package:azura_lab/feature/home/domain/entities/sport_entity.dart';
import 'package:azura_lab/feature/home/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class GetSportUseCase implements UseCase<List<Sport>> {
  final SportRepository repository;

  GetSportUseCase(this.repository);

  @override
  Future<Either<Failure, List<Sport>>> call() async {
    return await repository.getSport();
  }
}