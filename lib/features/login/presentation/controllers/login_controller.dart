import 'dart:async';

import 'package:flutter_base_app/core/core.dart';
import 'package:flutter_base_app/features/features.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginController extends AutoDisposeAsyncNotifier<Login> {
  @override
  FutureOr<Login> build() {
    return LoginModel();
  }

  Future<void> attemptLogin({
    required String email,
    required String password,
  }) async {
    final loginRepository = ref.read(loginRepositoryProvider);
    final credentials = CredentialsModel(email: email, password: password);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => loginRepository.attemptLogin(credentials: credentials),
    );
    // then do this:
    if (state.hasError == false) {
      // get the GoRouter instance and call pop on it
      ref.read(routesProvider).go(RouteLocation.orders);
      // context.goNamed('fruit-detail'),
    }
  }
}

final loginControllerProvider =
    AsyncNotifierProvider.autoDispose<LoginController, Login>(
  LoginController.new,
);

// final loginRepositoryProvider = Provider<LoginRepositoryImpl>((ref) {
//   final datasource = ref.read(serverLoginDatasourceProvider);
//   return LoginRepositoryImpl(datasource: datasource);
// });

