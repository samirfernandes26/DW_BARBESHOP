import 'package:dw_barbershop/src/core/exeptions/service_exception.dart';
import 'package:dw_barbershop/src/core/fp/either.dart';
import 'package:dw_barbershop/src/core/fp/nil.dart';

abstract interface class UserLoginsService {
  Future<Either<ServiceException,Nil>> execute(String email, String password);
}