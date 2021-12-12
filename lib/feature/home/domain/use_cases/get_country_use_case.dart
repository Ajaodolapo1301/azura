
import 'package:azura_lab/core/error/failures.dart';
import 'package:azura_lab/core/usecases/usecase.dart';
import 'package:azura_lab/feature/home/domain/entities/country_entity.dart';

import 'package:azura_lab/feature/home/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class GetCountryUseCase implements UseCase<List<Country>> {
  final SportRepository repository;

  GetCountryUseCase(this.repository);

  @override
  Future<Either<Failure, List<Country>>> call() async {
    return await repository.getCountry();
  }
}