import 'package:blaa/domain/repository/auth_repo_i.dart';
import 'package:blaa/ui/router/blaa_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:blaa/ui/widgets/snack/show_custom_snack.dart';
import 'package:blaa/utils/authentication/build_input_decoration.dart';
import 'package:blaa/utils/constants/assets_const.dart';
import 'package:blaa/utils/constants/root_scaffold_key.dart';
import 'package:blaa/utils/enums/authentication_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/registration_cubit.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _langToLearnCtrl = TextEditingController();
  final TextEditingController _nativeLangCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();
  final GlobalKey<FormState> _registerFormKye = GlobalKey<FormState>();
  bool _isHidden = true;

  @override
  void dispose() {
    // _passwordCtrl.value.copyWith(text: '');
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
    return BlocProvider(
      create: (context) => RegistrationCubit(
          authenticationRepository: context.read<AuthRepoI<AuthStatus>>()),
      child: Center(
        child: BlocListener<RegistrationCubit, RegistrationState>(
          listener: (context, state) {
            if (state.formStatus == FormSubmissionStatus.failed) {
              showSnack(context, state.errorMessage);
            }
          },
          child: Form(
            key: _registerFormKye,
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              children: <Widget>[
                Hero(
                  tag: 'hero',
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 48.0,
                    child: Image.asset(AssetsConst.bulbTr['path']!),
                  ),
                ),
                const SizedBox(height: 40.0),
                _nameField('Name', _nameCtrl),
                const SizedBox(height: 8.0),
                _emailField('Email', _emailCtrl),
                const SizedBox(height: 8.0),
                _passwordField('Password', _passwordCtrl),
                _nativeField('Your language', _nativeLangCtrl),
                _languageField('Language you want to learn', _langToLearnCtrl),
                const SizedBox(height: 20.0),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 35),
                    child: BlocBuilder<RegistrationCubit, RegistrationState>(
                      builder: (context, state) {
                        if (state.formStatus ==
                            FormSubmissionStatus.submitting) {
                          return const Center(
                              child: CircularProgressIndicator(
                            color: Colors.grey,
                          ));
                        } else {
                          return MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              onPressed: () {
                                if (_registerFormKye.currentState!.validate()) {
                                  context
                                      .read<RegistrationCubit>()
                                      .onFormSubmit();
                                  // If the form is valid, display a snack. In the real world,
                                  // you'd often call a server or save the information in a database.

                                }
                              },
                              padding: const EdgeInsets.all(12),
                              color: Colors.lightBlueAccent,
                              child: const Text('Sign Up',
                                  style: TextStyle(color: Colors.white)));
                        }
                      },
                    )),
                _buildSignInBtn(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _nameField(String label, TextEditingController ctrl) {
    return BlocBuilder<RegistrationCubit, RegistrationState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
          child: TextFormField(
              onChanged: (val) =>
                  context.read<RegistrationCubit>().onUsernameChanged(val),
              validator: (v) => state.isUsernameValid ? null : 'Invalid name',
              keyboardType: TextInputType.text,
              obscureText: false,
              controller: ctrl,
              decoration: inputDecoration(label: label)),
        );
      },
    );
  }

  Widget _emailField(String label, TextEditingController ctrl) {
    return BlocBuilder<RegistrationCubit, RegistrationState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
          child: TextFormField(
              onChanged: (val) =>
                  context.read<RegistrationCubit>().onEmailChanged(val),
              validator: (v) => state.isEmailValid ? null : 'Email is invalid',
              keyboardType: TextInputType.emailAddress,
              obscureText: false,
              controller: ctrl,
              decoration: inputDecoration(label: label)),
        );
      },
    );
  }

  Widget _passwordField(String label, TextEditingController ctrl) {
    return BlocBuilder<RegistrationCubit, RegistrationState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
          child: TextFormField(
              onChanged: (val) =>
                  context.read<RegistrationCubit>().onPasswordChanged(val),
              validator: (v) {
                if (v == null || v.length < 5) {
                  return 'password must have min. 5 characters';
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

  Widget _nativeField(String label, TextEditingController ctrl) {
    return BlocBuilder<RegistrationCubit, RegistrationState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
          child: TextFormField(
              onChanged: (val) =>
                  context.read<RegistrationCubit>().onNativeLangChanged(val),
              validator: (v) {
                if (v == null || v.isEmpty) {
                  return 'cannot be empty';
                }
                return null;
              },
              keyboardType: TextInputType.text,
              obscureText: false,
              controller: ctrl,
              decoration: inputDecoration(label: label)),
        );
      },
    );
  }

  Widget _languageField(String label, TextEditingController ctrl) {
    return BlocBuilder<RegistrationCubit, RegistrationState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
          child: TextFormField(
              onChanged: (val) =>
                  context.read<RegistrationCubit>().onLangToLearnChanged(val),
              validator: (v) {
                if (v == null || v.isEmpty) {
                  return 'cannot be empty';
                }
                return null;
              },
              keyboardType: TextInputType.text,
              obscureText: false,
              controller: ctrl,
              decoration: inputDecoration(label: label)),
        );
      },
    );
  }

  Padding _buildSignInBtn(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 34.0 / 100),
      child: TextButton(
        child: const Text(
          'Sign In',
          style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        onPressed: () => context.router.replace(const LoginRoute()),
      ),
    );
  }
}
