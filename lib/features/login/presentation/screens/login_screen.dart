import 'package:flutter_base_app/core/core.dart';
import 'package:flutter_base_app/features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static LoginScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const LoginScreen();
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailCtrl, _pswCtrl;

  @override
  void initState() {
    super.initState();
    _emailCtrl = TextEditingController();
    _pswCtrl = TextEditingController();
    _emailCtrl.text = 'rodorogz@gmail.com';
    _pswCtrl.text = '123123';
  }

  @override
  void dispose() {
    super.dispose();
    _emailCtrl.dispose();
    _pswCtrl.dispose();
  }

  void _sendForm() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final email = _emailCtrl.text.toString().trim();
    final password = _pswCtrl.text.toString().trim();
    ref.read(loginControllerProvider.notifier).attemptLogin(
          email: email,
          password: password,
        );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue>(
      loginControllerProvider,
      (_, state) => state.showSnackbarOnError(context),
    );
    final state = ref.watch(loginControllerProvider);

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          width: double.infinity,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Login'.hardcoded,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Gap(40),
                AppTextField(
                  controller: _emailCtrl,
                  label: 'correo'.hardcoded,
                  icon: Icons.alternate_email,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obligatorio'.hardcoded;
                    }
                    if (!value.isValidEmail) {
                      return 'Ingresa un correo valido'.hardcoded;
                    }
                    return null;
                  },
                ),
                AppTextField(
                  controller: _pswCtrl,
                  label: 'contraseña'.hardcoded,
                  icon: Icons.password,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obligatorio';
                    }
                    return null;
                  },
                ),
                const Gap(20),
                AppPrimaryBtn(
                  onPressed: state.isLoading ? null : () => _sendForm(),
                  child: Text('INGRESAR'.hardcoded),
                ),
                // const Gap(20.0),
                // if (state.hasValue) Text(state.value?.token ?? '...')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
