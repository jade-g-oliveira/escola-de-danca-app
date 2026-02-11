import 'package:escola_de_danca_app/features/dance_classes/domain/entities/dance_class_entity.dart';
import 'package:escola_de_danca_app/features/dance_classes/domain/repositories/dance_class_repository.dart';
import 'package:escola_de_danca_app/features/dance_classes/presentation/providers/dance_class_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDanceClassRepository extends Mock implements DanceClassRepository {}

void main() {
  late DanceClassProvider provider;
  late MockDanceClassRepository mockRepository;

  setUp(() {
    mockRepository = MockDanceClassRepository();
    provider = DanceClassProvider(mockRepository);
  });

  group('loadDanceClasses', () {
    final tDanceClasses = [
      const DanceClassEntity(id: 1, rhythm: "Salsa"),
    ];

    test('deve alterar o estado de loading e popular a lista de aulas com sucesso', () async {
      // Arrange
      when(() => mockRepository.getDanceClasses())
          .thenAnswer((_) async => tDanceClasses);

      // Act
      final future = provider.loadDanceClasses();

      // Assert
      expect(provider.loading, true);

      await future;

      // Assert
      expect(provider.loading, false);
      expect(provider.danceClasses, tDanceClasses);
      verify(() => mockRepository.getDanceClasses()).called(1);
    });

    test('deve manter o loading como false em caso de erro', () async {
      // Arrange
      when(() => mockRepository.getDanceClasses())
          .thenThrow(Exception("Erro na API"));

      // Act
      try {
        await provider.loadDanceClasses();
      } catch (_) {
        //Capturamos a exceção propositalmente
      }

      // Assert final
      expect(provider.loading, false);
      expect(provider.danceClasses, isEmpty);
      verify(() => mockRepository.getDanceClasses()).called(1);
    });
  });
}