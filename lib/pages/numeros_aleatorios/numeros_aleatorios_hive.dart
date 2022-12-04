import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:trilhaapp/services/rng.dart';

class NumerosAleatoriosHivePage extends StatefulWidget {
  const NumerosAleatoriosHivePage({super.key});

  @override
  State<NumerosAleatoriosHivePage> createState() => _NumerosAleatoriosHivePageState();
}

class _NumerosAleatoriosHivePageState extends State<NumerosAleatoriosHivePage> {
  int? _numero = 0;
  late Box storage;
  final String chaveNumeroGerado = "generatedNum";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    storage = await Hive.openBox("rng");
    setState(() {
      _numero = storage.get(chaveNumeroGerado);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.plus_one),
          onPressed: () async {
            storage.put(chaveNumeroGerado, RNGService.rng());
            setState(() {
              loadData();
            });
          },
        ),
        body: Center(
          child: Text(
            "$_numero",
            style: const TextStyle(fontSize: 26),
          ),
        ),
      ),
    );
  }
}
