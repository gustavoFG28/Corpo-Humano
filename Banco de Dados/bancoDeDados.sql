create table Sistema(
codigoSistema int primary key not null,
nome varchar(50) not null,
descricao ntext not null
)

create table Orgao
(
codigoOrgao int primary key not null,
descricao ntext not null,
nome varchar(30) not null,
imagem varchar(50) not null,
codigoSistema int not null
constraint fkSistema foreign key(codigoSistema) references Sistema(codigoSistema)
)



create table Usuario(
codigoUsuario int primary key not null,
nome varchar(30) not null,
sobrenome varchar(30) not null,
senha varchar(30) not null,
email varchar(40) not null,
)

create table Acesso(
idAcesso int primary key not null,
data datetime not null,
codigoUsuario int not null
constraint fkUsuario foreign key(codigoUsuario) references Usuario(codigoUsuario)
)

create table Quiz
(
codigoQuiz int primary key not null,
pergunta ntext  not null,
resposta ntext not null,
codigoUsuario int not null
constraint fkQuizUsuario foreign key(codigoUsuario) references Usuario(codigoUsuario)
)

create table Ranking
(
codigoQuiz int primary key not null,
nome varchar(30) not null,
codigoUsuario int not null
constraint fkRnkUsuario foreign key(codigoUsuario) references Usuario(codigoUsuario),
pontos int not null,
data datetime not null
)

alter table Usuario add imagem varchar(50)
alter table Usuario add imgFundo varchar(50)
alter table Usuario drop column sobrenome


insert into Sistema values(1, 'Sistema Digestório', 'O Sistema Digestório é formado por um conjunto de órgãos cuja função é transformar os alimentos,
por meio de processos mecânicos e químicos. É constítuido pela boca, faringe, esôfago, estômago, intestino delgado e intestino grosso.
Além de órgãos anexos como as glândulas salivares, pâncreas, fígado, vesícula biliar, dentes e língua. 
Para mais informações, acesse: https://www.infoescola.com/anatomia-humana/sistema-digestorio/
http://www.anatomiadocorpo.com/sistema-digestorio-aparelho-digestivo/')

insert into Orgao values(1,'A boca, cavidade oval, é a porta de entrada dos alimentos. Quando ingeridos, são mastigados através da digestão mecânica.
Nela, acontece o ínicio da digestão química dos carboidratos, onde o amido é decomposto em moléculas de glicose e maltose, através da saliva.

Anexos envolvidos:

Glândulas salivares: Produzem a saliva, que é constítuida de água, mucina e amilase.

Língua: Sua mobilidade e sensibilidade aos sabores a torna um auxiliar preciso da mastigação.

Dentes: Órgãos esbranquiçados, duros, de consistêcia pétrea, implantados nos alvéolos dos maxilares.

Para mais informações acesse:
http://www.anatomiadocorpo.com/sistema-digestorio-aparelho-digestivo/boca/
http://www.anatomiadocorpo.com/sistema-digestorio-aparelho-digestivo/boca/saliva-mastigacao-degluticao-ptialina-mucina-lisozima/', 'Boca', '\OrgaosImagens\Digestorio\boca.png', 1)

insert into Orgao values(2,'Órgão tubular, com tamanho variado entre 12 à 15cm. É uma estrutura de grande resistência, pois suporta correntes de ar cuja velocidade varia entre 
IS(respiração normal) e 300km/h(tosse e espirro) sem lhe causar dano algum. Sua função é circulção de bolos alimentares e ar, pois esta comunica-se com a laringe levando o ar e 
com o esôfago levando alimento.

Para mais informações, acesse:
https://www.infoescola.com/anatomia-humana/faringe/
http://www.anatomiadocorpo.com/sistema-digestorio-aparelho-digestivo/faringe/', 'Faringe', '\OrgaosImagens\Digestorio\faringe.png', 1)


insert into Orgao values(3,'O esôfago é um conduto musculoso que liga a faringe ao estômago, controlado pelo sistema nervoso autônomo. Assim, por meio de ondas de 
contrações involuntárias, conhecidas como peristaltismo ou movimentos peristálticos, o conduto musculoso vai espremendo os alimentos e 
levando-os em direção ao estômago. 

Para mais informações, acesse:
http://www.anatomiadocorpo.com/sistema-digestorio-aparelho-digestivo/esofago/
https://www.infoescola.com/sistema-digestivo/esofago/', 'Esôfago', '\OrgaosImagens\Digestorio\esofago.png' , 1)

insert into Orgao values(4,'O estômago é um órgão do tubo digestivo que tem funções endócrinas e exócrinas. Suas principais 
funções são adicionar um fluído ácido ao alimento ingerido, transformando este bolo alimentar no chamado quimo, através da atividade muscular e da enzima pepsina, além de
iniciar a digestão das proteínas. Produz também uma lipase gástrica, que com o auxílio da lipase lingual, digere os triglicerídeos. O epitélio que reveste a mucosa
gástrica sofre invaginação em direção à lâmina própria, dando origem às fossetas gástricas, sendo que nestas, desembocam as glândulas que secretam o suco gástrico. 
Para mais informações, acesse:
http://www.anatomiadocorpo.com/sistema-digestorio-aparelho-digestivo/estomago/
https://www.infoescola.com/sistema-digestivo/estomago/', 'Estômago','\OrgaosImagens\Digestorio\estomago.png', 1)

insert into Orgao values(5,'O intestino delgado é revestido por uma mucosa enrugada que apresenta inúmeras projeções. Tem a função de segregar as várias enzimas digestivas, dando 
origem a móleculas pequenas e solúveis como glicose, aminoácidos e glicerol. O intestino delgado está dividido em três porções: o duodeno, o jejuno e o íleo. O duodeno diminui a acidez 
do quimo por meio do suco pancreático  que contém enzimas que o neutralizam. Logo, o quimo é banhado pela bile, armazenada na vesícula biliar, emulsificando os lipídios. O jejuno e íleo, 
levam a “pasta” até o intestino grosso.

Anexos envolvidos:
Pâncreas: O pâncreas tem funções endócrinas e exócrinas. A parte endócrina é composta por grupos de células chamadas ilhotas pancreáticas, formadas por três grupos de células 
que produzem glucagon, insulina e somatostatina ambos lançados diretamente na corrente sanguínea. Já a porção exócrina do pâncreas participa na digestão secretando enzimas digestivas
para o duodeno, através de estruturas chamas ácinos. 

Fígado:
O fígado é a maior glândula do corpo humano e pode executar mais de 500 funções, como: armazenamento e liberação de glicose, metabolismo de lipídeos e proteínas 
(conversão de amônia em uréia), síntese da maioria das proteínas do plasma, processamento de drogas e hormônios, destruição das células sanguíneas desgastadas e bactérias,
emulsificação da gordura durante o processo de digestão através da secreção da bile, etc.

Para mais informações, acesse:
https://www.infoescola.com/anatomia-humana/intestino-delgado/
http://www.anatomiadocorpo.com/sistema-digestorio-aparelho-digestivo/intestino/
https://www.infoescola.com/anatomia-humana/pancreas/
http://www.anatomiadocorpo.com/sistema-endocrino/pancreas/
http://www.anatomiadocorpo.com/sistema-digestorio-aparelho-digestivo/figado/
https://www.infoescola.com/anatomia-humana/figado/','Intestino', 'Intestino Delgado','\OrgaosImagens\Digestorio\intestinoDelgado.png', 1)

insert into Orgao values(6, 'O intestino grosso é responsável por armazenar e eliminar os resíduos da digestão e absorver os nutrientes que o intestino delgado não assimilou
e a água tanto a ingerida, quanto a das secreções digestivas. É dividido em ceco, onde os resíduos alimentares, já constituindo o bolo fecal, passam ao cólon e reto. Quando o 
alimento chega ao cólon descendente, o bolo fecal permanece estagnado por muitas horas. As fibras vegetais não digeridas nem absorvidas pelo sistema digestivo, passam por todo tubo
digestivo e formam uma porcentagem significativa da massa fecal. Glândulas da mucosa do intestino grosso, secretam muco, que lubrifica o bolo fecal, facilitando seu trânsito e sua
eliminação. O reto é a parte final do intestino grosso, e termina com o canal anal que se comunica com o exterior através do ânus, por onde são 
eliminados os resíduos fecais. O esfíncter é um músculo localizado ao redor do ânus, que controla a passagem das fezes.
Para mais informações, acesse: https://www.infoescola.com/sistema-digestivo/intestino-grosso/
http://www.anatomiadocorpo.com/sistema-digestorio-aparelho-digestivo/intestino/', 'Intestino Grosso', '\OrgaosImagens\Digestorio\intestinoGrosso.png', 1)






insert into Sistema values(2, 'Sistema Esquelético', 'O sistema esquelético é formado por 206 ossos além de cartilagens, ligamentos e tendões, é responsável por
sustentar, proteger nossos órgãos e dar forma ao corpo. Atua em conjunto com o sistema articular e muscular para permitir o movimento. Outras funções são a produção de 
células sanguíneas na medula óssea e armazenamento de sais minerais, como o cálcio. O osso é uma estrutura viva, muito resistente e dinâmica. 
Para mais informações, acesse: https://www.todamateria.com.br/sistema-esqueletico/')

insert into Orgao values(7,'A face é constituída por quatorze ossos: um único móvel que é o maxilar inferior e treze fixos, que em  conjunto, formam o maxilar superior.
Dos trezes ossos fixos da face 12 formam seis pares, e um, o vômer, é ímpar. Os pares restantes são: os maxilares superiores, os malares, os nasais, os únguis, os ossos 
palatinos e os cartuchos inferiores.

Para mais informações, acesse: https://www.anatomiaonline.com/face/
http://www.anatomiadocorpo.com/esqueleto-humano-sistema-esqueletico-ossos/', 'Ossos da Face','\OrgaosImagens\Esqueleto\face.png' ,2)

insert into Orgao values(8,'O crânio é uma estrutura rígida(dura), cartilagionasa ou óssea. Ele protege e armazena o encéfalo. 
O crânio humano é composto de oito ossos: Parietal (dois), Temporal (dois), Frontal, Occipital, Esfenóide, Etmóide', 'Ossos da Face.
Para mais informações acesse: https://www.todabiologia.com/dicionario/cranio.htm 
http://www.anatomiadocorpo.com/esqueleto-humano-sistema-esqueletico-ossos/' ,'\OrgaosImagens\Esqueleto\face.png', 2)


insert into Orgao values(9,
'Bigorna: Localizada no ouvido médio, tem formato de bigorna e um corpo que se articula com o martelo.

Martelo: Presente no ouvido médio é formado por uma longa projeção, o manúbrio queestá inserido na membrana timpânica.

Estribo: Forma a cadeia auditiva e é o menor ossso do corpo humano. Articula-se com a bigorna.

Para mais informações, acesse: 
http://www.biologia.seed.pr.gov.br/modules/galeria/detalhe.php?foto=298&evento=3
http://www.biologia.seed.pr.gov.br/modules/galeria/detalhe.php?foto=452&evento=3
http://www.biologia.seed.pr.gov.br/modules/galeria/detalhe.php?foto=563&evento=3
https://www.hear-it.org/pt/O-ouvido-medio', 'Ossos do Ouvido','\OrgaosImagens\Esqueleto\ouvido.png',2)

insert into Orgao values(10, 'O osso hióide é um osso com forma de U superior à laringe, os dois braços projetam-se posteriormente a partir das extremidades laterais do corpo. O osso hióide 
é altamente móvel para muitos músculos e estruturas de partes moles na cabeça e pescoço e não articula com outro elemento esquelético nem na cabeça e nem no pescoço.

Para mais informações, acesse: https://www.portaleducacao.com.br/conteudo/artigos/fonoaudiologia/osso-hioide/37126', 'Pescoço', '\OrgaosImagens\Esqueleto\pescoco.png',2)

insert into Orgao values(11, 'Clavícula: forma a porção ventral do ombto, é um osso curvado como um "S" itálico,
situado acima da primeira costela. Articula-se com o manúbrio do esterno e com o  acrômio da escápula.

Escápula: é um osso chato bem fino, com uma forma triangular podendo ser translúcido 
em certos pontos. Forma a parte dorsal da cintura escapular.
Para mais informações, acesse: https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/membro-superior/escapula/ 
https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/membro-superior/clavicula/', 'Cintura escapular', '\OrgaosImagens\Esqueleto\escapula.png',2)

insert into Orgao values(12,'Úmero - é o maior e mais longo osso superior e se articula com a escápula, com o radio e com a ulna.

Ulna - é um osso longo localizado no meio do antebraço. Articula-se com o úmero e com o rádio.

Rádio - é um osso curto localizado na lateral do antebraço. Articula-se com o úmero, com a ulna e com os ossos do carpo.

Para mais informações, acesse: https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/membro-superior/umero/
https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/membro-superior/ulna/
https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/membro-superior/radio/
 ', 'Ossos do Braço', '\OrgaosImagens\Esqueleto\braco.png', 2)

insert into Orgao values(13, 'A mão tem no total 27 ossos trabalhando em conjunto. Junto com os músculos e 
articulações permitem o manuseio de objetos. Ela é divida em 3 regiões diferentes: 

O carpo - composto pelos ossos: escafoide, semilunar, piramidal , pisiforme,  trapézio, 
trapezoide, capitato e hamato.

O metacarpo  - composta por 5 ossos metacarpianos.

A falange - composta por 18 ossos.

Para mais informações, acesse: https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/membro-superior/ossos-da-mao/
https://www.todamateria.com.br/ossos-da-mao/
http://www.anatomiadocorpo.com/esqueleto-humano-sistema-esqueletico-ossos/mao-carpo-metacarpo-falanges/', 'Ossos da Mão', '\OrgaosImagens\Esqueleto\mao.png',2)

insert into Orgao values(14,'Costela: são formadas por 12 pares, alongadas, em forma de semi-arcos e ligam as 
vértebras torácicas ao esterno e são classificadas em:
* 7 Pares Verdadeiras: articulam se diretamente ao esterno
* 3 Pares Falsas Propriamente Ditas: articulam-se indiretamente (cartilagens)
* 2 Pares Falsas Flutuantes: são livres

Esterno: É um osso chato, plano e ímpar. Apresenta 3 partes:
* Manúbrio
* Corpo
* Processo Xifoide

Para mais informações, acesse: https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/torax/esterno/
https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/torax/costelas/', 'Tórax', '\OrgaosImagens\Esqueleto\torax.png', 2)

insert into Orgao values(15,'
Vértebras Cervicais: possui um corpo pequeno, exceto a primeira vértebra.

Vértebras Torácicas: não é bifurcado e se apresenta descendente e pontiagudo. Elas se articulam com as costelas e a sua superfície articular é chamada de fóvea e hemi-fóvea.
 
Vértebras Lombares: são maiores. O processo espinhal não é bifurcado, além de estar disposto em posição horizontal. 

Para mais informações, acesse: https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/coluna-vertebral/caracteristicas-regionais/', 'Coluna Vertebral','\OrgaosImagens\Esqueleto\coluna.png', 2)

insert into Orgao values(16,'Íliaco –  o membro inferior é responsável por sustentar o peso do corpo e pela capacidade de manter o equilíbrio. 
O Ilíaco é um osso plano, chato, irregular, par e constituído pela fusão de três ossos: ílio, ísquio e o púbis.

Sacro – conecta o tronco aos membros inferiores . Tem a forma de uma pirâmide quadrangular com a base voltada para cima e o ápice para baixo. Articula-se com a 
5ª Vértebra Lombar e com o Cóccix.

Cóccix - Fusão de 3 a 5 vértebras, apresenta a base voltada para cima e o ápice para baixo.

Para mais informações, acesse:    
https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/coluna-vertebral/sacro/
https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/coluna-vertebral/coccix/
https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/membro-inferior/iliaco/', 'Ossos da Cintura Pélvica', '\OrgaosImagens\Esqueleto\pelvica.png', 2)

insert into Orgao values(17,'Fêmur –  é o mais longo osso do corpo que se articula com o ossos do quadril, 
com a patela e com a tíbia.

Patela – é um osso pequeno e triangular, também chamado de rótula localizado 
na articulação do joelho.

Tíbia –  depois do fêmur o osso que suporta mais o peso. Articula-se com o fêmur
 e com a fíbula.

Fíbula – localizada lateralmente a tíbia, serve para a fixação dos músculos e não 
possui função de sustentação de peso.

Para mais informações, acesse: https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/membro-inferior/femur/
https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/membro-inferior/patela/
https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/membro-inferior/tibia/
https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/membro-inferior/fibula/', 'Ossos da Perna','\OrgaosImagens\Esqueleto\perna.png', 2)

insert into Orgao values(18,'O pé é dividido em 3 partes: 
Tarso – são 7 ossos dispostos em duas filas. Uma é formada pelo calcâneo e o astrágalo, que formam o calcanhar. A outra fila é  formada pelo osso 
cuboide e o osso escafoide e por três ossos chamados cuneiformes.

Metatarso –  5 ossos metatarsianos numerados no sentido lateral I, II, III, IV e V.

Dedos – são formados pela falange, falanginha e falangeta.

Para mais informações, acesse: https://planetabiologia.com/sistema-esqueletico-ossos-do-pe/
https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/membro-inferior/ossos-do-pe/', 'Ossos do Pé','\OrgaosImagens\Esqueleto\pe.png', 2)

insert into Sistema values(3, 'Sistema Respiratório', 'O Sistema Respiratório fornece oxigênio e remove gás carbônico do organismo, auxilia as células no metabolismo e
atua em conjunto com o sistema circulatório. É formado pelo nariz, cavidade do nariz, faringe, laringe, traquéia, brônquios e pulmões.
Para mais informações, acesse: https://www.infoescola.com/biologia/sistema-respiratorio/')

insert into Orgao values(19,'  O ar entra no sistema respiratório por meio das fossas nasais que são separadas por uma cartilagem chamada de septo. No interior do nariz
são encontrados pelos que retém partículas que entram junto com o ar, o nariz é responsável por esquentar, filtrar e umedecer o ar para os pulmões. 

Para mais informações, acesse: https://www.infoescola.com/biologia/sistema-respiratorio/ 
https://www.todamateria.com.br/sistema-respiratorio/', 'Nariz', '\OrgaosImagens\Respiratorio\nariz.png', 2)

insert into Orgao values(20,' A faringe é um órgão tubular que inicia-se nas coanas(abertura nasal posterior) 
com prolongação para baixo no pescoço com a forma de um funil. Se comunica com o 
esôfago, fossas nasais e ouvidos mantendo-se ligada à laringe e ao esôfago.
Ela é responsável pela circulação de ar e alimentos. Quando respriramos o ar 
entra nas fossas nasais e passa pela faringe encaminhando-se para traqueia e
pelos brônquios até chegar aos pulmões.


Para mais informações,acesse: https://www.infoescola.com/anatomia-humana/faringe/','Faringe','\OrgaosImagens\Respiratorio\faringe.png', 2)
insert into Orgao values(21,'','Laringe','\OrgaosImagens\Respiratorio\laringe.png', 2)
insert into Orgao values(22,'','Traqueia','\OrgaosImagens\Respiratorio\traqueia.png', 2)
insert into Orgao values(23,'','Brônquios','\OrgaosImagens\Respiratorio\bronquio.png', 2)
insert into Orgao values(24,'','Pulmões','\OrgaosImagens\Respiratorio\pulmao.png', 2)

insert into Sistema values(4, 'Sistema Circulatório', 'O Sistema Circulatório é divido em sistema cardiovascular e linfático. O sistema cardiovascular é formado pelo coração e 
vasos sanguíneos(veias, artérias e capilares). O coração bombeiao sangue e os vasos sanguíneos o transporta junto com  elementos essenciais para o funcionamento dos tecidos, 
como gás oxigênio e gás carbônico, hormônios, excretas metabólicas, células de defesa. O sistema linfático protege o organismo das doenças.
Para mais informações, acesse: https://www.infoescola.com/biologia/sistema-circulatorio/')


insert into Sistema values(5, 'Sistema Reprodutor Masculino', 'O Sistema Reprodutor Masculino é formado por órgãos internos e externos, que passam por um lento amadurecimento concluindo-se na puberdade, ou 
seja, quando as células sexuais ficam disponíveis para originar outro ser. É constítuido pelos testículos, epidídimos, canais deferentes, vesículas seminais, próstata, uretra e pênis. 
Para informações, acesse: https://www.infoescola.com/biologia/aparelho-reprodutor-masculino/ http://www.anatomiadocorpo.com/sistema-reprodutor-genital/masculino/')

insert into Sistema values(6, 'Sistema Reprodutor Feminino', 'O Sistema Reprodutor femino é responsável pela reprodução humana é formado pelos ovários que produzem 
os óvulos(gametas femininos), as tubas uterinas, que transportam os óvulos até o útero e o protegem, o útero, onde o embrião se desenvolve, a vagina e a vulva. 
Para mais informações, acesse: https://www.todamateria.com.br/sistema-reprodutor-feminino/  
https://www.infoescola.com/biologia/aparelho-reprodutor-feminino/')

insert into Sistema values(7, 'Sistema Muscular','O sistema muscular é composto  por aproximadamente 600 músculos, tecidos, cujas células ou fibras musculares possuem a propriedade de contratilidade e de produção de movimentos.  
Tem como funções: estabilidade corporal, produção de movimentos, manutenção da temperatura corporal, sustentação, auxílio nos fluxos sanguíneos.

Existem 3 tipos de músculos: 

Musculo Liso ou não estriado: músculos de contração involuntária, assegura a movimentação dos órgãos internos.

Músculo Estriado Cardíaco: músculos de contração involuntária, asseguram os vigorosos batimentos cardíacos.

Músculo Estriado Esquelético: músculos de contração voluntária, conectados com os ossos e cartilagens e, através das 
contrações, permitem os movimentos, as posições corporais, além de estabilizarem as articulações do organismo.

Para mais informações, acesse:
http://www.anatomiadocorpo.com/sistema-muscular/
https://www.infoescola.com/anatomia-humana/sistema-muscular/')

insert into Sistema values(8, 'Sistema Nervoso','O sistema nervoso é responsável pelo controle de um organismo, regulando as atividades corporais tanto voluntárias quanto involuntárias.
O sistema nervoso é divido em Sistema Nervoso Central (SNC) e Sistema Nervoso  Periférico (SNP).O SNC é composto pela medula espinhal, cérebro, bulbo, cerebelo
e ponte. Já o SNP pode ser divido em voluntário e autonômo. Para mais informações, acesse: https://www.infoescola.com/biologia/sistema-nervoso/')

insert into Sistema values(9, 'Sistema Urinário','O sistema urinário é responsável pela produção e eliminação de urina composta de aproximadamente 95% de água. 
Os principais excretas da urina humana são: a ureia, o cloreto de sódio e o ácido úrico., que filtram as  impurezas do sangue que circula no organismo. É composto pelos rins, 
ureteres, bexiga urinária e a uretra.
Para mais informações acesse: https://www.todamateria.com.br/sistema-urinario/')

insert into Orgao values( , 'A uretra é um tubo muscular que leva a urina da bexiga para o exterior. No sexo masculino ela dá passagem para o esperma durante a ejaculação e 
é formado pela porção prostática, uretra membrosa e a uretra esponjosa, já no sexo feminino é um órgao exclusivamente do aparelho urinário e é revestida pelo epitélio plano
estratificado. Para mais informações, acesse: https://www.infoescola.com/anatomia-humana/uretra/', 'Uretra', 'OrgaosImagens\Urinario\uretra.png', 9)


