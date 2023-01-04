import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:trilhaapp/models/model.ViaCep.dart';
import 'package:trilhaapp/repositories/via_cep_repository.dart';

class ConsultaCepPage extends StatefulWidget {
  const ConsultaCepPage({super.key});

  @override
  State<ConsultaCepPage> createState() => _ConsultaCepPageState();
}

class _ConsultaCepPageState extends State<ConsultaCepPage> {
  TextEditingController cepController = TextEditingController();
  ViaCEPModel viaCEPModel = ViaCEPModel();
  ViaCepRepository viaCepRepo = ViaCepRepository();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            children: [
              const Text(
                "Consulta de CEP",
                style: TextStyle(fontSize: 22),
              ),
              TextField(
                controller: cepController,
                keyboardType: TextInputType.number,
                maxLength: 8,
                onChanged: (value) async {
                  String cep = value.replaceAll(RegExp(r'[^0-9]'), '');
                  if (cep.length == 8) {
                    setState(() {
                      loading = true;
                    });

                    viaCEPModel = await viaCepRepo.consultarCEP(cep);
                  }
                  setState(() {
                    loading = false;
                  });
                },
              ),
              const SizedBox(height: 48),
              Visibility(
                  visible: loading, child: const CircularProgressIndicator()),
              Text(
                viaCEPModel.logradouro ?? "",
                style: const TextStyle(fontSize: 22),
              ),
              (viaCEPModel.localidade != null &&
                          viaCEPModel.localidade!.isNotEmpty) &&
                      (viaCEPModel.uf != null && viaCEPModel.uf!.isNotEmpty)
                  ? Text(
                      "${viaCEPModel.localidade} - ${viaCEPModel.uf}",
                      style: const TextStyle(fontSize: 22),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
