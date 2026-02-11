import 'package:escola_de_danca_app/features/dance_classes/domain/entities/dance_class_entity.dart';
import 'package:escola_de_danca_app/features/dance_classes/domain/repositories/dance_class_repository.dart';
import 'package:escola_de_danca_app/features/dance_classes/presentation/pages/dance_classes_page.dart';
import 'package:escola_de_danca_app/features/dance_classes/presentation/providers/dance_class_provider.dart';
import 'package:escola_de_danca_app/features/dance_classes/presentation/widgets/dance_class_card.dart';
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
    home: Scaffold(
      body: ChangeNotifierProvider<DanceClassProvider>.value(
        value: provider,
        child: const DanceClassesPage(),
      ),
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

  testWidgets('deve exibir a lista de aulas e NÃO mostrar o EmptyStateWidget quando houver dados', (tester) async {
    // Arrange
    final tDanceClasses = [
      const DanceClassEntity(id: 1, rhythm: "Salsa"),
    ];

    when(() => mockRepository.getDanceClasses()).thenAnswer((_) async => tDanceClasses);

    // Act
    await tester.pumpWidget(createWidgetUnderTest());
    
    await provider.loadDanceClasses();    
    
    await tester.pumpAndSettle();

    // Assert
    expect(find.text("Nenhum ritmo encontrado"), findsNothing);
    
    expect(find.byType(DanceClassCard), findsNWidgets(1));
  });
}