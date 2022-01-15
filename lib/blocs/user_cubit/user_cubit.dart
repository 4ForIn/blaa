import 'package:blaa/data/model/user_m/user_m.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_state.dart';

const User _demoUser = User(
  created: '2000-00-00',
  email: 'demoUser@demo',
  langToLearn: 'tr',
  nativeLang: 'en',
  password: 'demo123456',
  id: -2,
);

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(const UserState(_demoUser));
}
