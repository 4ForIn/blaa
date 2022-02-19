import 'package:blaa/data/model/user_m/user_m.dart';
import 'package:blaa/data/repositories/auth_repo.dart';
import 'package:blaa/domain/repository/user_repo_i.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class MockAuthRepo extends Mock implements AuthRepo {}

class MockUserRepoI extends Mock implements UserRepoI<User> {}

void main() {
  const _user = User();
  late AuthRepo _aR;
  UserRepoI _uR;
  setUp(() {
    _aR = MockAuthRepo();
    when(() => _aR.status).thenAnswer((_) => const Stream.empty());
    _uR = MockUserRepoI();
  });
}