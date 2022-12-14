import 'package:flutter/material.dart';
import 'package:trilhaapp/models/model.dados_cadastrais.dart';
import 'package:trilhaapp/repositories/dados_cadastrais_repository.dart';
import 'package:trilhaapp/repositories/linguagens_repository.dart';
import 'package:trilhaapp/repositories/niveis_repository.dart';

// Listinha dinâmica
/* for (var i in dados)
    Center(
      heightFactor: 2,
      child: Text(
        i,
        style: const TextStyle(
          fontSize: 26,
        ),
      ),
    ), */

class DadosCadastraisPage extends StatefulWidget {
  const DadosCadastraisPage({Key? key}) : super(key: key);

  @override
  State<DadosCadastraisPage> createState() => _DadosCadastraisPageState();
}

class _DadosCadastraisPageState extends State<DadosCadastraisPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();

  late DadosCadastraisRepository cadastrosRepo;
  DadosCadastrais cadastroModel = DadosCadastrais.empty();

  List<String> _levels = [];
  List<String> _langs = [];

  Text dataTemplateLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  List<DropdownMenuItem<int>> returnMenuItems(int max) {
    var items = <DropdownMenuItem<int>>[];

    for (var i = 0; i <= max; i++) {
      items.add(DropdownMenuItem(
        value: i,
        child: Text("$i"),
      ));
    }

    return items;
  }

  void validationError(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _levels = NiveisRepository.returnLevels();
    _langs = LinguagensRepository.returnLangs();
    loadData();
  }

  void loadData() async {
    cadastrosRepo = await DadosCadastraisRepository.load();
    cadastroModel = cadastrosRepo.get();
    _nameController.text = cadastroModel.name ?? "";
    _birthdayController.text =
        cadastroModel.birthday == null ? "" : cadastroModel.birthday.toString();

    if (_birthdayController.text.isNotEmpty) {
      cadastroModel.birthday = DateTime.parse(_birthdayController.text);
    }

    cadastroModel.langs = cadastroModel.langs;
    cadastroModel.experienceTime = cadastroModel.experienceTime ?? 0;
    cadastroModel.experienceLevel = cadastroModel.experienceLevel ?? "";
    cadastroModel.wageExpectation = cadastroModel.wageExpectation ?? 0;
    setState(() {});
  }

  @override
  void dispose() {
    _birthdayController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Meus Dados"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: ListView(
            children: <Widget>[
              dataTemplateLabel("Nome"),
              TextField(
                controller: _nameController,
                decoration:
                    const InputDecoration(contentPadding: EdgeInsets.zero),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: dataTemplateLabel("Data de Nascimento"),
              ),
              TextField(
                controller: _birthdayController,
                readOnly: true,
                onTap: () async {
                  DateTime? birthday = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );

                  if (birthday != null) {
                    _birthdayController.text = birthday.toString();
                    cadastroModel.birthday = birthday;
                  }
                },
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: dataTemplateLabel("Nível de experiência"),
              ),
              Column(
                children: _levels
                    .map(
                      (level) => RadioListTile(
                        title: Text(level.toString()),
                        value: level.toString(),
                        selected: cadastroModel.experienceLevel == level,
                        groupValue: cadastroModel.experienceLevel,
                        onChanged: (value) {
                          setState(() {
                            cadastroModel.experienceLevel = value.toString();
                          });
                        },
                      ),
                    )
                    .toList(),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: dataTemplateLabel("Linguagens preferidas"),
              ),
              Column(
                children: _langs
                    .map(
                      (lang) => CheckboxListTile(
                        title: Text(lang.toString()),
                        value: cadastroModel.langs.contains(lang),
                        onChanged: (value) {
                          if (value!) {
                            setState(() {
                              cadastroModel.langs.add(lang);
                            });
                          } else {
                            setState(() {
                              cadastroModel.langs.remove(lang);
                            });
                          }
                        },
                      ),
                    )
                    .toList(),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: dataTemplateLabel("Tempo de experiência"),
              ),
              DropdownButton(
                value: cadastroModel.experienceTime,
                isExpanded: true,
                items: returnMenuItems(10),
                dropdownColor: const Color.fromARGB(255, 30, 25, 44),
                style: const TextStyle(fontSize: 18, color: Colors.white),
                onChanged: (value) {
                  setState(() {
                    cadastroModel.experienceTime = value;
                  });
                },
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: dataTemplateLabel("Pretensão Salarial"),
              ),
              cadastroModel.wageExpectation! > 0
                  ? Text(
                      "Pretensão salarial R\$ ${cadastroModel.wageExpectation!.toStringAsFixed(0)}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  : const Text(
                      "Sem pretensão salarial",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
              Slider(
                min: 0,
                max: 100000,
                value: cadastroModel.wageExpectation!,
                onChanged: (value) {
                  setState(() {
                    cadastroModel.wageExpectation = value;
                  });
                },
              ),
              TextButton(
                onPressed: () {
                  if (_nameController.text.trim().length < 3) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("O nome deve ser preenchido!"),
                      ),
                    );
                    return;
                  }

                  if (cadastroModel.birthday == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Data de Nascimento inválida!"),
                      ),
                    );
                    return;
                  }

                  if (cadastroModel.experienceLevel == null ||
                      cadastroModel.experienceLevel!.trim() == '') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Um nível deve ser selecionado!"),
                      ),
                    );
                    return;
                  }

                  if (cadastroModel.langs.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Ao menos uma linguagem de programação deve ser selecionada!",
                        ),
                      ),
                    );

                    return;
                  }

                  if (cadastroModel.experienceTime == null ||
                      cadastroModel.experienceTime! < 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content:
                            Text("Selecione um tempo de experiência válido"),
                      ),
                    );
                    return;
                  }

                  cadastroModel.name = _nameController.text.trim();
                  cadastrosRepo.save(cadastroModel);
                  FocusManager.instance.primaryFocus?.unfocus();
                  Navigator.pop(context);
                },
                child: const Text("Salvar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
