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

class Usuario {
  int id;
  String matricula;
  String nomeUsual;
  String email;
  String urlFoto75x100;
  String tipoVinculo;
  Vinculo vinculo;

  Usuario(
      {this.id,
      this.matricula,
      this.nomeUsual,
      this.email,
      this.urlFoto75x100,
      this.tipoVinculo,
      this.vinculo});

  Usuario.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    matricula = json['matricula'];
    nomeUsual = json['nome_usual'];
    email = json['email'];
    urlFoto75x100 = json['url_foto_75x100'];
    tipoVinculo = json['tipo_vinculo'];
    vinculo =
        json['vinculo'] != null ? new Vinculo.fromJson(json['vinculo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['matricula'] = this.matricula;
    data['nome_usual'] = this.nomeUsual;
    data['email'] = this.email;
    data['url_foto_75x100'] = this.urlFoto75x100;
    data['tipo_vinculo'] = this.tipoVinculo;
    if (this.vinculo != null) {
      data['vinculo'] = this.vinculo.toJson();
    }
    return data;
  }
}

class Vinculo {
  String matricula;
  String nome;
  String curso;
  String campus;
  String situacao;
  String cotaSistec;
  String cotaMec;
  String situacaoSistemica;

  Vinculo(
      {this.matricula,
      this.nome,
      this.curso,
      this.campus,
      this.situacao,
      this.cotaSistec,
      this.cotaMec,
      this.situacaoSistemica});

  Vinculo.fromJson(Map<String, dynamic> json) {
    matricula = json['matricula'];
    nome = json['nome'];
    curso = json['curso'];
    campus = json['campus'];
    situacao = json['situacao'];
    cotaSistec = json['cota_sistec'];
    cotaMec = json['cota_mec'];
    situacaoSistemica = json['situacao_sistemica'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['matricula'] = this.matricula;
    data['nome'] = this.nome;
    data['curso'] = this.curso;
    data['campus'] = this.campus;
    data['situacao'] = this.situacao;
    data['cota_sistec'] = this.cotaSistec;
    data['cota_mec'] = this.cotaMec;
    data['situacao_sistemica'] = this.situacaoSistemica;
    return data;
  }
}

