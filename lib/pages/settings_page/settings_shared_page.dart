import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsSharedPage extends StatefulWidget {
  const SettingsSharedPage({super.key});

  @override
  State<SettingsSharedPage> createState() => SettingsSharedPageState();
}

class SettingsSharedPageState extends State<SettingsSharedPage> {
  late SharedPreferences prefs;
  TextEditingController usernameController = TextEditingController();
  TextEditingController userHeightController = TextEditingController();

  String? user;
  double? userHeight;
  bool pushNotications = false;
  bool lightTheme = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    prefs = await SharedPreferences.getInstance();

    setState(() {
      usernameController.text = prefs.getString("username") ?? "";
      userHeightController.text =
          (prefs.getDouble("userHeight") ?? 0).toString();
      pushNotications = prefs.getBool("pushNotifications") ?? false;
      lightTheme = prefs.getBool("lightTheme") ?? false;
    });
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
                value: lightTheme,
                onChanged: (value) {
                  setState(() {
                    lightTheme = value;
                  });
                },
              ),
              SwitchListTile(
                title: const Text(
                  "Receber notificações push",
                  style: TextStyle(fontSize: 22),
                ),
                value: pushNotications,
                onChanged: (value) {
                  setState(() {
                    pushNotications = value;
                  });
                },
              ),
              TextButton(
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  Navigator.pop(context);
                  try {
                    await prefs.setDouble(
                      "userHeight",
                      double.parse(userHeightController.text),
                    );
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
                          ),
                        ],
                      ),
                    );
                  }
                  await prefs.setString("username", usernameController.text);
                  await prefs.setBool("pushNotifications", pushNotications);
                  await prefs.setBool("lightTheme", lightTheme);
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
