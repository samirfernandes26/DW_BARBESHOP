import 'package:dw_barbershop/src/core/fp/either.dart';
import 'package:dw_barbershop/src/model/barbershop_model.dart';
import 'package:dw_barbershop/src/model/user_model.dart';
import 'package:dw_barbershop/src/repositories/user/repository_exception.dart';

abstract interface class BarbershopRepository {
  Future<Either<RepositoryException,BarbershopModel>> getMyBarbershop(
    UserModel userModel
  );
}