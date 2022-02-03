import 'package:blaa/data/repositories/demo_words_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// A Mock DemoWordsRepositoryI class
class MockDemoWordsRepo extends Mock implements DemoWordsRepo {}

void main() {
  EquatableConfig.stringify = true;
  //late DemoWordsRepo dwR;
  tearDown(() {});
  group('DemoWordsRepository should', () {
    setUp(() {
      // dwR = MockDemoWordsRepo();
      // const List _empty = [];
    });
    test('return empty array', () {
      // arrange

      // act

      // assert
    });
  });
}
