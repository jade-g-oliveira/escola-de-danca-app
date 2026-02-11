import 'package:escola_de_danca_app/features/dance_classes/data/datasource/dance_class_remote_datasource.dart';
import 'package:escola_de_danca_app/features/dance_classes/data/repository/dance_class_repository_impl.dart';
import 'package:escola_de_danca_app/features/dance_classes/domain/entities/dance_class_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

//Mock do DataSource para isolar o repository
class MockRemoteDataSource extends Mock implements DanceClassRemoteDataSource {}

void main() {
  late DanceClassRepositoryImpl repository;
  late MockRemoteDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockRemoteDataSource();
    repository = DanceClassRepositoryImpl(mockDataSource);
  });

  group('getDanceClasses', () {

    final tRawJsonList = [
      {"id": 1, "title": "Salsa"},
      {"id": 2, "title": "Tango"},
    ];

    test(
      'deve retornar uma lista de DanceClassEntity quando a chamada ao data source for bem-sucedida',
      () async {
        // Arrange 
        when(() => mockDataSource.getDanceClasses())
            .thenAnswer((_) async => tRawJsonList);

        // Act 
        final result = await repository.getDanceClasses();

        // Assert 
        expect(result, isA<List<DanceClassEntity>>());
        expect(result.length, 2);
        expect(result[0].rhythm, "Salsa");
        expect(result[1].rhythm, "Tango");
        
        verify(() => mockDataSource.getDanceClasses()).called(1);
        verifyNoMoreInteractions(mockDataSource);
      },
    );

    test(
      'deve lançar uma Exception quando a chamada ao data source falhar',
      () async {
        // Arrange
        when(() => mockDataSource.getDanceClasses())
            .thenThrow(Exception("Erro de conexão"));

        // Act
        final call = repository.getDanceClasses();

        // Assert
        expect(() => call, throwsA(isA<Exception>()));
        verify(() => mockDataSource.getDanceClasses()).called(1);
      },
    );
  });
}