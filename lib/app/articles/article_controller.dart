import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';

class ArticleController implements Disposable {
  final controller = StreamController();

  final listArticle = [
    [
      ["[image]assets/images/article_image_1.png"],
      ["[title]O que é Educação Financeira?"],
      [
        "[text]Segundo a OCDE (2005), educação financeira é “o processo mediante o qual os indivíduos e as sociedades melhoram a sua compreensão em relação aos conceitos e produtos financeiros, de maneira que, com informação, formação e orientação, possam desenvolver os valores e as competências necessários para se tornarem mais conscientes das oportunidades e riscos neles envolvidos e, então, poderem fazer escolhas bem informadas, saber onde procurar ajuda e adotar outras ações que melhorem o seu bem-estar. Assim, podem contribuir de modo mais consistente para a formação de indivíduos e sociedades responsáveis, comprometidos com o futuro”."
      ],
    ],
    [
      ["[image]assets/images/article_image_2.png"],
      ["[title]2 Dicas para ajudar no seu investimento"],
      ["[subTitle]1. Faça o seu planejamento financeiro"],
      [
        "[text]O primeiro para começar a investir é fazer o seu planejamento financeiro. Ele fornece o mapeamento das suas finanças, isto é, as entradas e saídas do seu orçamento. Para isso, você pode utilizar planilhas ou aplicativos de celular. Anote todos os gastos, até os pequenos como, o cafézinho de todos os dias. E não se esqueça dos gastos recorrentes que ocorrem em longos períodos como seguro, impostos e outros. Com o seu planejamento em mãos, identifique os gastos supérfluos e as oportunidades de economia. Assim, você terá mais dinheiro para investir. Estabeleça também o valor a ser aplicado e a frequência, por exemplo, aplicar R\$500,00 por mês. Além de fazer o planejamento financeiro, você deve segui-lo. Reserve algum tempo na semana para analisar o seu balanço. Em pouco tempo, a diferença será nítida."
      ],
      ["[subTitle]2. Saiba quais são os seus objetivos "],
      [
        "[text]Essa dica é muito importante. Tenha objetivos bem definidos. Eles serão uma motivação para você. Depois de fazer o seu planejamento financeiro, pense o que você quer realizar com o dinheiro poupado, por exemplo, conquistar a liberdade financeira, estudar fora do país ou montar o próprio negócio. Selecione cinco deles e separe-os em curto, médio e longo prazos. O período de conclusão ajuda a manter o foco para investir.  "
      ],
    ],
  ];

  @override
  void dispose() {
    controller.close();
  }
}
