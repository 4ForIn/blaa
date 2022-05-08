import 'package:auto_route/auto_route.dart';
import 'package:blaa/ui/router/blaa_router.gr.dart';
import 'package:blaa/ui/screens/login_screen/bloc/login_bloc.dart';
import 'package:blaa/ui/widgets/form_submit_btn/form_submit_btn.dart';
import 'package:blaa/utils/authentication/build_input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NarrowedLayout extends StatefulWidget {
  const NarrowedLayout({Key? key}) : super(key: key);

  @override
  State<NarrowedLayout> createState() => _NarrowedLayoutState();
}

class _NarrowedLayoutState extends State<NarrowedLayout> {
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
    final String _welcomeBack =
        AppLocalizations.of(context)?.loginWelcomeBack ?? 'Welcome back';
    return CustomScrollView(slivers: [
      SliverList(
        delegate: SliverChildListDelegate([
          Form(
            key: _loginFormKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
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
                        child: FormSubmitBtn(
                          txt: 'Sign In',
                          formState: _loginFormKey.currentState,
                          onSubmit: () => context
                              .read<LoginBloc>()
                              .add(const SignInFormSubmitted()),
                        )),
                    _buildForgotPasswordBtn(context),
                    _buildSignUpBtn(context)
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    ]
        /*const SearchHeader(),
      SliverList(
        delegate: SliverChildListDelegate([
          OrderBar(
              handleOnlyFavorite:
              context
                  .read<WordsCubit>()
                  .toggleShowOnlyFavored,
              handleOrder: context
                  .read<WordsCubit>()
                  .orderItemsListByCreated),
        ]),
      ),
      BlocBuilder<WordsCubit, WordsState>(
        builder: (context, state) => _buildWordListWidget(context, state),
      )*/
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
                  return AppLocalizations.of(context)?.msgShortPwd ??
                      'Password is to short';
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
              autocorrect: false,
              validator: (v) {
                if (v == null || v.length < 4 || !v.contains('@')) {
                  String _msg = '${_emailCtrl.value.text}" is not valid';
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
      padding: const EdgeInsets.symmetric(
          // horizontal: MediaQuery.of(context).size.width * 28.0 / 100
          horizontal: 2.0),
      child: TextButton(
          child: Text(
              AppLocalizations.of(context)?.loginForgotPwd ??
                  'Forgot password?',
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
      padding: const EdgeInsets.symmetric(
          // horizontal: MediaQuery.of(context).size.width * 34.0 / 100
          horizontal: 2.0),
      child: TextButton(
        child: const Text('Sign Up',
            style:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.bold)),
        onPressed: () => context.router.replace(const RegistrationRoute()),
      ),
    );
  }
}
