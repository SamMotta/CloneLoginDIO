import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/dados_cadastrais.dart';
import 'package:trilhaapp/pages/login_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Material(
            color: Colors.deepPurple.shade600,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  builder: (context) => Wrap(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const ListTile(
                          title: Text(
                            "Câmera",
                            style: TextStyle(fontSize: 18),
                          ),
                          leading: Icon(Icons.photo_camera),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const ListTile(
                          title: Text(
                            "Galeria",
                            style: TextStyle(fontSize: 18),
                          ),
                          leading: Icon(Icons.photo),
                        ),
                      ),
                    ],
                  ),
                );
              },
              child: UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                margin: EdgeInsets.zero,
                accountName: const Text(
                  "Samuel Teixeira",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: const Text(
                  "sammotta19@gmail.com",
                  style: TextStyle(fontSize: 16),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.network(
                    "https://hermes.digitalinnovation.one/assets/diome/logo.png",
                    cacheHeight: 76,
                    cacheWidth: 198,
                  ),
                ),
              ),
            ),
          ),
          // Espaçamento igual para todos
          const Divider(
            color: Colors.transparent,
            height: 8,
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              width: double.infinity,
              child: Row(
                children: const [
                  Icon(Icons.person),
                  SizedBox(width: 6),
                  Text("Dados cadastrais"),
                ],
              ),
            ),
            onTap: () {
              // Drawer é "considerado" como uma tela
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DadosCadastraisPage(),
                  ));
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              width: double.infinity,
              child: Row(
                children: const [
                  Icon(Icons.policy),
                  SizedBox(width: 6),
                  Text("Termos de uso e privacidade"),
                ],
              ),
            ),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Column(
                    children: const [
                      Text(
                        "Termos de uso e privacidade",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        """O espírito dionisíaco da música e poesia nos ensinou que a infinita diversidade da realidade única é condição suficiente das condições epistemológicas e cognitivas exigidas. Por outro lado, a complexidade dos estudos efetuados cumpre um papel essencial na formulação da fundamentação metafísica das representações. Não obstante, a estrutura atual da ideação semântica pode nos levar a considerar a reestruturação do sistema de conhecimento geral. 
                \nNo entanto, não podemos esquecer que o novo modelo estruturalista aqui preconizado auxilia a preparação e a composição das posturas dos filósofos divergentes com relação às atribuições conceituais. Do mesmo modo, a indeterminação contínua de distintas formas de fenômeno garante a contribuição de um grupo importante na determinação dos paradoxos de Zenão, amparados em uma proposta logicista. A prática cotidiana prova que a consolidação das estruturas psico-lógicas assume importantes posições no estabelecimento das coisas e o melhor dos mundos possíveis. Nunca é demais lembrar o peso e o significado destes problemas, uma vez que o conceito de diáthesis e os princípios fundamentais de rhytmos e arrythmiston facilita a criação do sistema de formação de quadros que corresponde às necessidades lógico-estruturais.""",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              width: double.infinity,
              child: Row(
                children: const [
                  Icon(Icons.settings),
                  SizedBox(width: 6),
                  Text("Configurações"),
                ],
              ),
            ),
            onTap: () {},
          ),
          const Divider(),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              width: double.infinity,
              child: Row(
                children: const [
                  Icon(Icons.exit_to_app),
                  SizedBox(width: 6),
                  Text("Sair"),
                ],
              ),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Tem certeza que deseja sair?"),
                  content: const Text(
                      "Caso realmente deseje sair, você terá de realizar o login novamente!"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ));
                      },
                      child: const Text("Sair"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancelar"),
                    ),
                  ],
                ),
              );
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
