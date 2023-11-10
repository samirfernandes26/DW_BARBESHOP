import 'package:dw_barbershop/src/core/constants/local_storage_keys.dart';
import 'package:dw_barbershop/src/core/exeptions/auth_exeption.dart';
import 'package:dw_barbershop/src/core/exeptions/sevice_exception.dart';
import 'package:dw_barbershop/src/core/fp/either.dart';
import 'package:dw_barbershop/src/core/fp/nil.dart';
import 'package:dw_barbershop/src/repositories/user/user_repository.dart';
import 'package:dw_barbershop/src/services/users_login/user_logins_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLoginsServiceImpl implements UserLoginsService {
  final UserRepository userRepository;

  UserLoginsServiceImpl({
    required this.userRepository,
  });

  @override
  Future<Either<SeviceException, Nil>> execute(
      String email, String password) async {
    final loginResult = await userRepository.login(email, password);

    switch (loginResult) {
      case Success(value: final accessToken):
        final sp = await SharedPreferences.getInstance();
        sp.setString(LocalStorageKeys.accessToken, accessToken);
        return Success(nil);

      case Failure(:final exception):
        return switch (exception) {
          AuthError() => Failure(
              SeviceException(
                message: 'Erro ao realizar o login',
              ),
            ),
          AuthUnauthorizedException() => Failure(
              SeviceException(
                message: 'login ou senha inválidos',
              ),
            )
        };
    }
  }
}
