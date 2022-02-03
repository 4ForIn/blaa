import 'package:blaa/domain/repository/auth_repo_i.dart';
import 'package:blaa/ui/router/blaa_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:blaa/ui/widgets/language_select/language_dropdown/language_dropdown.dart';
import 'package:blaa/ui/widgets/snack/show_custom_snack.dart';
import 'package:blaa/utils/authentication/build_input_decoration.dart';
import 'package:blaa/utils/constants/assets_const.dart';
import 'package:blaa/utils/constants/languages.dart';
import 'package:blaa/utils/enums/authentication_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final TextEditingController _passwordCtrl = TextEditingController();
  final GlobalKey<FormState> _registerFormKye = GlobalKey<FormState>();
  bool _isHidden = true;
  static const _passPattern2 = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{5,}$';
  static const _emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';

  @override
  void dispose() {
    _passwordCtrl.clear();
    _emailCtrl.clear();
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
          child: BlocBuilder<RegistrationCubit, RegistrationState>(
            builder: (context, state) {
              if (state.formStatus == FormSubmissionStatus.success) {
                return Center(
                    child: Column(
                  children: [
                    Text('Welcome ${state.username}'),
                    const Text('You are signed in. Let`s go...'),
                  ],
                ));
              } else {
                return Form(
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
                      const SizedBox(height: 20.0),
                      _nameField('Name', _nameCtrl),
                      const SizedBox(height: 8.0),
                      _emailField('Email', _emailCtrl),
                      const SizedBox(height: 8.0),
                      _passwordField('Password', _passwordCtrl),
                      const SizedBox(height: 15.0),
                      const Text('Your native language',
                          style: TextStyle(color: Colors.grey),
                          textAlign: TextAlign.center),
                      _buildMyLanguageDropdown(context),
                      const SizedBox(height: 8.0),
                      const Text('Language You want to learn',
                          style: TextStyle(color: Colors.grey),
                          textAlign: TextAlign.center),
                      _buildWantLearnDropdown(context),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 35),
                          child:
                              BlocBuilder<RegistrationCubit, RegistrationState>(
                            builder: (context, state) {
                              if (state.formStatus ==
                                  FormSubmissionStatus.submitting) {
                                return const Center(
                                    child: CircularProgressIndicator(
                                  color: Colors.grey,
                                ));
                              } else {
                                return _buildSubmitBtn(context);
                              }
                            },
                          )),
                      _buildSignInBtn(context)
                    ],
                  ),
                );
              }
            },
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
              cursorColor: Colors.black,
              maxLength: 30,
              // the item is responsible for validation!
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp('[ a-zA-Z0-9 -]'),
                    replacementString: ' a-z 0-9 allowed ')
              ],
              onChanged: (val) =>
                  context.read<RegistrationCubit>().onUsernameChanged(val),
              validator: (v) => state.isUsernameValid ? null : 'Enter name',
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
            cursorColor: Colors.black,
            maxLength: 40,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.deny(
                  RegExp("['+;=?!*^%#([\\)<>/&/,\":]"),
                  replacementString: '-not allowed')
            ],
            onChanged: (val) =>
                context.read<RegistrationCubit>().onEmailChanged(val),
            validator: (v) {
              if (v != null) {
                // the item is responsible for validation!
                bool _emailValid = RegExp(_emailPattern).hasMatch(v);
                if (!_emailValid || v.isEmpty) {
                  return 'Email is invalid!';
                } else {
                  return null;
                }
              }

              return null;
            },
            keyboardType: TextInputType.emailAddress,
            obscureText: false,
            controller: ctrl,
            decoration: inputDecoration(label: label)),
      );
    });
  }

  Widget _passwordField(String label, TextEditingController ctrl) {
    return BlocBuilder<RegistrationCubit, RegistrationState>(
        builder: (context, state) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
        child: TextFormField(
            cursorColor: Colors.black,
            onChanged: (val) =>
                context.read<RegistrationCubit>().onPasswordChanged(val),
            // the item is responsible for validation!
            validator: (v) {
              if (v != null) {
                bool _passValid = RegExp(_passPattern2).hasMatch(v);
                if (!_passValid || v.isEmpty) {
                  return 'Password example: Aa!123';
                } else {
                  return null;
                }
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
    });
  }

  Widget _buildMyLanguageDropdown(BuildContext context) {
    return BlocBuilder<RegistrationCubit, RegistrationState>(
        builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 35),
        child: LanguageDropdown<String>(
            hintText: 'My language',
            options: [...SupportedLanguages.names],
            value: state.nativeLang,
            onChanged: (String? newValue) {
              context.read<RegistrationCubit>().onNativeLangChanged(newValue!);
            },
            getLabel: (String value) => value,
            key: const Key('LanguageDropdown-My language')),
      );
    });
  }

  Widget _buildWantLearnDropdown(BuildContext context) {
    return BlocBuilder<RegistrationCubit, RegistrationState>(
        builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 35),
        child: LanguageDropdown<String>(
            hintText: 'I want to want to learn',
            options: [...SupportedLanguages.names],
            value: state.langToLearn,
            onChanged: (String? newValue) {
              context.read<RegistrationCubit>().onLangToLearnChanged(newValue!);
            },
            getLabel: (String value) => value,
            key: const Key('LanguageDropdown-I want to want to learn')),
      );
    });
  }

  MaterialButton _buildSubmitBtn(BuildContext context) {
    return MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        onPressed: () {
          _submitHandle(context);
        },
        padding: const EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: const Text('Sign Up', style: TextStyle(color: Colors.white)));
  }

  void _submitHandle(BuildContext context) {
    if (_registerFormKye.currentState!.validate()) {
      context.read<RegistrationCubit>().onFormSubmit();
        setState(() {
          _passwordCtrl.clear();
          _emailCtrl.clear();
          _nameCtrl.clear();
        });
    } else {
      print('formKey not validated');
    }
  }

  Padding _buildSignInBtn(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 34.0 / 100),
        child: TextButton(
          child: const Text(
            'Sign In',
            style:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          onPressed: () => context.router.replace(const LoginRoute()),
        ));
  }
}
