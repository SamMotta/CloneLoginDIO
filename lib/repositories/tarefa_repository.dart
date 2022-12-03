import 'package:trilhaapp/models/model.tarefa.dart';

class TarefaRepository {
  final List<Tarefa> _tarefas = [];

  Future<void> addTarefa(Tarefa tarefa) async {
    await Future.delayed(const Duration(seconds: 1));
    _tarefas.add(tarefa);
  }

  Future<void> alterarTarefa(String id, bool isFinished) async {
    await Future.delayed(const Duration(seconds: 1));
    _tarefas.where((element) => element.id == id).first.isFinished = isFinished;
  }

  Future<List<Tarefa>> listarTarefas() async {
    await Future.delayed(const Duration(seconds: 3));
    return _tarefas;
  }
}
