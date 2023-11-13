import 'package:dw_barbershop/src/core/restClient/rest_client.dart';
import 'package:dw_barbershop/src/repositories/user/user_repository.dart';
import 'package:dw_barbershop/src/repositories/user/user_repository_imp.dart';
import 'package:dw_barbershop/src/services/users_login/user_logins_service.dart';
import 'package:dw_barbershop/src/services/users_login/user_logins_service_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'application_providers.g.dart';

@Riverpod(keepAlive: true)
RestClient restClient(RestClientRef ref) => RestClient();

@Riverpod(keepAlive: true)
UserRepository userRepository(UserRepositoryRef ref) => UserRepositoryImpl(restClient: ref.read(restClientProvider));

@Riverpod(keepAlive: true)
UserLoginsService userLoginsService(UserLoginsServiceRef ref) => UserLoginsServiceImpl(userRepository: ref.read(userRepositoryProvider));