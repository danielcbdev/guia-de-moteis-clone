  Guia de Motéis Clone body { font-family: Arial, sans-serif; line-height: 1.6; padding: 20px; background-color: #fafafa; color: #333; } h1, h2, h3 { color: #0A74DA; } code { background-color: #f4f4f4; padding: 2px 4px; border-radius: 4px; } pre { background-color: #f4f4f4; padding: 10px; border-radius: 4px; overflow-x: auto; } a { color: #0645AD; text-decoration: none; } a:hover { text-decoration: underline; } ul, ol { margin-left: 20px; } hr { margin: 20px 0; border: 0; border-top: 1px solid #ccc; }

Guia de Motéis Clone
====================

Projeto desenvolvido para o **Teste de Desenvolvedor Mobile (Flutter) – Segmento de Motéis**.

* * *

Descrição
---------

Este projeto foi desenvolvido com **Flutter 3.27.4** e tem como objetivo replicar a tela de listagem de motéis (aba "Ir Agora") do aplicativo Guia de Motéis GO. Foram utilizadas as seguintes APIs mock para obtenção dos dados:

*   [JSON Keeper](https://jsonkeeper.com/b/1IXK)
*   [nPoint API Docs](https://www.npoint.io/docs/e728bb91e0cd56cc0711)

* * *

Objetivo do Desafio
-------------------

Avaliar as habilidades em:

*   **Flutter & Dart**
*   **Gerenciamento de Estado** (utilizando BLoC)
*   **Consumo de API** (usando o pacote `http`)
*   **Testes Unitários**

* * *

Requisitos do Desafio
---------------------

*   A listagem deve exibir os motéis disponíveis com **nome**, **preço** e **imagem**.
*   O design não precisa ser 100% fiel, podendo utilizar variações visuais e outros ícones.
*   Não é necessário implementar navegação para outras telas.
*   Implementar testes unitários cobrindo os principais componentes da aplicação (cobertura mínima de 70% na listagem).

* * *

Requisitos Técnicos
-------------------

*   **Dart e Flutter:** Estrutura modularizada e código limpo.
*   **Consumo de API:** Utilização do pacote `http` através de uma classe customizada (`CustomHttpClient`).
*   **Gerenciamento de Estado:** Utilização do **BLoC**.
*   **Testes Unitários:** Cobertura dos principais componentes da aplicação.
*   **Injeção de Dependências:** Utilizando o pacote **GetIt**.

* * *

Arquitetura
-----------

O projeto segue os princípios da **Clean Architecture** e está dividido em quatro camadas principais:

*   **Core:** Configurações gerais, utilitários, tema e tratamento de erros.
*   **Data:** Consumo da API, models e implementação dos repositórios.
*   **Domain:** Entidades, contratos dos repositórios e casos de uso.
*   **Presentation:** Telas, widgets e gerenciamento de estado (BLoC).

Além disso, as dependências são injetadas via `GetIt` no arquivo `injection_container.dart`.

* * *

Tecnologias Utilizadas
----------------------

*   **Flutter 3.27.4**
*   **Dart**
*   **HTTP:** Para consumo de API.
*   **BLoC:** Gerenciamento de estado.
*   **GetIt:** Injeção de dependências.
*   **Equatable:** Comparação de objetos (para estados e eventos).
*   **Flutter Localizations:** Suporte à internacionalização.
*   **Testes Unitários:** Framework de testes do Flutter.

* * *

Estrutura de Pastas
-------------------

lib/
├── core/
│   ├── config/
│   │   ├── custom\_http\_client.dart  // Classe para requisições HTTP com log
│   ├── errors/
│   │   └── failure.dart             // Tratamento de falhas e erros
│   ├── theme/
│   │   └── app\_theme.dart           // Configurações de tema e cores
│   └── utils/
├── data/
│   ├── datasources/
│   │   ├── motel\_remote\_data\_source.dart
│   ├── models/
│   │   ├── moteis\_response.model.dart
│   └── repositories/
│       ├── motel\_repository\_impl.dart
├── domain/
│   ├── entities/
│   ├── repositories/
│   │   ├── motel\_repository.dart
│   └── usecases/
│       ├── get\_motels\_usecase.dart
├── presentation/
│   ├── auth/
│   │   ├── blocs/
│   │   │   ├── motel\_bloc.dart
│   │   │   ├── motel\_event.dart
│   │   │   └── motel\_state.dart
│   │   ├── screens/
│   │   │   └── motels\_screen.dart
│   │   └── widgets/
│   │       ├── product\_card.dart
│   │       └── product\_filter.dart
├── injection\_container.dart         // Injeção de dependências (GetIt)
├── guia\_de\_motels.dart            // Load dos blocs e tema
└── main.dart                        // Ponto de entrada do aplicativo
  

* * *

Instalação e Configuração
-------------------------

1.  **Clone o repositório:**
    
    git clone https://github.com/seu-usuario/guia-de-moteis-clone.git
    
2.  **Navegue até o diretório do projeto:**
    
    cd guia-de-moteis-clone
    
3.  **Instale as dependências:**
    
    flutter pub get
    
4.  **Configuração do Ambiente:**
    
    Verifique se as configurações de API (como a URL base) estão definidas corretamente em `lib/core/config/custom_http_client.dart`.
    

* * *

Executando o Projeto
--------------------

Para iniciar o aplicativo, execute:

flutter run

O aplicativo será iniciado com a tela inicial exibindo a listagem de motéis (aba "Ir Agora").

* * *

Testes Unitários
----------------

Para rodar os testes unitários, execute:

flutter test

Os testes cobrem os principais componentes da aplicação, garantindo uma cobertura mínima de 70% na listagem.

* * *

Considerações Finais
--------------------

*   O projeto foi desenvolvido seguindo os princípios de **Clean Architecture** e uma estrutura modularizada.
*   Utilizamos o **BLoC** para gerenciamento de estado e o **GetIt** para injeção de dependências.
*   Foram implementados testes unitários para garantir a qualidade e o correto funcionamento dos componentes.
*   Este repositório pode servir como base para aplicações Flutter robustas e escaláveis.

* * *

Contato
-------

Para dúvidas, sugestões ou feedback, sinta-se à vontade para abrir uma _issue_ neste repositório ou entrar em contato:

*   **Email:** danielcbdev@gmail.com
*   **GitHub:** [danielcbdev](https://github.com/danielcbdev)

* * *

_Projeto desenvolvido para o desafio "Teste para Desenvolvedor Mobile (Flutter) – Segmento de Motéis" com foco em boas práticas, arquitetura modular e qualidade de código._