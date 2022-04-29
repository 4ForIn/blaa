import 'package:blaa/data/repositories/auth_repo.dart';
import 'package:blaa/domain/repository/auth_repo_i.dart';
import 'package:blaa/ui/router/blaa_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:blaa/ui/widgets/banner/show_custom_banner.dart';
import 'package:blaa/ui/widgets/snack/show_custom_snack.dart';
import 'package:blaa/utils/authentication/build_input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/login_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  bool _isHidden = true;

  @override
  void dispose() {
    _passwordCtrl.clear();
    super.dispose();
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    final String _underDev = AppLocalizations.of(context)?.msgUnderDev ?? 'Feature under preparation';
    final String _hello = AppLocalizations.of(context)?.welcome.toUpperCase() ?? 'WELCOME';
    final String _signedAs = AppLocalizations.of(context)?.msgSignedInAs ?? 'You are signed in as';
    final String _invalid = AppLocalizations.of(context)?.msgInvalid ?? 'is not valid';
    final String _welcomeBack = AppLocalizations.of(context)?.loginWelcomeBack ?? 'Welcome back';
    return BlocProvider<LoginBloc>(
      create: (_) => LoginBloc(
          authenticationRepository: context.read<AuthRepoI<AuthStatus>>()),
      child: Builder(builder: (context) {
        return BlocListener<LoginBloc, LoginState>(
          listenWhen: (previous, current) {
            return previous.errorMsg != current.errorMsg;
          },
          listener: (context, state) {
            if (state.status == LoginStatus.failure) {
              showSnack(context, state.errorMsg);
            }
            if (state.status == LoginStatus.forgotPass) {
              String _msg = _underDev;
              if (_emailCtrl.value.text.length < 6) {
                _msg = 'Email: "${_emailCtrl.value.text}" $_invalid.';
              }
              showBanner(context, _msg);
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              if (state.status == LoginStatus.success) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Column(
                    children: [
                  Text(_hello),
                  Text('$_signedAs: ${state.email}'),
                  const Text('Let`s go...'),
                    ],
                  ),
                );
              } else {
                return SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Form(
                    key: _loginFormKey,
                    child: Center(
                      child: ListView(
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                        children: <Widget>[
                          Text(_welcomeBack,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 18.0)),
                          const SizedBox(height: 40.0),
                          _emailField('Email', _emailCtrl),
                          const SizedBox(height: 8.0),
                          _passwordField('Password', _passwordCtrl),
                          const SizedBox(height: 20.0),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 35),
                              child: MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24)),
                                  onPressed: () {
                                    if (_loginFormKey.currentState!.validate()) {
                                      context
                                          .read<LoginBloc>()
                                          .add(const SignInFormSubmitted());
                                      // If the form is valid, display a snack. In the real world,
                                      // you'd often call a server or save the information in a database.

                                    }
                                  },
                                  padding: const EdgeInsets.all(12),
                                  color: Colors.lightBlueAccent,
                                  child: const Text('Sign In',
                                      style: TextStyle(color: Colors.white)))),
                          _buildForgotPasswordBtn(context),
                          _buildSignUpBtn(context)
                        ],
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        );
      }),
    );
  }

  Widget _passwordField(String label, TextEditingController ctrl) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
          child: TextFormField(
              onChanged: (pass) =>
                  context.read<LoginBloc>().add(LoginPasswordChanged(pass)),
              validator: (v) {
                if (v == null || v.length < 3) {
                  return AppLocalizations.of(context)?.msgShortPwd ?? 'Password is to short';
                }
                return null;
              },
              keyboardType: TextInputType.visiblePassword,
              obscureText: _isHidden,
              controller: ctrl,
              decoration: inputDecoration(
                  label: label,
                  togglePassVisibility: _togglePasswordView,
                  isPassHidden: _isHidden)),
        );
      },
    );
  }

  Widget _emailField(String label, TextEditingController ctrl) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
          child: TextFormField(
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.deny(
                    RegExp("['+;=?!*^%#([)<>/&/,\":]"),
                    replacementString: '-not allowed ')
              ],
              onChanged: (e) =>
                  context.read<LoginBloc>().add(LoginEmailChanged(e)),
              validator: (v) {
                if (v == null || v.length < 4 || !v.contains('@')) {
                  String _msg = '${_emailCtrl.value.text}" is not valid';
                  setState(() {
                    _passwordCtrl.clear();
                  });
                  return _msg;
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
              obscureText: false,
              controller: ctrl,
              decoration: inputDecoration(label: label)),
        );
      },
    );
  }

  Padding _buildForgotPasswordBtn(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 28.0 / 100),
      child: TextButton(
          child: Text(AppLocalizations.of(context)?.loginForgotPwd ?? 'Forgot password?',
              style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 10,
                  fontStyle: FontStyle.italic)),
          onPressed: () => context
              .read<LoginBloc>()
              .add(ForgotPassword(_emailCtrl.value.text))),
    );
  }

  Padding _buildSignUpBtn(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 34.0 / 100),
      child: TextButton(
        child: const Text('Sign Up',
            style:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.bold)),
        onPressed: () => context.router.replace(const RegistrationRoute()),
      ),
    );
  }
}
