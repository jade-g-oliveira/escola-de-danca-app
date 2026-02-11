## Escola de Dança App

Este é um projeto mobile desenvolvido em Flutter para a gestão e visualização de aulas de dança. O aplicativo foi construído com foco em escalabilidade, testabilidade e seguindo os padrões de mercado.


🚀 Funcionalidades

Listagem de Aulas: Visualização de ritmos de dança consumidos de uma API REST.

Detalhes da Aula: Tela dedicada com informações específicas de cada ritmo, utilizando navegação avançada.

Empty States: Tratamento de erros e estados vazios com opção de "Tentar Novamente", garantindo uma UX resiliente.

Splash Screen: Fluxo de inicialização com pré-carregamento de dados.


🏗️ Arquitetura e Organização

O projeto utiliza Clean Architecture, dividindo as responsabilidades em camadas bem definidas:

Domain: Entidades e interfaces de repositórios.

Data: Models, implementações de repositórios e DataSources.

Presentation: Gerenciamento de estado com Provider, Widgets e Pages organizadas por Features.

🛠️ Tecnologias e Bibliotecas

Provider: Gerenciamento de estado e Injeção de Dependência.

GoRouter: Navegação declarativa e profunda.

Dio: Cliente HTTP para consumo de API com tratamento de headers e erros.

Equatable: Comparação de objetos por valor, facilitando testes e performance.

Mocktail: Criação de mocks para testes unitários e de widget.

🧪 Qualidade de Software

A cobertura de testes foi uma prioridade no desenvolvimento:

Unit Tests: Testes de Models, DataSources, Repositories e Providers.

Widget Tests: Validação da interface e comportamentos de estado (Loading, Success, Empty).

Para rodar todos os testes, utilize o comando:

flutter test

📂 Estrutura de Pastas

lib/

 ├── core/          # Rotas, constantes e temas globais
 
 ├── features/      # Funcionalidades isoladas (Aulas, Home)
 
 ├── shared/        # Componentes e utilitários compartilhados
 
 └── main.dart      # Ponto de entrada e Injeção de Dependências

⚙️ Como rodar o projeto
Certifique-se de ter o Flutter instalado na versão estável.

Clone o repositório.

Rode flutter pub get para instalar as dependências.

Execute o app com flutter run.
