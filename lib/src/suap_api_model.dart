class Boletim {
  String codigoDiario;
  String disciplina;
  bool segundoSemestre;
  int cargaHoraria;
  int cargaHorariaCumprida;
  int numeroFaltas;
  int percentualCargaHorariaFrequentada;
  String situacao;
  int quantidadeAvaliacoes;
  NotaEtapa1 notaEtapa1;
  NotaEtapa2 notaEtapa2;
  NotaEtapa2 notaEtapa3;
  NotaEtapa2 notaEtapa4;
  double mediaDisciplina;
  NotaEtapa2 notaAvaliacaoFinal;
  double mediaFinalDisciplina;

  Boletim(
      {this.codigoDiario,
      this.disciplina,
      this.segundoSemestre,
      this.cargaHoraria,
      this.cargaHorariaCumprida,
      this.numeroFaltas,
      this.percentualCargaHorariaFrequentada,
      this.situacao,
      this.quantidadeAvaliacoes,
      this.notaEtapa1,
      this.notaEtapa2,
      this.notaEtapa3,
      this.notaEtapa4,
      this.mediaDisciplina,
      this.notaAvaliacaoFinal,
      this.mediaFinalDisciplina});

  Boletim.fromJson(Map<String, dynamic> json) {
    codigoDiario = json['codigo_diario'];
    disciplina = json['disciplina'];
    segundoSemestre = json['segundo_semestre'];
    cargaHoraria = json['carga_horaria'];
    cargaHorariaCumprida = json['carga_horaria_cumprida'];
    numeroFaltas = json['numero_faltas'];
    percentualCargaHorariaFrequentada =
        json['percentual_carga_horaria_frequentada'];
    situacao = json['situacao'];
    quantidadeAvaliacoes = json['quantidade_avaliacoes'];
    notaEtapa1 = json['nota_etapa_1'] != null
        ? new NotaEtapa1.fromJson(json['nota_etapa_1'])
        : null;
    notaEtapa2 = json['nota_etapa_2'] != null
        ? new NotaEtapa2.fromJson(json['nota_etapa_2'])
        : null;
    notaEtapa3 = json['nota_etapa_3'] != null
        ? new NotaEtapa2.fromJson(json['nota_etapa_3'])
        : null;
    notaEtapa4 = json['nota_etapa_4'] != null
        ? new NotaEtapa2.fromJson(json['nota_etapa_4'])
        : null;
    mediaDisciplina = json['media_disciplina'];
    notaAvaliacaoFinal = json['nota_avaliacao_final'] != null
        ? new NotaEtapa2.fromJson(json['nota_avaliacao_final'])
        : null;
    mediaFinalDisciplina = json['media_final_disciplina'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codigo_diario'] = this.codigoDiario;
    data['disciplina'] = this.disciplina;
    data['segundo_semestre'] = this.segundoSemestre;
    data['carga_horaria'] = this.cargaHoraria;
    data['carga_horaria_cumprida'] = this.cargaHorariaCumprida;
    data['numero_faltas'] = this.numeroFaltas;
    data['percentual_carga_horaria_frequentada'] =
        this.percentualCargaHorariaFrequentada;
    data['situacao'] = this.situacao;
    data['quantidade_avaliacoes'] = this.quantidadeAvaliacoes;
    if (this.notaEtapa1 != null) {
      data['nota_etapa_1'] = this.notaEtapa1.toJson();
    }
    if (this.notaEtapa2 != null) {
      data['nota_etapa_2'] = this.notaEtapa2.toJson();
    }
    if (this.notaEtapa3 != null) {
      data['nota_etapa_3'] = this.notaEtapa3.toJson();
    }
    if (this.notaEtapa4 != null) {
      data['nota_etapa_4'] = this.notaEtapa4.toJson();
    }
    data['media_disciplina'] = this.mediaDisciplina;
    if (this.notaAvaliacaoFinal != null) {
      data['nota_avaliacao_final'] = this.notaAvaliacaoFinal.toJson();
    }
    data['media_final_disciplina'] = this.mediaFinalDisciplina;
    return data;
  }
}

class NotaEtapa1 {
  double nota;
  int faltas;

  NotaEtapa1({this.nota, this.faltas});

  NotaEtapa1.fromJson(Map<String, dynamic> json) {
    nota = json['nota'];
    faltas = json['faltas'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nota'] = this.nota;
    data['faltas'] = this.faltas;
    return data;
  }
}

class NotaEtapa2 {
  double nota;
  int faltas;

  NotaEtapa2({this.nota, this.faltas});

  NotaEtapa2.fromJson(Map<String, dynamic> json) {
    nota = json['nota'];
    faltas = json['faltas'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nota'] = this.nota;
    data['faltas'] = this.faltas;
    return data;
  }
}

