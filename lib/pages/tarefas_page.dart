import 'package:flutter/material.dart';
import 'package:trilhaapp/models/model.tarefa.dart';
import 'package:trilhaapp/repositories/tarefa_repository.dart';

class TarefaPage extends StatefulWidget {
  const TarefaPage({super.key});

  @override
  State<TarefaPage> createState() => _TarefaPageState();
}

class _TarefaPageState extends State<TarefaPage> {
  var tarefaRepo = TarefaRepository();
  List<Tarefa> _tarefas = [];
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    obterTarefas();
  }

  void obterTarefas() async {
    _tarefas = await tarefaRepo.listarTarefas();
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
                    await tarefaRepo.addTarefa(Tarefa(
                      descriptionController.text.trim(),
                      false,
                    ));
                    setState(() {});
                  },
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.note_add),
      ),
      body: ListView.builder(
        itemCount: _tarefas.length,
        itemBuilder: (context, index) {
          Tarefa tarefa = _tarefas[index];
          return Dismissible(
            key: Key(tarefa.id),
            child: ListTile(
              title: Text(tarefa.description),
              trailing: Switch(
                value: tarefa.isFinished,
                onChanged: (value) async {
                  await tarefaRepo.alterarTarefa(tarefa.id, value);
                  obterTarefas();
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
