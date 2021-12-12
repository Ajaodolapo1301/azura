



import 'package:azura_lab/core/error/failures.dart';
import 'package:azura_lab/feature/home/domain/entities/country_entity.dart';
import 'package:azura_lab/feature/home/domain/entities/leagues.dart';
import 'package:azura_lab/feature/home/domain/entities/sport_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SportRepository {
  Future<Either<Failure, List<Sport>>> getSport();
  Future<Either<Failure, List<Country>>> getCountry();
  Future<Either<Failure, List<Leagues>>> getLeaguesByCountry({sport, country});
}