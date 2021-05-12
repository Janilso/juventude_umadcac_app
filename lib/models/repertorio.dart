class Hino {
  String nome;
  String autoria;
  String letra;

  Hino({
    this.nome,
    this.autoria,
    this.letra,
  });

  factory Hino.fromJson(Map<String, dynamic> json) => new Hino(
        nome: json["nome"] == null ? null : json["nome"],
        autoria: json["autoria"] == null ? null : json["autoria"],
        letra: json["letra"] == null ? null : json["letra"],
      );

  Map<String, dynamic> toJson() => {
        "nome": nome == null ? null : nome,
        "autoria": autoria == null ? null : autoria,
        "letra": letra == null ? null : letra,
      };
}
