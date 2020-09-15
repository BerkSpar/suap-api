import 'package:suap_api/suap_api.dart';

void main() async {
  final suap = SUAP(SUAPAuth(user: '20191TADSSAJ0003', password: 'Bazuca01'));

  final boletins = await suap.getBoletins(ano: 2019, semestre: 1);

  for(var boletim in boletins){
    print('Disciplina: ${boletim.disciplina}');
    print('Média: ${boletim.mediaDisciplina}');
    print('Carga Horária Frequentada: ${boletim.percentualCargaHorariaFrequentada}\n');
  }
}
