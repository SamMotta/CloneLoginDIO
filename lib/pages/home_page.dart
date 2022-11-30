import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/dados_cadastrais.dart';
import 'package:trilhaapp/pages/green_page.dart';
import 'package:trilhaapp/pages/red_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController colorPagesController = PageController();

  int _pagePos = 0;

  void _changePage(posValue) {
    setState(() {
      _pagePos = posValue;
      colorPagesController.jumpToPage(posValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: _pagePos,
              onTap: (posValue) {
                _changePage(posValue);
              },
              items: const [
                BottomNavigationBarItem(
                  label: "Red",
                  icon: Icon(Icons.color_lens),
                ),
                BottomNavigationBarItem(
                  label: "Green",
                  icon: Icon(Icons.color_lens),
                ),
                BottomNavigationBarItem(
                  label: "Blue",
                  icon: Icon(Icons.color_lens),
                ),
              ]),
          drawer: Drawer(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: double.infinity,
                      child: const Text("Dados cadastráis"),
                    ),
                    onTap: () {
                      // Drawer é "considerado" como uma tela
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DadosCadastrais(
                              texto: 'Meus Dados',
                              dados: <String>[
                                "Nome",
                                "Endereço",
                                "CPF",
                                "Cidade"
                              ],
                            ),
                          ));
                    },
                  ),
                  const Divider(),
                  InkWell(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: double.infinity,
                      child: const Text("Termos de uso e privacidade"),
                    ),
                    onTap: () {},
                  ),
                  const Divider(),
                  InkWell(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: double.infinity,
                      child: const Text("Configurações"),
                    ),
                    onTap: () {},
                  ),
                  const Divider(),
                ],
              ),
            ),
          ),
          appBar: AppBar(
            title: const Text("Home"),
          ),
          body: Column(
            children: [
              // Para usar a PageView em outros Widgets, é necessário usar o Expanded
              Expanded(
                child: PageView(
                  controller: colorPagesController,
                  onPageChanged: _changePage,
                  children: [
                    const RedPage(),
                    const GreenPage(),
                    Container(
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
