import 'package:azura_lab/core/error/failures.dart';
import 'package:azura_lab/core/network/network_info.dart';
import 'package:azura_lab/feature/home/data/data_source/remote_data_source.dart';
import 'package:azura_lab/feature/home/domain/entities/country_entity.dart';
import 'package:azura_lab/feature/home/domain/entities/leagues.dart';
import 'package:azura_lab/feature/home/domain/entities/sport_entity.dart';
import 'package:azura_lab/feature/home/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class SportRepositoryImpl extends SportRepository {
  final AbstractSport abstractSportDataSource;

  final NetworkInfo networkInfo;

  SportRepositoryImpl({this.abstractSportDataSource, this.networkInfo});

  @override
  Future<Either<Failure, List<Sport>>> getSport() async {
    if (await networkInfo.isConnected) {
      var res = await abstractSportDataSource.getSports();
      if (res["error"] == false) {
        return Right(res["sport"]);
      } else {
        return Left(ServerFailure(res["message"] ?? "An Error Occurred"));
      }
    } else {
      return Left(ServerFailure("No internet access"));
    }
  }


  @override
  Future<Either<Failure, List<Country>>> getCountry() async{
    if (await networkInfo.isConnected) {
      var res = await abstractSportDataSource.getCountry();
      if (res["error"] == false) {
        return Right(res["countryModel"]);
      } else {
        return Left(ServerFailure(res["message"] ?? "An Error Occurred"));
      }
    } else {
      return Left(ServerFailure("No internet access"));
    }
  }


  @override
  Future<Either<Failure, List<Leagues>>> getLeaguesByCountry({sport, country}) async{
    if (await networkInfo.isConnected) {
      var res = await abstractSportDataSource.getLeaguesByCountry(sport: sport, country: country);
      if (res["error"] == false) {
        return Right(res["leagues"]);
      } else {
        return Left(ServerFailure(res["message"] ?? "An Error Occurred"));
      }
    } else {
      return Left(ServerFailure("No internet access"));
    }
  }
}
