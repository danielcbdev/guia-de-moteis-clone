import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:guia_de_moteis_clone/data/models/moteis_response.model.dart';

void main() {
  group('MotelsResponseModel', () {
    test('should convert from JSON correctly', () {
      final jsonData = {
        "sucesso": true,
        "data": {
          "pagina": 1,
          "qtdPorPagina": 10,
          "totalSuites": 5,
          "totalMoteis": 2,
          "raio": 15,
          "maxPaginas": 3.0,
          "moteis": [
            {
              "fantasia": "Motel Test",
              "logo": "logo_url",
              "bairro": "Bairro Test",
              "distancia": 10.5,
              "qtdFavoritos": 20,
              "qtdAvaliacoes": 100,
              "media": 4.5,
              "suites": [
                {
                  "nome": "Suite Luxo",
                  "qtd": 2,
                  "exibirQtdDisponiveis": true,
                  "fotos": ["img1.jpg", "img2.jpg"],
                  "itens": [{"nome": "Jacuzzi"}],
                  "categoriaItens": [{"nome": "Premium", "icone": "icon.png"}],
                  "periodos": [
                    {
                      "tempoFormatado": "2h",
                      "tempo": "120",
                      "valor": 150.0,
                      "valorTotal": 180.0,
                      "temCortesia": false,
                      "desconto": {"desconto": 10.0}
                    }
                  ]
                }
              ]
            }
          ]
        },
        "mensagem": ["Success"]
      };

      final model = MotelsResponseModel.fromJson(jsonData);

      expect(model.sucesso, true);
      expect(model.data?.pagina, 1);
      expect(model.data?.moteis?.first.fantasia, "Motel Test");
      expect(model.data?.moteis?.first.suites?.first.nome, "Suite Luxo");
      expect(model.data?.moteis?.first.suites?.first.periodos?.first.desconto?.desconto, 10.0);
    });

    test('should convert to JSON correctly', () {
      final model = MotelsResponseModel(
        sucesso: true,
        data: Data(
          pagina: 1,
          qtdPorPagina: 10,
          totalSuites: 5,
          totalMoteis: 2,
          raio: 15,
          maxPaginas: 3.0,
          moteis: [
            Moteis(
              fantasia: "Motel Test",
              logo: "logo_url",
              bairro: "Bairro Test",
              distancia: 10.5,
              qtdFavoritos: 20,
              qtdAvaliacoes: 100,
              media: 4.5,
              suites: [
                Suites(
                  nome: "Suite Luxo",
                  qtd: 2,
                  exibirQtdDisponiveis: true,
                  fotos: ["img1.jpg", "img2.jpg"],
                  itens: [Itens(nome: "Jacuzzi")],
                  categoriaItens: [CategoriaItens(nome: "Premium", icone: "icon.png")],
                  periodos: [
                    Periodos(
                      tempoFormatado: "2h",
                      tempo: "120",
                      valor: 150.0,
                      valorTotal: 180.0,
                      temCortesia: false,
                      desconto: Desconto(desconto: 10.0),
                    )
                  ],
                )
              ],
            )
          ],
        ),
        mensagem: ["Success"],
      );

      final jsonResult = model.toJson();
      final jsonString = jsonEncode(jsonResult);
      final decodedJson = jsonDecode(jsonString);

      expect(decodedJson['sucesso'], true);
      expect(decodedJson['data']['pagina'], 1);
      expect(decodedJson['data']['moteis'][0]['fantasia'], "Motel Test");
      expect(decodedJson['data']['moteis'][0]['suites'][0]['nome'], "Suite Luxo");
      expect(decodedJson['data']['moteis'][0]['suites'][0]['periodos'][0]['desconto']['desconto'], 10.0);
    });
  });
}
