import 'package:hive/hive.dart';

part 'model.tarefa_hive.g.dart';

@HiveType(typeId: 1)
class TarefaModel extends HiveObject {
  @HiveField(0)
  String description = "";

  @HiveField(1)
  bool isFinished = false;

  TarefaModel();

  TarefaModel.create(this.description, this.isFinished);
}
