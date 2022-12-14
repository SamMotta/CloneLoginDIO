import 'package:hive/hive.dart';

part 'model.dados_cadastrais.g.dart';

@HiveType(typeId: 0)
class DadosCadastrais extends HiveObject {
  @HiveField(0)
  String? name;

  @HiveField(1)
  DateTime? birthday;

  @HiveField(2)
  String? experienceLevel;

  @HiveField(3)
  List<String> langs = [];

  @HiveField(4)
  int? experienceTime;

  @HiveField(5)
  double? wageExpectation;

  DadosCadastrais(this.name, this.birthday, this.experienceLevel, this.langs, this.experienceTime, this.wageExpectation);
  DadosCadastrais.empty() {
    name = "";
    birthday = null;
    experienceLevel = "";
    langs = [];
    experienceTime = 0;
    wageExpectation = 0;
  }
}
