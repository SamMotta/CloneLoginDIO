import 'package:trilhaapp/models/model.tarefa_sqlite.dart';
import 'package:trilhaapp/repositories/SQLite/database.dart';

class TarefaSQLiteRepo {
  Future<List<TarefaSqliteModel>> read(bool isIncomplete) async {
    List<TarefaSqliteModel> tarefas = [];
    var db = await SQLiteDataBase().getDatabase();
    var result = await db.rawQuery(isIncomplete
        ? "SELECT * FROM tarefas WHERE isCompleted = 0"
        : "SELECT * FROM tarefas");

    for (var el in result) {
      tarefas.add(TarefaSqliteModel(
        int.parse(el["id"].toString()),
        el["description"].toString(),
        el["isCompleted"] == 1,
      ));
    }

    return tarefas;
  }

  Future<void> create(TarefaSqliteModel tarefa) async {
    var db = await SQLiteDataBase().getDatabase();
    await db.rawInsert(
      'INSERT INTO tarefas(description, isCompleted) values(?,?)',
      [tarefa.description, tarefa.isCompleted],
    );
  }

  Future<void> update(TarefaSqliteModel tarefa) async {
    var db = await SQLiteDataBase().getDatabase();
    await db.rawUpdate(
      'UPDATE tarefas SET description = ?, isCompleted = ? WHERE id = ?',
      [
        tarefa.description,
        tarefa.isCompleted ? 1 : 0,
        tarefa.id,
      ],
    );
  }

  Future<void> delete(TarefaSqliteModel tarefa) async {
    var db = await SQLiteDataBase().getDatabase();
    await db.rawDelete(
      'DELETE FROM tarefas WHERE id = ?',
      [tarefa.id],
    );
  }
}
