import 'package:flutter/material.dart';
import 'package:trilhaapp/models/model.tarefa_sqlite.dart';
import 'package:trilhaapp/repositories/SQLite/tarefa_sqlite_repository.dart';

class TarefaSQLitePage extends StatefulWidget {
  const TarefaSQLitePage({super.key});

  @override
  State<TarefaSQLitePage> createState() => _TarefaSQLitePageState();
}

class _TarefaSQLitePageState extends State<TarefaSQLitePage> {
  TarefaSQLiteRepo tarefaRepo = TarefaSQLiteRepo();
  var _tarefas = <TarefaSqliteModel>[];
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
    _tarefas = await tarefaRepo.read(filter);
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
              title: const Text("Adicionar tarefa"),
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
                    tarefaRepo.create(
                      TarefaSqliteModel(
                        0,
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
                    "Apenas não concluídos",
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
                  TarefaSqliteModel tarefa = _tarefas[index];
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
                    //  Só para testes
                    key: Key(tarefa.id.toString()),
                    child: ListTile(
                      title: Text(tarefa.description),
                      trailing: Switch(
                        value: tarefa.isCompleted,
                        onChanged: (value) {
                          tarefa.isCompleted = value;
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
