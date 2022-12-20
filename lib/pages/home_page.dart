import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/image_assets.dart';
import 'package:trilhaapp/pages/card_page.dart';
import 'package:trilhaapp/pages/list_view_horizontal.dart';
import 'package:trilhaapp/pages/list_view_vertical.dart';
import 'package:trilhaapp/pages/tarefas_page/tarefa_sqlite_page.dart';
// import 'package:trilhaapp/pages/tarefas_page/tarefas_page.dart';
import 'package:trilhaapp/shared/widgets/custom_drawer.dart';

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
  void dispose() {
    colorPagesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _pagePos,
            onTap: (posValue) {
              _changePage(posValue);
            },
            items: const [
              BottomNavigationBarItem(
                label: "Red",
                icon: Icon(
                  Icons.color_lens,
                  color: Colors.red,
                ),
              ),
              BottomNavigationBarItem(
                label: "Green",
                icon: Icon(
                  Icons.color_lens,
                  color: Colors.green,
                ),
              ),
              BottomNavigationBarItem(
                label: "Blue",
                icon: Icon(
                  Icons.color_lens,
                  color: Colors.blue,
                ),
              ),
              BottomNavigationBarItem(
                label: "Alpha",
                icon: Icon(
                  Icons.color_lens,
                  color: Colors.amber,
                ),
              ),
              BottomNavigationBarItem(
                label: "Hue",
                icon: Icon(
                  Icons.color_lens,
                  color: Colors.lightBlue,
                ),
              ),
            ],
          ),
          drawer: const CustomDrawer(),
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
                  children: const [
                    CardPage(),
                    ImageAssetsPage(),
                    ListViewVPage(),
                    ListViewHPage(),
                    TarefaSQLitePage(),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
