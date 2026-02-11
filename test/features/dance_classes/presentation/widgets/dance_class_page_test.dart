import 'package:escola_de_danca_app/features/dance_classes/domain/repositories/dance_class_repository.dart';
import 'package:escola_de_danca_app/features/dance_classes/presentation/pages/dance_classes_page.dart';
import 'package:escola_de_danca_app/features/dance_classes/presentation/providers/dance_class_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

class MockDanceClassRepository extends Mock implements DanceClassRepository {}

void main() {
  late MockDanceClassRepository mockRepository;
  late DanceClassProvider provider;

  setUp(() {
    mockRepository = MockDanceClassRepository();
    provider = DanceClassProvider(mockRepository);
  });
  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: ChangeNotifierProvider<DanceClassProvider>.value(
        value: provider,
        child: const DanceClassesPage(),
      ),
    );
  }

  testWidgets('deve exibir EmptyStateWidget quando a lista de aulas estiver vazia', (tester) async {
    // Arrange
    when(() => mockRepository.getDanceClasses()).thenAnswer((_) async => []);

    // Act
    await tester.pumpWidget(createWidgetUnderTest());
    
    provider.loadDanceClasses();    
    
    await tester.pump();     
    
    await tester.pumpAndSettle();

    // Assert
    expect(find.text("Nenhum ritmo encontrado"), findsOneWidget);
    expect(find.byIcon(Icons.music_note_outlined), findsOneWidget);
  });
}