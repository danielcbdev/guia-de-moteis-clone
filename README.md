<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Guia de Motéis Clone</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      line-height: 1.6;
      padding: 20px;
      background-color: #fafafa;
      color: #333;
    }
    h1, h2, h3 {
      color: #0A74DA;
    }
    code {
      background-color: #f4f4f4;
      padding: 2px 4px;
      border-radius: 4px;
    }
    pre {
      background-color: #f4f4f4;
      padding: 10px;
      border-radius: 4px;
      overflow-x: auto;
    }
    a {
      color: #0645AD;
      text-decoration: none;
    }
    a:hover {
      text-decoration: underline;
    }
    ul, ol {
      margin-left: 20px;
    }
    hr {
      margin: 20px 0;
      border: 0;
      border-top: 1px solid #ccc;
    }
  </style>
</head>
<body>
  <h1>Guia de Motéis Clone</h1>
  <p>Projeto desenvolvido para o <strong>Teste de Desenvolvedor Mobile (Flutter) – Segmento de Motéis</strong>.</p>
  <hr>

  <h2>Descrição</h2>
  <p>Este projeto foi desenvolvido com <strong>Flutter 3.27.4</strong> e tem como objetivo replicar a tela de listagem de motéis (aba "Ir Agora") do aplicativo Guia de Motéis GO. Foram utilizadas as seguintes APIs mock para obtenção dos dados:</p>
  <ul>
    <li><a href="https://jsonkeeper.com/b/1IXK" target="_blank">JSON Keeper</a></li>
    <li><a href="https://www.npoint.io/docs/e728bb91e0cd56cc0711" target="_blank">nPoint API Docs</a></li>
  </ul>
  <hr>

  <h2>Objetivo do Desafio</h2>
  <p>Avaliar as habilidades em:</p>
  <ul>
    <li><strong>Flutter & Dart</strong></li>
    <li><strong>Gerenciamento de Estado</strong> (utilizando BLoC)</li>
    <li><strong>Consumo de API</strong> (usando o pacote <code>http</code>)</li>
    <li><strong>Testes Unitários</strong> (utilizando Mockito para mocks)</li>
  </ul>
  <hr>

  <h2>Requisitos do Desafio</h2>
  <ul>
    <li>A listagem deve exibir os motéis disponíveis com <strong>nome</strong>, <strong>preço</strong> e <strong>imagem</strong>.</li>
    <li>O design não precisa ser 100% fiel, podendo utilizar variações visuais e outros ícones.</li>
    <li>Não é necessário implementar navegação para outras telas.</li>
    <li>Implementar testes unitários cobrindo os principais componentes da aplicação (cobertura mínima de 70% na listagem).</li>
  </ul>
  <hr>

  <h2>Requisitos Técnicos</h2>
  <ul>
    <li><strong>Dart e Flutter:</strong> Estrutura modularizada e código limpo.</li>
    <li><strong>Consumo de API:</strong> Utilização do pacote <code>http</code> por meio de uma classe customizada (<code>CustomHttpClient</code>).</li>
    <li><strong>Gerenciamento de Estado:</strong> Utilização do <strong>BLoC</strong>.</li>
    <li><strong>Testes Unitários:</strong> Implementados com o framework de testes do Flutter e utilizando o <strong>Mockito</strong> para simulação de dependências.</li>
    <li><strong>Injeção de Dependências:</strong> Utilizando o pacote <strong>GetIt</strong>.</li>
  </ul>
  <hr>

  <h2>Arquitetura</h2>
  <p>O projeto segue os princípios da <strong>Clean Architecture</strong> e está dividido em quatro camadas principais:</p>
  <ul>
    <li><strong>Core:</strong> Configurações gerais, utilitários, tema e tratamento de erros.</li>
    <li><strong>Data:</strong> Consumo da API, models e implementação dos repositórios.</li>
    <li><strong>Domain:</strong> Entidades, contratos dos repositórios e casos de uso.</li>
    <li><strong>Presentation:</strong> Telas, widgets e gerenciamento de estado (BLoC).</li>
  </ul>
  <p>Além disso, as dependências são injetadas via <code>GetIt</code> no arquivo <code>injection_container.dart</code>.</p>
  <hr>

  <h2>Tecnologias Utilizadas</h2>
  <ul>
    <li><strong>Flutter 3.27.4</strong></li>
    <li><strong>Dart</strong></li>
    <li><strong>HTTP:</strong> Para consumo de API.</li>
    <li><strong>BLoC:</strong> Gerenciamento de estado.</li>
    <li><strong>GetIt:</strong> Injeção de dependências.</li>
    <li><strong>Equatable:</strong> Comparação de objetos (para estados e eventos).</li>
    <li><strong>Mockito:</strong> Mocks para testes unitários.</li>
    <li><strong>Flutter Localizations:</strong> Suporte à internacionalização.</li>
    <li><strong>Testes Unitários:</strong> Framework de testes do Flutter.</li>
  </ul>
  <hr>

  <h2>Estrutura de Pastas</h2>
  <pre>
lib/
├── core/
│   ├── config/
│   │   ├── custom_http_client.dart  // Classe para requisições HTTP com log
│   │   └── app_router.dart          // Gerenciamento de rotas (se aplicável)
│   ├── errors/
│   │   └── failure.dart             // Tratamento de falhas e erros
│   ├── theme/
│   │   └── app_theme.dart           // Configurações de tema e cores
│   └── utils/
├── data/
│   ├── datasources/
│   │   ├── auth_remote_data_source.dart
│   │   ├── user_remote_data_source.dart
│   │   └── product_remote_data_source.dart
│   ├── models/
│   │   ├── user_model.dart
│   │   └── product_model.dart
│   └── repositories/
│       ├── auth_repository_impl.dart
│       ├── user_repository_impl.dart
│       └── product_repository_impl.dart
├── domain/
│   ├── entities/
│   │   ├── user.dart
│   │   └── product.dart
│   ├── repositories/
│   │   ├── auth_repository.dart
│   │   ├── user_repository.dart
│   │   └── product_repository.dart
│   └── usecases/
│       ├── login_usecase.dart
│       ├── get_user_usecase.dart
│       ├── get_products_usecase.dart
│       ├── get_product_detail_usecase.dart
│       └── search_products_usecase.dart
├── presentation/
│   ├── auth/
│   │   ├── blocs/
│   │   │   ├── auth_bloc.dart
│   │   │   ├── auth_event.dart
│   │   │   └── auth_state.dart
│   │   ├── screens/
│   │   │   └── login_screen.dart
│   │   └── widgets/
│   ├── home/
│   │   └── screens/
│   │       └── home_screen.dart
│   ├── products/
│   │   ├── blocs/
│   │   │   ├── product_bloc.dart
│   │   │   ├── product_event.dart
│   │   │   └── product_state.dart
│   │   ├── screens/
│   │   │   ├── product_list_screen.dart
│   │   │   ├── product_detail_screen.dart
│   │   │   └── product_search_screen.dart
│   │   └── widgets/
│   │       ├── product_card.dart
│   │       └── product_filter.dart
│   └── profile/
│       ├── blocs/
│       │   ├── user_bloc.dart
│       │   ├── user_event.dart
│       │   └── user_state.dart
│       ├── screens/
│       │   ├── profile_screen.dart
│       │   └── edit_profile_screen.dart
│       └── widgets/
│           ├── profile_card.dart
│           └── profile_form.dart
├── injection_container.dart         // Injeção de dependências (GetIt)
└── main.dart                        // Ponto de entrada do aplicativo

test/
├── core/
├── data/
├── domain/
└── presentation/
  </pre>
  <hr>

  <h2>Instalação e Configuração</h2>
  <ol>
    <li>
      <strong>Clone o repositório:</strong>
      <pre>git clone https://github.com/danielcbdev/guia-de-moteis-clone.git</pre>
    </li>
    <li>
      <strong>Navegue até o diretório do projeto:</strong>
      <pre>cd guia-de-moteis-clone</pre>
    </li>
    <li>
      <strong>Instale as dependências:</strong>
      <pre>flutter pub get</pre>
    </li>
    <li>
      <strong>Configuração do Ambiente:</strong>
      <p>Verifique se as configurações de API (como a URL base) estão definidas corretamente em <code>lib/core/config/custom_http_client.dart</code>.</p>
    </li>
  </ol>
  <hr>

  <h2>Executando o Projeto</h2>
  <p>Para iniciar o aplicativo, execute:</p>
  <pre>flutter run</pre>
  <p>O aplicativo será iniciado com a tela inicial exibindo a listagem de motéis (aba "Ir Agora").</p>
  <hr>

  <h2>Testes Unitários e Cobertura</h2>
  <p>Para rodar os testes unitários (incluindo os testes que utilizam o <strong>Mockito</strong>), execute o seguinte comando no terminal:</p>
  <pre>flutter test</pre>
  <p>Para gerar o relatório de cobertura de testes, execute:</p>
  <pre>flutter test --coverage</pre>
  <p>Esse comando criará um arquivo chamado <code>lcov.info</code> no diretório <code>coverage/</code>.</p>
  <p>Para converter o arquivo <code>lcov.info</code> em um relatório HTML, siga os passos abaixo:</p>
  <ol>
    <li>
      <strong>Instale o lcov:</strong>
      <p>No macOS (via Homebrew):</p>
      <pre>brew install lcov</pre>
      <p>No Linux (Ubuntu):</p>
      <pre>sudo apt-get install lcov</pre>
      <p>No Windows, utilize o WSL ou uma ferramenta similar.</p>
    </li>
    <li>
      <strong>Gere o relatório HTML:</strong>
      <pre>genhtml coverage/lcov.info -o coverage/html</pre>
    </li>
    <li>
      <strong>Visualize o relatório:</strong>
      <p>No macOS:</p>
      <pre>open coverage/html/index.html</pre>
      <p>No Linux:</p>
      <pre>xdg-open coverage/html/index.html</pre>
    </li>
  </ol>
  <p>Opcionalmente, você pode criar um script (por exemplo, <code>coverage.sh</code>) para automatizar esses passos.</p>
  <hr>

  <h2>Considerações Finais</h2>
  <ul>
    <li>O projeto foi desenvolvido seguindo os princípios de <strong>Clean Architecture</strong> e uma estrutura modularizada.</li>
    <li>Utilizamos o <strong>BLoC</strong> para gerenciamento de estado e o <strong>GetIt</strong> para injeção de dependências.</li>
    <li>Testes unitários foram implementados para os principais componentes utilizando o framework de testes do Flutter e o <strong>Mockito</strong> para mocks.</li>
    <li>Este repositório pode servir como base para aplicações Flutter robustas e escaláveis.</li>
  </ul>
  <hr>

  <h2>Contato</h2>
  <p>Para dúvidas, sugestões ou feedback, sinta-se à vontade para abrir uma <em>issue</em> neste repositório ou entrar em contato:</p>
  <ul>
    <li><strong>Email:</strong> <a href="mailto:danielcbdev@gmail.com">danielcbdev@gmail.com</a></li>
    <li><strong>GitHub:</strong> <a href="https://github.com/danielcbdev" target="_blank">danielcbdev</a></li>
  </ul>
  <hr>
  <p><em>Projeto desenvolvido para o desafio "Teste para Desenvolvedor Mobile (Flutter) – Segmento de Motéis" com foco em boas práticas, arquitetura modular e qualidade de código.</em></p>
</body>
</html>