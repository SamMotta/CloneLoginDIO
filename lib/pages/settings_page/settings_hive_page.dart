import 'package:flutter/material.dart';
import 'package:trilhaapp/models/model.settings.dart';
import 'package:trilhaapp/repositories/settings_repository.dart';

class SettingsHivePage extends StatefulWidget {
  const SettingsHivePage({super.key});

  @override
  State<SettingsHivePage> createState() => SettingsHivePageState();
}

class SettingsHivePageState extends State<SettingsHivePage> {
  late SettingsRepository storage;
  SettingsModel model = SettingsModel.empty();

  TextEditingController usernameController = TextEditingController();
  TextEditingController userHeightController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    storage = await SettingsRepository.load();
    model = storage.get();

    usernameController.text = model.username;
    userHeightController.text = model.height.toString();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Configurações"),
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    label: Text("Nome de usuário"),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextField(
                  controller: userHeightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text("Sua altura"),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SwitchListTile(
                title: const Text(
                  "Tema claro",
                  style: TextStyle(fontSize: 22),
                ),
                value: model.lightTheme,
                onChanged: (value) {
                  setState(() {
                    model.lightTheme = value;
                  });
                },
              ),
              SwitchListTile(
                title: const Text(
                  "Receber notificações push",
                  style: TextStyle(fontSize: 22),
                ),
                value: model.pushNotifications,
                onChanged: (value) {
                  setState(() {
                    model.pushNotifications = value;
                  });
                },
              ),
              TextButton(
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  try {
                    model.height = double.parse(userHeightController.text);
                  } catch (e) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Altura inválida"),
                        content: const Text("Digite uma altura válida!"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Fechar"),
                          )
                        ],
                      ),
                    );
                    return;
                  }

                  model.username = usernameController.text;
                  storage.save(model);
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
