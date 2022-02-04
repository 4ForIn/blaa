import 'package:blaa/data/model/user_m/user_m.dart';
import 'package:blaa/data/repositories/user_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';



// class MockUserRepoI<User> extends Mock implements UserRepoI<User> {}

void main() {
  EquatableConfig.stringify = true;
  // late MockUserRepoI<User> uRI;
  late UserRepo uR;
  const mockUser = User(id: 1, email: 'email');
  setUpAll(() {

  });
  tearDown(() {});
  group('UserRepository should', () {
    setUp(() {
      uR = UserRepo();
    });
    test('return User type when getUser("any")', () async {
      // arrange
      /*when(() => uRI.getUser("any")).thenAnswer((_) async => mockUser);
      // act
      User? _res = await uRI.getUser("any");
      // assert
      expect(_res, mockUser);
      verify(() => uRI.getUser("any")).called(1);*/
    });
    /*test('return null type when get user', () async {
      // arrange
      when(() => uRI.user).thenAnswer((_) async => null);
      // act
      User? _res = await uRI.user;
      // assert
      expect(_res, null);
      verify(() => uRI.user).called(1);
    });*/
  });
}