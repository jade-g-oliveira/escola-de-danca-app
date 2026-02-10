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

  // Helper para criar o widget com os providers necessários
  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: ChangeNotifierProvider<DanceClassProvider>.value(
        value: provider,
        child: const DanceClassesPage(),
      ),
    );
  }

  testWidgets('deve exibir EmptyStateWidget quando a lista de aulas estiver vazia', (tester) async {
    // Arrange: Mock do repositório retornando lista vazia
    when(() => mockRepository.getDanceClasses()).thenAnswer((_) async => []);

    // Act: Constrói o widget
    await tester.pumpWidget(createWidgetUnderTest());
    
    // Dispara o carregamento
    provider.loadDanceClasses();
    
    // 1. pump() processa o início do loading (mostra o CircularProgressIndicator)
    await tester.pump(); 
    
    // 2. pumpAndSettle() aguarda todas as animações e microtasks (conclusão do fetch)
    await tester.pumpAndSettle();

    // Assert: Agora o widget deve estar na árvore
    expect(find.text("Nenhum ritmo encontrado"), findsOneWidget);
    expect(find.byIcon(Icons.skateboarding), findsOneWidget);
  });
}