import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as provider;

import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  var documentsDirectory = await provider.getApplicationDocumentsDirectory();
  // Os arquivos do Hive vão ser criados na pasta Documentos
  Hive.init(documentsDirectory.path);

  runApp(const MyApp());
}
