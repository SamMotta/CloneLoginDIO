import 'package:hive/hive.dart';
import 'package:trilhaapp/models/model.tarefa_hive.dart';

class TarefaHiveRepository {
  static late Box _box;

  TarefaHiveRepository._load();

  static Future<TarefaHiveRepository> load() async {
    if (Hive.isBoxOpen('tarefaModel')) {
      _box = Hive.box('tarefaModel');
    } else {
      _box = await Hive.openBox('tarefaModel');
    }

    return TarefaHiveRepository._load();
  }

  void save(TarefaModel tarefa) {
    _box.add(tarefa);
  }

  void update(TarefaModel tarefa) {
    tarefa.save();
  }

  void delete(TarefaModel tarefa) {
    tarefa.delete();
  }

  List<TarefaModel> get(bool notConcluded) {
    if (notConcluded) {
      return _box.values
          .cast<TarefaModel>()
          .where((element) => !element.isFinished)
          .toList();
    }

    return _box.values.cast<TarefaModel>().toList();
  }
}
