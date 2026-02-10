import 'package:escola_de_danca_app/features/dance_classes/data/models/dance_class_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // objeto esperado
  final tDanceClassModel = const DanceClassModel(
    id: 1, 
    rhythm: "quidem molestiae enim",
  );

  test('deve retornar um model válido quando o JSON contém os dados da API', () {
    // Arrange
    final Map<String, dynamic> jsonMap = {
      "id": 1,
      "title": "quidem molestiae enim",
    };

    // Act
    final result = DanceClassModel.fromJson(jsonMap);

    // Assert
    expect(result, tDanceClassModel);
  });
}