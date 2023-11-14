import 'package:asyncstate/asyncstate.dart';
import 'package:dw_barbershop/src/core/exeptions/service_exception.dart';
import 'package:dw_barbershop/src/core/fp/either.dart';
import 'package:dw_barbershop/src/core/providers/application_providers.dart';
import 'package:dw_barbershop/src/features/auth/login/login_state.dart';
import 'package:dw_barbershop/src/model/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_vm.g.dart';

@riverpod
class LoginVm extends _$LoginVm {
  @override
  LoginState build() => LoginState.initial();

  Future<void> login(String email, String password) async {
    final loaderHendle = AsyncLoaderHandler()..start();

    final loginsService = ref.watch(userLoginsServiceProvider);

    final result = await loginsService.execute(email, password);

    switch (result) {
      case Success():
        //! Invalidando os chaces para evitar problema com o login de user incorreto.
        ref.invalidate(getMeProvider);
        ref.invalidate(getMyBarbershopProvider);
        // Buscar dados do user logado
        // Fazer analise para qual tipo do login.
        final useModel = await ref.read(getMeProvider.future);
        switch(useModel){
          case UserModelADM():
            state = state.copyWith(status: LoginStateStatus.admLogin,);
          case UserModelEmployee():
            state = state.copyWith(status: LoginStateStatus.employeeLogin,);
        }
        
      break;
      case Failure(exception: ServiceException(:final message)):
        state = state.copyWith(
          status: LoginStateStatus.error,
          errorMessage: () => message,
        );
        break;
    }
    loaderHendle.close();
  }
}
