import 'package:dw_barbershop/src/core/exeptions/auth_exeption.dart';
import 'package:dw_barbershop/src/core/fp/either.dart';
import 'package:dw_barbershop/src/model/user_model.dart';
import 'package:dw_barbershop/src/repositories/user/repository_exception.dart';

abstract interface class UserRepository {
  Future<Either<AuthExeption, String>> login(String email, String password);

  Future<Either<RepositoryException, UserModel>> me();
}