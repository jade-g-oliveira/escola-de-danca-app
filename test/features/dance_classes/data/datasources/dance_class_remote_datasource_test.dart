import 'package:dio/dio.dart';
import 'package:escola_de_danca_app/features/dance_classes/data/datasource/dance_class_remote_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

//Mock do Dio para não fazer chamadas reais à internet
class MockDio extends Mock implements Dio {}

void main() {
  late DanceClassRemoteDataSourceImpl dataSource;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    dataSource = DanceClassRemoteDataSourceImpl(mockDio);
  });

  group('getDanceClasses', () {
    final tResponseData = [
      {"id": 1, "title": "Salsa"},
      {"id": 2, "title": "Bachata"},
    ];

    test('deve realizar uma requisição GET no endpoint /albums', () async {
      // Arrange
      when(() => mockDio.get(any())).thenAnswer(
        (_) async => Response(
          data: tResponseData,
          statusCode: 200,
          requestOptions: RequestOptions(path: '/albums'),
        ),
      );

      // Act
      await dataSource.getDanceClasses();

      // Assert
      verify(() => mockDio.get('/albums')).called(1);
    });

    test('deve retornar uma lista de dados quando o status code for 200 (Sucesso)', () async {
      // Arrange
      when(() => mockDio.get(any())).thenAnswer(
        (_) async => Response(
          data: tResponseData,
          statusCode: 200,
          requestOptions: RequestOptions(path: '/albums'),
        ),
      );

      // Act
      final result = await dataSource.getDanceClasses();

      // Assert
      expect(result, tResponseData);
    });

    test('deve lançar uma Exception quando a chamada ao Dio falhar', () async {
      // Arrange
      when(() => mockDio.get(any())).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: '/albums'),
          type: DioExceptionType.connectionError,
        ),
      );

      // Act
      final call = dataSource.getDanceClasses();

      // Assert
      expect(() => call, throwsA(isA<Exception>()));
    });
  });
}