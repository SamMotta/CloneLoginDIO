import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as provider;

import 'package:trilhaapp/models/model.dados_cadastrais.dart';
import 'package:trilhaapp/models/model.tarefa_hive.dart';
import 'package:trilhaapp/repositories/SQLite/database.dart';

import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var documentsDirectory = await provider.getApplicationDocumentsDirectory();
  // Os arquivos do Hive vão ser criados na pasta Documentos
  Hive.init(documentsDirectory.path);

  // Registra um HiveAdapter
  Hive.registerAdapter(DadosCadastraisAdapter());
  Hive.registerAdapter(TarefaModelAdapter());
  await SQLiteDataBase().initDatabase();

  runApp(const MyApp());
}
