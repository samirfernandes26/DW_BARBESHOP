import 'package:dw_barbershop/src/core/exeptions/auth_exeption.dart';
import 'package:dw_barbershop/src/core/fp/either.dart';

abstract interface class UserRepository {
  Future<Either<AuthExeption, String>> login(String email, String password);
}