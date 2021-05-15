// Evento listAlunoFromJson(List<dynamic> str) => Evento.fromJson(str.first);

class Evento {
  String titulo;
  DateTime horario;
  String congregacao;
  String endereco;

  Evento({
    this.titulo,
    this.horario,
    this.congregacao,
    this.endereco,
  });

  factory Evento.fromJson(Map<String, dynamic> json) => new Evento(
        titulo: json["titulo"] == null ? null : json["titulo"],
        horario:
            json["horario"] == null ? null : DateTime.parse(json["horario"]),
        congregacao: json["congregacao"] == null ? null : json["congregacao"],
        endereco: json["endereco"] == null ? null : json["endereco"],
      );

  Map<String, dynamic> toJson() => {
        "titulo": titulo == null ? null : titulo,
        "horario": horario == null ? null : horario.toIso8601String(),
        "congregacao": congregacao == null ? null : congregacao,
        "endereco": endereco == null ? null : endereco,
      };
}
