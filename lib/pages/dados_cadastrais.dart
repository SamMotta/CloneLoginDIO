import 'package:flutter/material.dart';

class DadosCadastrais extends StatelessWidget {
  final String texto;
  final List<String> dados;
  const DadosCadastrais({Key? key, required this.texto, required this.dados})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(texto),
        ),
        body: Column(children: <Widget>[
          // Listinha dinâmica
          for (var i in dados)
            Center(
                heightFactor: 2,
                child: Text(
                  i,
                  style: const TextStyle(
                    fontSize: 26,
                  ),
                ))
        ]),
      ),
    );
  }
}
