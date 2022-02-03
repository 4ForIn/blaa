import 'package:blaa/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:blaa/blocs/words_cubit/words_cubit.dart';
import 'package:blaa/data/dummy/dummy_words.dart';
import 'package:blaa/data/model/word_m/word_m.dart';
import 'package:blaa/domain/repository/words_repo_i.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

// A Mock WordsRepositoryI class
class MockWordsRepositoryI extends Mock implements WordsRepoI<Word> {}

// A Mock AuthenticationBloc
class MockAuthenticationBloc
    extends MockBloc<AuthenticationEvent, AuthenticationState>
    implements AuthenticationBloc {}

void main() {
  EquatableConfig.stringify = true;
  late MockAuthenticationBloc mAuthBloc;
  late WordsRepoI<Word> repository;
  late WordsCubit cubit;
  final List<Word> _listOneWord = demo1WordList;
  setUpAll(() {});
  tearDown(() {
    cubit.close();
  });
  group('WordsCubit emits state:', () {
    setUp(() {
      repository = MockWordsRepositoryI();
      mAuthBloc = MockAuthenticationBloc();
      cubit = WordsCubit(repository, mAuthBloc);
    });
    blocTest<WordsCubit, WordsState>(
      'initial',
      // build is like a create - BlocProvider<BlocA>(create: (_) => BlocA())
      build: () => WordsCubit(repository, mAuthBloc),
      act: (WordsCubit cubit) => cubit.emit(const WordsState()),
      expect: () => [isA<WordsState>()],
    );

    test('AuthenticationBloc emits right states', () async {
      whenListen(
        mAuthBloc,
        Stream.fromIterable([
          const AuthenticationState.unknown(),
          const AuthenticationState.unauthenticated()
        ]),
        initialState: const AuthenticationState.unknown(),
      );
      await expectLater(
          mAuthBloc.stream,
          emitsInOrder([
            const AuthenticationState.unknown(),
            const AuthenticationState.unauthenticated()
          ]));
    });
  });
}