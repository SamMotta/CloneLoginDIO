import 'dart:convert';

import 'package:trilhaapp/models/model.ViaCep.dart';
import 'package:http/http.dart' as http;

class ViaCepRepository {
  Future<ViaCEPModel> consultarCEP(String cep) async {
    http.Response response = await http.get(
      Uri.parse('https://viacep.com.br/ws/$cep/json'),
    );

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return ViaCEPModel.fromJson(json);
    }

    return ViaCEPModel();
  }
}
