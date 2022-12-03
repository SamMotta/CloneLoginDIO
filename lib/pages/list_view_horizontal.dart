import 'package:flutter/material.dart';
import 'package:trilhaapp/shared/app_images.dart';

class ListViewHPage extends StatefulWidget {
  const ListViewHPage({super.key});

  @override
  State<ListViewHPage> createState() => ListViewHPageState();
}

class ListViewHPageState extends State<ListViewHPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Card(
                  elevation: 8,
                  child: Image.asset(
                    AppImages.paisagem1,
                  ),
                ),
                Card(
                  elevation: 8,
                  child: Image.asset(
                    AppImages.paisagem2,
                  ),
                ),
                Card(
                  elevation: 8,
                  child: Image.asset(
                    AppImages.paisagem3,
                  ),
                ),
              ],
            ),
          ),
          Expanded(flex: 3,child: Container())
        ],
      ),
    );
  }
}
