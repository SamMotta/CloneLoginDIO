import 'package:flutter/material.dart';
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
  final TextEditingController _nameController = TextEditingController(text: "");
  final TextEditingController _birthdayController =
      TextEditingController(text: "");

  DateTime? _birthday;
  String _selectedLevel = "";
  final List<String> _selectedLangs = [];
  List<String> _levels = [];
  List<String> _langs = [];

  int _timeExperience = 0;
  double _wageExpectation = 0;

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
    _levels = NiveisRepository.returnLevels();
    _langs = LinguagensRepository.returnLangs();
    super.initState();
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
                    _birthday = birthday;
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
                        selected: _selectedLevel == level,
                        groupValue: _selectedLevel,
                        onChanged: (value) {
                          setState(() {
                            _selectedLevel = value.toString();
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
                        value: _selectedLangs.contains(lang),
                        onChanged: (value) {
                          if (value!) {
                            setState(() {
                              _selectedLangs.add(lang);
                            });
                          } else {
                            setState(() {
                              _selectedLangs.remove(lang);
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
                value: _timeExperience,
                isExpanded: true,
                items: returnMenuItems(10),
                dropdownColor: const Color.fromARGB(255, 30, 25, 44),
                style: const TextStyle(fontSize: 18, color: Colors.white),
                onChanged: (value) {
                  setState(() {
                    _timeExperience = value!;
                  });
                },
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: dataTemplateLabel("Pretensão Salarial"),
              ),
              _wageExpectation > 0
                  ? Text(
                      "Pretensão salarial R\$ ${_wageExpectation.toStringAsFixed(0)}",
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
                value: _wageExpectation,
                onChanged: (value) {
                  setState(() {
                    _wageExpectation = value;
                  });
                },
              ),
              TextButton(
                onPressed: () {
                  if (_nameController.text.trim().length < 3) {
                    validationError("O nome deve ser preenchido!");
                    return;
                  }

                  if (_birthday == null) {
                    validationError("Data de Nascimento inválida!");
                    return;
                  }

                  if (_selectedLevel.trim() == '') {
                    validationError("Um nível deve ser selecionado!");
                    return;
                  }

                  if (_selectedLangs.isEmpty) {
                    validationError("Ao menos uma linguagem de programação"
                        "deve ser selecionada!");
                    return;
                  }

                  if (_timeExperience < 0) {
                    validationError("Selecione um tempo de experiência válido");
                    return;
                  }

                  debugPrint("Dados salvos");
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
