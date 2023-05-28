import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ldt/domain/model/tokens.dart';
import 'package:ldt/domain/state/auth_state.dart';
import 'package:ldt/domain/state/environment_state.dart';
import 'package:ldt/internal/app_module.dart';
import 'package:ldt/internal/colors.dart';
import 'package:ldt/presentation/widgets/app_button.dart';
import 'package:ldt/presentation/widgets/app_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  late AuthState _authState;
  late EnvironmentState _environmentState;

  bool errorEmail = false;
  bool errorPassword = false;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _authState = AppModule.authState();
    _environmentState = AppModule.environmentState();
    Future.delayed(Duration.zero, () async {
      await _environmentState.getUser();
      if (_environmentState.user != null && context.mounted) {
        Navigator.of(context).pushReplacementNamed('/');
      } else {
        setState(() {
          loading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryLight,
        body: loading
            ? const Center(child: SizedBox(width: 60, height: 60, child: CircularProgressIndicator(color: AppColors.alternative)))
            : SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: const EdgeInsets.only(bottom: 60), child: SvgPicture.asset('assets/icons/logo.svg', width: MediaQuery.of(context).size.width * 0.4)),
                        const Align(alignment: Alignment.center, child: Text('Вход', style: TextStyle(fontSize: 40, color: AppColors.textMain))),
                        const SizedBox(height: 30),
                        AppInput(controller: emailController, hintText: 'Почта', errorText: errorEmail ? 'Такая почта не существует' : null),
                        const SizedBox(height: 20),
                        AppInput(controller: passwordController, hintText: 'Пароль', errorText: errorPassword ? 'Неверный пароль' : null),
                        const SizedBox(height: 15),
                        const Align(alignment: Alignment.centerRight, child: Text('Забыли пароль?', style: TextStyle(fontSize: 16, color: AppColors.textAccentLight))),
                        const SizedBox(height: 30),
                        AppButton(
                          color: AppColors.alternative,
                          text: 'Войти',
                          onPressed: () {
                            setState(() {
                              errorEmail = false;
                              errorPassword = false;
                            });
                            String email = emailController.text;
                            String password = passwordController.text;
                            _authState.loginViaEmail(email, password).then((wrapper) {
                              switch (wrapper.tokensStatus) {
                                case TokensStatus.success:
                                  Navigator.of(context).pushReplacementNamed('/');
                                  break;
                                case TokensStatus.emailNotFound:
                                  setState(() {
                                    errorEmail = true;
                                    errorPassword = false;
                                  });
                                  break;
                                case TokensStatus.invalidPassword:
                                  setState(() {
                                    errorEmail = false;
                                    errorPassword = true;
                                  });
                                  break;
                              }
                            });
                          },
                        ),
                        const SizedBox(height: 20),
                        const Align(alignment: Alignment.center, child: Text('Нет аккаунта? Зарегистрируетесь!', style: TextStyle(fontSize: 16, color: AppColors.textMain))),
                        Padding(
                          padding: const EdgeInsets.only(left: 50, right: 50, bottom: 20, top: 60),
                          child: Container(color: Colors.white, height: 2),
                        ),
                        const Align(
                          alignment: Alignment.center,
                          child: Text('Или войти через социальные сети', style: TextStyle(fontSize: 20, color: AppColors.textMain, fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
