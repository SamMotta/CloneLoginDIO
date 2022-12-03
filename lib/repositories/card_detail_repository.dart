import 'package:trilhaapp/models/model.card_detail.dart';

class CardDetailRepository {
  Future<CardDetail> getCardDetail() async {
    await Future.delayed(const Duration(seconds: 5));
    return CardDetail(
      1,
      "Cardzinho",
      """No entanto, não podemos esquecer que o novo modelo estruturalista aqui preconizado exige a precisão e a definição das posturas dos filósofos divergentes com relação às atribuições conceituais. Do mesmo modo, uma adoção de metodologias descentralizadoras reabilita a condição inicial da velha terra grega fraturada. A prática cotidiana prova que a consolidação das estruturas psico-lógicas consistiria primeiramente em não pôr o acontecimento sob a autoridade de uma nova origem pura da cartografia dessa rede urbana de ligações subterrâneas. Este pensamento está vinculado à desconstrução da metafísica, pois o conceito de diáthesis e os princípios fundamentais de rhytmos e arrythmiston facilita a criação do sistema de formação de quadros que corresponde às necessidades lógico-estruturais. Este é um problema que remete tanto à Epistemologia platônica, quanto à Dialética hegeliana, tendo em vista que o início da atividade geral de formação de conceitos reduziria a importância dos paradigmas filosóficos.""",
      "https://hermes.digitalinnovation.one/assets/diome/logo.png",
    );
  }
}
