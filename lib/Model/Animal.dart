// To parse this JSON data, do
//
//     final animal = animalFromJson(jsonString);

import 'dart:convert';

class Result {
  Result({
    this.animais,
  });

  List<Animal> animais;

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    animais: List<Animal>.from(json["animais"].map((x) => Animal.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "animais": List<dynamic>.from(animais.map((x) => x.toJson())),
  };
}

class Animal {
  Animal({
    this.id,
    this.nome,
    this.nomeCientifico,
    this.descricao,
    this.imagem,
    this.localizacao,
    this.pegada,
  });

  String id;
  String nome;
  String nomeCientifico;
  String descricao;
  String imagem;
  Localizacao localizacao;
  Pegada pegada;

  factory Animal.fromRawJson(String str) => Animal.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Animal.fromJson(Map<String, dynamic> json) => Animal(
    id: json["id"],
    nome: json["nome"],
    nomeCientifico: json["nomeCientifico"],
    descricao: json["descricao"],
    imagem: json["imagem"],
    localizacao: Localizacao.fromJson(json["localizacao"]),
    pegada: Pegada.fromJson(json["pegada"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nome": nome,
    "nomeCientifico": nomeCientifico,
    "descricao": descricao,
    "imagem": imagem,
    "localizacao": localizacao.toJson(),
    "pegada": pegada.toJson(),
  };
}

class Localizacao {
  Localizacao({
    this.imagemLocal,
    this.nomeLocal,
    this.estado,
  });

  String imagemLocal;
  String nomeLocal;
  String estado;

  factory Localizacao.fromRawJson(String str) => Localizacao.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Localizacao.fromJson(Map<String, dynamic> json) => Localizacao(
    imagemLocal: json["imagemLocal"],
    nomeLocal: json["nomeLocal"],
    estado: json["estado"] == null ? null : json["estado"],
  );

  Map<String, dynamic> toJson() => {
    "imagemLocal": imagemLocal,
    "nomeLocal": nomeLocal,
    "estado": estado == null ? null : estado,
  };
}

class Pegada {
  Pegada({
    this.pa,
    this.pp,
    this.numDigitos,
    this.formDigitos,
    this.presCascos,
    this.presGarras,
    this.ordTax,
    this.pegadasSimi,
  });

  Pa pa;
  Pp pp;
  int numDigitos;
  String formDigitos;
  int presCascos;
  int presGarras;
  String ordTax;
  List<String> pegadasSimi;

  factory Pegada.fromRawJson(String str) => Pegada.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pegada.fromJson(Map<String, dynamic> json) => Pegada(
    pa: Pa.fromJson(json["PA"]),
    pp: Pp.fromJson(json["PP"]),
    numDigitos: json["numDigitos"],
    formDigitos: json["formDigitos"],
    presCascos: json["presCascos"],
    presGarras: json["presGarras"],
    ordTax: json["ordTax"],
    pegadasSimi: List<String>.from(json["pegadasSimi"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "PA": pa.toJson(),
    "PP": pp.toJson(),
    "numDigitos": numDigitos,
    "formDigitos": formDigitos,
    "presCascos": presCascos,
    "presGarras": presGarras,
    "ordTax": ordTax,
    "pegadasSimi": List<dynamic>.from(pegadasSimi.map((x) => x)),
  };
}

class Pa {
  Pa({
    this.largura,
    this.comprimento,
  });

  Largura largura;
  Comprimento comprimento;

  factory Pa.fromRawJson(String str) => Pa.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pa.fromJson(Map<String, dynamic> json) => Pa(
    largura: Largura.fromJson(json["largura"]),
    comprimento: Comprimento.fromJson(json["comprimento"]),
  );

  Map<String, dynamic> toJson() => {
    "largura": largura.toJson(),
    "comprimento": comprimento.toJson(),
  };
}

class Comprimento {
  Comprimento({
    this.valorMin,
    this.valorMax,
  });

  int valorMin;
  double valorMax;

  factory Comprimento.fromRawJson(String str) => Comprimento.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Comprimento.fromJson(Map<String, dynamic> json) => Comprimento(
    valorMin: json["valorMin"],
    valorMax: json["valorMax"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "valorMin": valorMin,
    "valorMax": valorMax,
  };
}

class Largura {
  Largura({
    this.valorMax,
    this.valorMin,
  });

  dynamic valorMax;
  dynamic valorMin;

  factory Largura.fromRawJson(String str) => Largura.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Largura.fromJson(Map<String, dynamic> json) => Largura(
    valorMax: json["valorMax"],
    valorMin: json["valorMin"],
  );

  Map<String, dynamic> toJson() => {
    "valorMax": valorMax,
    "valorMin": valorMin,
  };
}

class Pp {
  Pp({
    this.largura,
    this.comprimento,
  });

  Largura largura;
  Largura comprimento;

  factory Pp.fromRawJson(String str) => Pp.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pp.fromJson(Map<String, dynamic> json) => Pp(
    largura: Largura.fromJson(json["largura"]),
    comprimento: Largura.fromJson(json["comprimento"]),
  );

  Map<String, dynamic> toJson() => {
    "largura": largura.toJson(),
    "comprimento": comprimento.toJson(),
  };
}
