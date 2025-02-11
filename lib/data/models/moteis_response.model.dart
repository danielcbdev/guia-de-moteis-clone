class MotelsResponseModel {
  final bool? sucesso;
  final Data? data;
  final List<dynamic>? mensagem;

  MotelsResponseModel({
    this.sucesso,
    this.data,
    this.mensagem,
  });

  MotelsResponseModel.fromJson(Map<String, dynamic> json)
      : sucesso = json['sucesso'] as bool?,
        data = (json['data'] as Map<String, dynamic>?) != null ? Data.fromJson(json['data'] as Map<String, dynamic>) : null,
        mensagem = json['mensagem'] as List?;

  Map<String, dynamic> toJson() => {'sucesso': sucesso, 'data': data?.toJson(), 'mensagem': mensagem};
}

class Data {
  final int? pagina;
  final int? qtdPorPagina;
  final int? totalSuites;
  final int? totalMoteis;
  final int? raio;
  final double? maxPaginas;
  final List<Moteis>? moteis;

  Data({
    this.pagina,
    this.qtdPorPagina,
    this.totalSuites,
    this.totalMoteis,
    this.raio,
    this.maxPaginas,
    this.moteis,
  });

  Data.fromJson(Map<String, dynamic> json)
      : pagina = json['pagina'] as int?,
        qtdPorPagina = json['qtdPorPagina'] as int?,
        totalSuites = json['totalSuites'] as int?,
        totalMoteis = json['totalMoteis'] as int?,
        raio = json['raio'] as int?,
        maxPaginas = json['maxPaginas'] as double?,
        moteis = (json['moteis'] as List?)?.map((dynamic e) => Moteis.fromJson(e as Map<String, dynamic>)).toList();

  Map<String, dynamic> toJson() => {
        'pagina': pagina,
        'qtdPorPagina': qtdPorPagina,
        'totalSuites': totalSuites,
        'totalMoteis': totalMoteis,
        'raio': raio,
        'maxPaginas': maxPaginas,
        'moteis': moteis?.map((e) => e.toJson()).toList(),
      };
}

class Moteis {
  final String? fantasia;
  final String? logo;
  final String? bairro;
  final double? distancia;
  final int? qtdFavoritos;
  final List<Suites>? suites;
  final int? qtdAvaliacoes;
  final double? media;

  Moteis({
    this.fantasia,
    this.logo,
    this.bairro,
    this.distancia,
    this.qtdFavoritos,
    this.suites,
    this.qtdAvaliacoes,
    this.media,
  });

  Moteis.fromJson(Map<String, dynamic> json)
      : fantasia = json['fantasia'] as String?,
        logo = json['logo'] as String?,
        bairro = json['bairro'] as String?,
        distancia = json['distancia'] as double?,
        qtdFavoritos = json['qtdFavoritos'] as int?,
        suites = (json['suites'] as List?)?.map((dynamic e) => Suites.fromJson(e as Map<String, dynamic>)).toList(),
        qtdAvaliacoes = json['qtdAvaliacoes'] as int?,
        media = json['media'] as double?;

  Map<String, dynamic> toJson() => {
        'fantasia': fantasia,
        'logo': logo,
        'bairro': bairro,
        'distancia': distancia,
        'qtdFavoritos': qtdFavoritos,
        'suites': suites?.map((e) => e.toJson()).toList(),
        'qtdAvaliacoes': qtdAvaliacoes,
        'media': media,
      };
}

class Suites {
  final String? nome;
  final int? qtd;
  final bool? exibirQtdDisponiveis;
  final List<String>? fotos;
  final List<Itens>? itens;
  final List<CategoriaItens>? categoriaItens;
  final List<Periodos>? periodos;

  Suites({
    this.nome,
    this.qtd,
    this.exibirQtdDisponiveis,
    this.fotos,
    this.itens,
    this.categoriaItens,
    this.periodos,
  });

  Suites.fromJson(Map<String, dynamic> json)
      : nome = json['nome'] as String?,
        qtd = json['qtd'] as int?,
        exibirQtdDisponiveis = json['exibirQtdDisponiveis'] as bool?,
        fotos = (json['fotos'] as List?)?.map((dynamic e) => e as String).toList(),
        itens = (json['itens'] as List?)?.map((dynamic e) => Itens.fromJson(e as Map<String, dynamic>)).toList(),
        categoriaItens = (json['categoriaItens'] as List?)?.map((dynamic e) => CategoriaItens.fromJson(e as Map<String, dynamic>)).toList(),
        periodos = (json['periodos'] as List?)?.map((dynamic e) => Periodos.fromJson(e as Map<String, dynamic>)).toList();

  Map<String, dynamic> toJson() => {
        'nome': nome,
        'qtd': qtd,
        'exibirQtdDisponiveis': exibirQtdDisponiveis,
        'fotos': fotos,
        'itens': itens?.map((e) => e.toJson()).toList(),
        'categoriaItens': categoriaItens?.map((e) => e.toJson()).toList(),
        'periodos': periodos?.map((e) => e.toJson()).toList(),
      };
}

class Itens {
  final String? nome;

  Itens({
    this.nome,
  });

  Itens.fromJson(Map<String, dynamic> json) : nome = json['nome'] as String?;

  Map<String, dynamic> toJson() => {'nome': nome};
}

class CategoriaItens {
  final String? nome;
  final String? icone;

  CategoriaItens({
    this.nome,
    this.icone,
  });

  CategoriaItens.fromJson(Map<String, dynamic> json)
      : nome = json['nome'] as String?,
        icone = json['icone'] as String?;

  Map<String, dynamic> toJson() => {'nome': nome, 'icone': icone};
}

class Periodos {
  final String? tempoFormatado;
  final String? tempo;
  final double? valor;
  final double? valorTotal;
  final bool? temCortesia;
  final dynamic desconto;

  Periodos({
    this.tempoFormatado,
    this.tempo,
    this.valor,
    this.valorTotal,
    this.temCortesia,
    this.desconto,
  });

  Periodos.fromJson(Map<String, dynamic> json)
      : tempoFormatado = json['tempoFormatado'] as String?,
        tempo = json['tempo'] as String?,
        valor = json['valor'] as double?,
        valorTotal = json['valorTotal'] as double?,
        temCortesia = json['temCortesia'] as bool?,
        desconto = json['desconto'];

  Map<String, dynamic> toJson() => {
        'tempoFormatado': tempoFormatado,
        'tempo': tempo,
        'valor': valor,
        'valorTotal': valorTotal,
        'temCortesia': temCortesia,
        'desconto': desconto,
      };
}
