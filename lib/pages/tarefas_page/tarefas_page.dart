import 'package:flutter/material.dart';
// import 'package:trilhaapp/models/model.tarefa.dart';
// import 'package:trilhaapp/repositories/tarefa_repository.dart';
import 'package:trilhaapp/models/model.tarefa_hive.dart';
import 'package:trilhaapp/repositories/tarefa_hive_repository.dart';

class TarefaPage extends StatefulWidget {
  const TarefaPage({super.key});

  @override
  State<TarefaPage> createState() => _TarefaPageState();
}

class _TarefaPageState extends State<TarefaPage> {
  // var tarefaRepo = TarefaRepository();
  late TarefaHiveRepository tarefaRepo;
  var _tarefas = <TarefaModel>[];
  TextEditingController descriptionController = TextEditingController();
  bool filter = false;

  @override
  void initState() {
    super.initState();
    obterTarefas();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void obterTarefas() async {
    tarefaRepo = await TarefaHiveRepository.load();
    _tarefas = tarefaRepo.get(filter);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Adicionar terefa"),
              content: Container(
                alignment: Alignment.center,
                height: 36,
                child: TextField(
                  controller: descriptionController,
                ),
              ),
              actions: [
                TextButton(
                  child: const Text("Cancelar"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                TextButton(
                  child: const Text("Salvar"),
                  onPressed: () async {
                    Navigator.pop(context);
                    tarefaRepo.save(
                      TarefaModel.create(
                        descriptionController.text.trim(),
                        false,
                      ),
                    );
                    obterTarefas();
                  },
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.note_add),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Apenas n??o conclu??dos",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Switch(
                    value: filter,
                    onChanged: (value) {
                      filter = !filter;
                      obterTarefas();
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _tarefas.length,
                itemBuilder: (context, index) {
                  TarefaModel tarefa = _tarefas[index];
                  return Dismissible(
                    direction: DismissDirection.startToEnd,
                    background: Container(
                      padding: const EdgeInsets.only(left: 12),
                      alignment: Alignment.centerLeft,
                      color: Colors.red,
                      child: const Icon(Icons.delete),
                    ),
                    onDismissed: (direction) {
                      tarefaRepo.delete(tarefa);
                      obterTarefas();
                    },
                    //  S?? para testes
                    key: Key(tarefa.key.toString()),
                    child: ListTile(
                      title: Text(tarefa.description),
                      trailing: Switch(
                        value: tarefa.isFinished,
                        onChanged: (value) {
                          tarefa.isFinished = value;
                          tarefaRepo.update(tarefa);
                          obterTarefas();
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
