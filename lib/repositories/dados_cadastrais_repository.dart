import 'package:hive/hive.dart';
import 'package:trilhaapp/models/model.dados_cadastrais.dart';

class DadosCadastraisRepository {
  static late Box _box;

  DadosCadastraisRepository._load();

  static Future<DadosCadastraisRepository> load() async {
    if (Hive.isBoxOpen('cadastroModel')) {
      _box = Hive.box('cadastroModel');
    } else {
      _box = await Hive.openBox('cadastroModel');
    }

    return DadosCadastraisRepository._load();
  }

  void save(DadosCadastrais model) {
    _box.put('cadastroModel', model);
  }

  DadosCadastrais get() {
    DadosCadastrais? dadosModel = _box.get('cadastroModel');

    if (dadosModel == null) {
      return DadosCadastrais.empty();
    }

    return dadosModel;
  }
}
