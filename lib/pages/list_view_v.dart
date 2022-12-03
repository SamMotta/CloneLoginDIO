import 'package:flutter/material.dart';
import 'package:trilhaapp/shared/app_images.dart';

class ListViewVPage extends StatefulWidget {
  const ListViewVPage({super.key});

  @override
  State<ListViewVPage> createState() => _ListViewPageVState();
}

class _ListViewPageVState extends State<ListViewVPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Image.asset(AppImages.user2),
          title: const Text("Usuário 2"),
          subtitle: const Text("Opa"),
          trailing: PopupMenuButton<String>(
            onSelected: (value) {
              debugPrint(value);
            },
            itemBuilder: (context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: "menu1",
                child: Text("Opção 1"),
              ),
              const PopupMenuItem<String>(
                value: "menu2",
                child: Text("Opção 2"),
              ),
            ],
          ),
          isThreeLine: true,
        ),
        Image.asset(AppImages.user1),
        Image.asset(AppImages.user3),
        Image.asset(AppImages.paisagem1),
        Image.asset(AppImages.paisagem2),
        Image.asset(AppImages.paisagem3),
      ],
    );
  }
}
