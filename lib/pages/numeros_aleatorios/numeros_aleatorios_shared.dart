import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trilhaapp/services/rng.dart';

class NumerosAleatoriosSharedPage extends StatefulWidget {
  const NumerosAleatoriosSharedPage({super.key});

  @override
  State<NumerosAleatoriosSharedPage> createState() => _NumerosAleatoriosSharedPageState();
}

class _NumerosAleatoriosSharedPageState extends State<NumerosAleatoriosSharedPage> {
  int? _numero = 0;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    final storage = await SharedPreferences.getInstance();
    setState(() {
      _numero = storage.getInt("rng");
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
            final storage = await SharedPreferences.getInstance();
            await storage.setInt("rng", RNGService.rng());
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
