-- Criação das tabelas

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

alter table Quiz add dificuldade varchar(10)
alter table Usuario add imagem varchar(50)
alter table Usuario add imgFundo varchar(50)
alter table Usuario drop column sobrenome


-- Inserção de Valores

insert into Sistema values(1, 'Sistema Digestório', 'O Sistema Digestório é formado por um conjunto de órgãos cuja função é transformar os alimentos,
por meio de processos mecânicos e químicos. É constítuido pela boca, faringe, esôfago, estômago, intestino delgado e intestino grosso. Além de órgãos
anexos como as glândulas salivares, pâncreas, fígado, vesícula biliar, dentes e língua. 
Para mais informações, acesse: https://www.infoescola.com/anatomia-humana/sistema-digestorio/
http://www.anatomiadocorpo.com/sistema-digestorio-aparelho-digestivo/')

insert into Orgao values(1,'A boca, cavidade oval, é a porta de entrada dos alimentos, que são mastigados através da digestão mecânica. Nela, acontece
o ínicio da digestão química dos carboidratos, onde o amido é decomposto em moléculas de glicose e maltose, através da saliva. Anexos envolvidos:

Glândulas salivares: Produzem a saliva, que é constítuida de água, mucina e amilase.

Língua: Sua mobilidade e sensibilidade aos sabores a torna um auxiliar preciso da mastigação.

Dentes: Órgãos esbranquiçados, duros, de consistêcia pétrea, implantados nos alvéolos dos maxilares.

Para mais informações acesse:  http://www.anatomiadocorpo.com/sistema-digestorio-aparelho-digestivo/boca/
http://www.anatomiadocorpo.com/sistema-digestorio-aparelho-digestivo/boca/saliva-mastigacao-degluticao-ptialina-mucina-lisozima/', 'Boca', '\OrgaosImagens\Digestorio\boca.png', 1)

insert into Orgao values(2,'Órgão tubular, com tamanho variado entre 12 à 15cm. É uma estrutura de grande resistência, pois suporta correntes de ar 
cuja velocidade varia entre IS(respiração normal) e 300km/h(tosse e espirro) sem lhe causar dano algum. Sua função é circulção de bolos alimentares 
e ar, pois ela comunica-se com a laringe e com o esôfago.

Para mais informações, acesse: https://www.infoescola.com/anatomia-humana/faringe/
http://www.anatomiadocorpo.com/sistema-digestorio-aparelho-digestivo/faringe/', 'Faringe', '\OrgaosImagens\Digestorio\faringe.png', 1)


insert into Orgao values(3,'O esôfago é um conduto musculoso que liga a faringe ao estômago, controlado pelo SNC(Sistema Nervoso Central). Assim, por 
meio de ondas de  contrações involuntárias, conhecidas como movimentos peristálticos, o conduto musculoso vai espremendo os alimentos levando-os em 
direção ao estômago. 

Para mais informações, acesse: http://www.anatomiadocorpo.com/sistema-digestorio-aparelho-digestivo/esofago/
https://www.infoescola.com/sistema-digestivo/esofago/', 'Esôfago', '\OrgaosImagens\Digestorio\esofago.png' , 1)

insert into Orgao values(4,'O estômago é um órgão do tubo digestivo que tem funções endócrinas e exócrinas. Suas principais funções são adicionar um 
fluído ácido através da atividade muscular e da enzima pepsina ao alimento ingerido, tranformando-o no chamado quimo  e  iniciar a digestão das proteínas.
Produz também uma lipase gástrica, que com o auxílio da lipase lingual, digere os triglicerídeos. 

Para mais informações, acesse: http://www.anatomiadocorpo.com/sistema-digestorio-aparelho-digestivo/estomago/
https://www.infoescola.com/sistema-digestivo/estomago/', 'Estômago','\OrgaosImagens\Digestorio\estomago.png', 1)

insert into Orgao values(5,'O intestino delgado é revestido por uma mucosa enrugada que apresenta inúmeras projeções. Tem a função de segregar as várias
enzimas digestivas, dando origem a móleculas pequenas e solúveis como glicose, aminoácidos e glicerol. O intestino delgado está dividido em três porções: 
o duodeno, o jejuno e o íleo. O duodeno diminui a acidez do quimo por meio do suco pancreático que contém enzimas que o neutralizam. Logo, o quimo é banhado
la bile, armazenada na vesícula biliar, emulsificando os lipídios. O jejuno e íleo, levam a “pasta” até o intestino grosso.

Anexos envolvidos:
Pâncreas: O pâncreas tem funções endócrinas e exócrinas.A porção exócrina do pâncreas participa na digestão secretando enzimas digestivas para o duodeno, 
através de estruturas chamas ácinos. 

Fígado:
O fígado é a maior glândula do corpo humano e pode executar mais de 500 funções, como: armazenamento e liberação de glicose, metabolismo de lipídeos e 
proteínas (conversão de amônia em uréia), processamento de drogas e hormônios, etc.

Para mais informações, acesse: https://www.infoescola.com/anatomia-humana/intestino-delgado/ http://www.anatomiadocorpo.com/sistema-digestorio-aparelho-digestivo/intestino/
https://www.infoescola.com/anatomia-humana/pancreas/  http://www.anatomiadocorpo.com/sistema-endocrino/pancreas/
http://www.anatomiadocorpo.com/sistema-digestorio-aparelho-digestivo/figado/ https://www.infoescola.com/anatomia-humana/figado/', 'Intestino Delgado','\OrgaosImagens\Digestorio\intestinoDelgado.png', 1)

insert into Orgao values(6, 'O intestino grosso é responsável por armazenar e eliminar os resíduos da digestão e por absorver os nutrientes que o intestino 
delgado não assimilou assim como a água. É dividido em ceco, onde os resíduos alimentares, já constituindo o bolo fecal, passam ao cólon e reto. Quando o 
alimento chega ao cólon descendente, o bolo fecal permanece estagnado por muitas horas. Glândulas da mucosa do intestino grosso, secretam muco,
que lubrifica o bolo fecal, facilitando seu trânsito e sua eliminação. O reto é a parte final do intestino grosso, e termina com o canal anal que se
comunica com o exterior através do ânus, por onde são eliminados os resíduos fecais.
Para mais informações, acesse: https://www.infoescola.com/sistema-digestivo/intestino-grosso/
http://www.anatomiadocorpo.com/sistema-digestorio-aparelho-digestivo/intestino/', 'Intestino Grosso', '\OrgaosImagens\Digestorio\intestinoGrosso.png', 1)






insert into Sistema values(2, 'Sistema Esquelético', 'O sistema esquelético é formado por 206 ossos além de cartilagens, ligamentos e tendões é responsável por
sustentar, proteger nossos órgãos e dar forma ao corpo. Atua em conjunto com o sistema articular e muscular para permitir o movimento. Outras funções são a 
produção de células sanguíneas na medula óssea e armazenamento de sais minerais. O osso é uma estrutura viva, muito resistente e dinâmica. 
Para mais informações, acesse: https://www.todamateria.com.br/sistema-esqueletico/')

insert into Orgao values(7,'A face é constituída por quatorze ossos: um único móvel que é o maxilar inferior e treze fixos, que em  conjunto, formam o maxilar superior.
Dos trezes ossos fixos da face 12 formam seis pares, e um, o vômer, é ímpar. Os pares restantes são: os maxilares superiores, os malares, os nasais, os únguis, os ossos 
palatinos e os cartuchos inferiores.

Para mais informações, acesse: https://www.anatomiaonline.com/face/
http://www.anatomiadocorpo.com/esqueleto-humano-sistema-esqueletico-ossos/', 'Ossos da Face','\OrgaosImagens\Esqueleto\face.png' ,2)

insert into Orgao values(8,'O crânio é uma estrutura rígida, cartilagionasa e óssea. Ele protege e armazena o encéfalo. O crânio humano é composto de oito
ossos: Parietal (dois), Temporal (dois), Frontal, Occipital, Esfenóide, Etmóide
Para mais informações acesse: https://www.todabiologia.com/dicionario/cranio.htm 
http://www.anatomiadocorpo.com/esqueleto-humano-sistema-esqueletico-ossos/' , 'Crânio','\OrgaosImagens\Esqueleto\cranio.png', 2)


insert into Orgao values(9,
'Bigorna: Localizada no ouvido médio, tem formato de bigorna e um corpo que se articula com o martelo.

Martelo: Presente no ouvido médio é formado por uma longa projeção, o manúbrio que está inserido na membrana timpânica.

Estribo: Forma a cadeia auditiva e é o menor ossso do corpo humano. Articula-se com a bigorna.

Para mais informações, acesse: 
http://www.biologia.seed.pr.gov.br/modules/galeria/detalhe.php?foto=298&evento=3
http://www.biologia.seed.pr.gov.br/modules/galeria/detalhe.php?foto=452&evento=3
http://www.biologia.seed.pr.gov.br/modules/galeria/detalhe.php?foto=563&evento=3
https://www.hear-it.org/pt/O-ouvido-medio', 'Ossículos do Ouvido','\OrgaosImagens\Esqueleto\ouvido.png',2)

insert into Orgao values(10, 'O osso hióide é um osso com forma de U superior à laringe, os dois braços projetam-se posteriormente a partir das extremidades 
laterais do corpo. O osso hióide é altamente móvel para muitos músculos e estruturas de partes moles na cabeça e pescoço, porém não se articula com outro 
elemento esquelético nem na cabeça e nem no pescoço.

Para mais informações, acesse: https://www.portaleducacao.com.br/conteudo/artigos/fonoaudiologia/osso-hioide/37126', 'Hióide', '\OrgaosImagens\Esqueleto\pescoco.png',2)

insert into Orgao values(11, 'Clavícula: forma a porção ventral do ombro, é um osso curvado como um "S" itálico, situado acima da primeira costela.
Articula-se com o manúbrio do esterno e com o acrômio da escápula.

Escápula: é um osso chato bem fino, com uma forma triangular podendo ser translúcido em certos pontos. Forma a parte dorsal da cintura escapular.

Para mais informações, acesse: https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/membro-superior/escapula/ 
https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/membro-superior/clavicula/', 'Cintura escapular', '\OrgaosImagens\Esqueleto\escapula.png',2)

insert into Orgao values(12,'Úmero - é o maior e mais longo osso superior e se articula com a escápula, com o radio e com a ulna.

Ulna - é um osso longo localizado no meio do antebraço. Articula-se com o úmero e com o rádio.

Rádio - é um osso curto localizado na lateral do antebraço. Articula-se com o úmero, com a ulna e com os ossos do carpo.

Para mais informações, acesse: https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/membro-superior/umero/
https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/membro-superior/ulna/
https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/membro-superior/radio/
 ', 'Membros Superiores', '\OrgaosImagens\Esqueleto\braco.png', 2)

insert into Orgao values(13, 'A mão tem no total 27 ossos trabalhando em conjunto. Junto com os músculos e articulações permitem o manuseio 
de objetos. Ela é divida em 3 regiões diferentes: 

O carpo - composto pelos ossos: escafoide, semilunar, piramidal , pisiforme, trapézio, trapezoide, capitato e hamato.

O metacarpo  - composta por 5 ossos metacarpianos.

A falange - composta por 18 ossos.

Para mais informações, acesse: https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/membro-superior/ossos-da-mao/
https://www.todamateria.com.br/ossos-da-mao/
http://www.anatomiadocorpo.com/esqueleto-humano-sistema-esqueletico-ossos/mao-carpo-metacarpo-falanges/', 'Ossos da Mão', '\OrgaosImagens\Esqueleto\mao.png',2)

insert into Orgao values(14,'Costela: são formadas por 12 pares, alongadas, em forma de semi-arcos e ligam as vértebras torácicas ao 
esterno e são classificadas em 7 Pares Verdadeiras que articulam se diretamente ao esterno, 3 Pares Falsas Propriamente Ditas que articulam-se 
indiretamente (cartilagens) e 2 Pares Falsas Flutuantes que são livres.

Esterno: É um osso chato, plano e ímpar, apresenta três partes: manúbrio, corpo processo e xifoide.

Para mais informações, acesse: https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/torax/esterno/
https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/torax/costelas/', 'Tórax', '\OrgaosImagens\Esqueleto\torax.png', 2)

insert into Orgao values(15,'
Vértebras Cervicais: possui um corpo pequeno, exceto a primeira vértebra.

Vértebras Torácicas: não é bifurcado e se apresenta descendente e pontiagudo. Elas se articulam com as costelas e a sua superfície articular
é chamada de fóvea e hemi-fóvea.
 
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

insert into Orgao values(17,'Fêmur –  é o mais longo osso do corpo que se articula com o ossos do quadril, com a patela e com a tíbia.

Patela – é um osso pequeno e triangular, também chamado de rótula localizado na articulação do joelho.

Tíbia –  depois do fêmur o osso que suporta mais o peso. Articula-se com o fêmur e com a fíbula.

Fíbula – localizada lateralmente a tíbia, serve para a fixação dos músculos e não possui função de sustentação de peso.

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






insert into Sistema values(3, 'Sistema Respiratório', 'O Sistema Respiratório fornece oxigênio e remove gás carbônico do organismo, auxilia as células no
metabolismo e atua em conjunto com o sistema circulatório. É formado pelo nariz, cavidade do nariz, faringe, laringe, traquéia, brônquios e pulmões.
Para mais informações, acesse: https://www.infoescola.com/biologia/sistema-respiratorio/')

insert into Orgao values(19,'O ar entra no sistema respiratório por meio das fossas nasais que são separadas por uma cartilagem chamada de septo. No 
interior do nariz são encontrados pelos que retém partículas que entram junto com o ar, o nariz é responsável por esquentar, filtrar e umedecer o
ar para os pulmões. 

Para mais informações, acesse: https://www.infoescola.com/biologia/sistema-respiratorio/ 
https://www.todamateria.com.br/sistema-respiratorio/', 'Nariz', '\OrgaosImagens\Respiratorio\nariz.png', 3)

insert into Orgao values(20,'A faringe é um órgão tubular que inicia-se nas coanas(abertura nasal posterior) com prolongação para baixo no pescoço com
a forma de um funil. Se comunica com o esôfago, fossas nasais e ouvidos mantendo-se ligada à laringe e ao esôfago. Ela é responsável pela circulação de 
ar e alimentos. Quando respriramos o ar entra nas fossas nasais e passa pela faringe encaminhando-se para traqueia e brônquios até chegar aos pulmões.

Para mais informações,acesse: https://www.infoescola.com/anatomia-humana/faringe/', 'Faringe','\OrgaosImagens\Respiratorio\faringe.png', 3)

insert into Orgao values(21,'A laringe é um tubo de formato irregular, sustentado por peças cartilaginosas irregulares articuladas que une a faringe 
à traqueia. Este órgão é formado por uma série de cartilagens. A sua entrada é chamada de glote. Acima dela existe uma estrutura chama epiglote que 
funciona como uma válvula que fecha quando o alimento entra, impedindoa entrada de alimento nas vias áreas.

Para mais informações, acesse: https://www.infoescola.com/sistema-respiratorio/laringe/', 'Laringe','\OrgaosImagens\Respiratorio\laringe.png', 3)

insert into Orgao values(22,'A traqueia é um tubo vertical cilíndrico, cartilaginoso e membranoso, localizado entre a laringe e os brônquios, fortalecido
por anéis de cartilagem, que levam o ar inspirado até os brônquios. Possui um revestimento interno que produzem um muco que umedece e aquece o ar que 
respiramos. Quando inalamos poeira, bactérias e partículas elas aderem-se ao muco e depois são conduzidas para a garganta pelos cílios e eliminadas pela tosse.

Para mais informações, acesse: https://www.infoescola.com/anatomia-humana/traqueia/', 'Traqueia','\OrgaosImagens\Respiratorio\traqueia.png', 3)

insert into Orgao values(23,'Os brônquios são estruturas tubulares que levam o ar aos pulmões. A traqueia ramifica-se em dois
brônquios: o direito e o esquerdo. Apesar das características anatômicas iguais às da traqueia, tem um diâmetro menor.

Para mais informações, acesse: https://www.infoescola.com/sistema-respiratorio/bronquios/', 'Brônquios','\OrgaosImagens\Respiratorio\bronquio.png', 3)

insert into Orgao values(24,' O pulmão é formado por milhões de alvéolos que se enchem de ar. O pulmão direitor é maior que o esquerdo e possui três lóbulos, enquanto o 
esquerdo possui dois, pois no pulmão esquerdo existe uma cavidade para o coração. A principal função dos pulmões é fornecer oxigênio para o sangue.

Para mais informações, acesse: https://www.infoescola.com/anatomia-humana/pulmoes/', 'Pulmões','\OrgaosImagens\Respiratorio\pulmao.png', 3)






insert into Sistema values(4, 'Sistema Circulatório', 'O Sistema Circulatório é divido em sistema cardiovascular e linfático. O sistema cardiovascular
é formado pelo coração e  vasos sanguíneos(veias, artérias e capilares). O coração bombeia o sangue e os vasos sanguíneos o transporta junto com  
elementos essenciais para o funcionamento dos tecidos, como gás oxigênio, gás carbônico, hormônios, excretas metabólicas e células de defesa. 
O sistema linfático protege o organismo de doenças.

Para mais informações, acesse: https://www.infoescola.com/biologia/sistema-circulatorio/')

insert into Orgao values(25, 'O coração é um orgão muscular localizado em uma região chamada mediastino na cavidade torácica. Ele é auto-excitável e contrátil.
Seus movimentos de contração (sístole) e distensão (diástole) são responsáveis por bombear o sangue pelo sistema circulatório. Nos humanos ele apresenta quatro 
cavidades: duas superiores, chamadas átrios, e duas inferiores, chamadas ventrículos. O trajeto percorrido pelo sangue entre o coração e os pulmões é chamada de 
pequena circulação e carrega o sangue venoso (sem oxigênio) para ser oxigenado. A grande circulação é o trajeto percorrido entre o coração e o corpo, leva o 
sangue que foi oxigenado pelos pulmões  para todas as células do corpo.

Para mais infomações, acesse: https://www.infoescola.com/anatomia-humana/coracao/ ', 'Coração', '\OrgaosImagens\Circulatorio\coracao.png', 4)

insert into Orgao values(26, 'Veias surgem da fusão dos capilares e são responsáveis por transportar o sangue do corpo até o coração. Sua capacidade de contrair e expandir 
permite que as veias armazenem pequenas ou grandes quantidades de sangue. Por sofrerem uma pressão menor do que a sofrida pelas artérias, as veias possuem as paredes mais delgadas.
Elas possuem válvulas que agem unidirecionalmente para evitar o contrafluxo causado pela gravidade.

Para mais informações, acesse: https://www.infoescola.com/sistema-circulatorio/veia/', 'Veias', '\OrgaosImagens\Circulatorio\veias.png', 4)

insert into Orgao values(27, ' As artérias são responsáveis por transportar o sangue do coração para o corpo. Existem diversas artérias no nosso copo, as principais são
as artérias Pulmonares que carregam o sangue venoso do coração para os pulmões e a artéria Aorta que carrega o sangue arterial(com oxigênio) do ventriculo esquerdo do
coração para o restante do corpo. Ela se divide em artérias menores que distribuem esse sangue para as células.
Para mais informações, acesse: https://www.infoescola.com/sistema-circulatorio/arteria/', 'Artérias', '\OrgaosImagens\Circulatorio\arteria.png', 4)






insert into Sistema values(5, 'Sistema Reprodutor Masculino', 'O Sistema Reprodutor Masculino é formado por órgãos internos e externos, que passam por um lento
amadurecimento concluindo-se na puberdade, ou seja, quando as células sexuais ficam disponíveis para originar outro ser. É constítuido pelos testículos, 
epidídimos, canais deferentes, vesículas seminais, próstata, uretra e pênis. 
Para informações, acesse: https://www.infoescola.com/biologia/aparelho-reprodutor-masculino/ http://www.anatomiadocorpo.com/sistema-reprodutor-genital/masculino/')

insert into Orgao values(28, 'O pênis é um órgão cilíndrico externo, que possui dois tipos de tecidos: cavernoso e esponjoso. Através do pênis são eliminados a 
urina (função excretora) e o sêmen (função reprodutora). O tecido esponjoso envolve a uretra e a protege, enquanto o tecido cavernoso se enche de sangue, fazendo 
com que o pênis fique maior e duro (ereção), pronto para o ato sexual, geralmente levando à ejaculação (processo de expulsão do sêmen). A ereção, no entanto, não 
ocorre apenas como preparação para uma atividade sexual, pode acontecer por diversos estímulos fisiológicos, por exemplo, quando a bexiga está cheia ou quando o homem 
tem um sonho à noite.
Para informações, acesse: http://www.anatomiadocorpo.com/penis/
https://www.infoescola.com/sistema-reprodutor/penis/', 'Pênis', '\OrgaosImagens\ReprMasc\penis.png', 5)

insert into Orgao values(29, 'Os testículos são duas glândulas de forma oval, que estão situadas na bolsa escrotal. Na estrutura de cada testículo encontram-se 
tubos finos e enovelados chamados "tubos seminíferos". Nos testículos são produzidos os espermatozoides, células reprodutoras (gametas) masculinas, 
durante a chamada espermatogênese e também de diversos hormônios. O principal hormônio é a testosterona, responsável pelo aparecimento das características 
sexuais secundárias masculinas, como os pelos, modificações da voz, etc.

Para informações, acesse: https://www.infoescola.com/sistema-reprodutor/testiculos/', 'Testículos', '\OrgaosImagens\ReprMasc\testiculos.png', 5)

insert into Orgao values(30, 'A uretra é um canal que, nos homens, serve ao sistema urinário e ao sistema reprodutor. Começa na bexiga, atravessa a 
próstata e o pênis (sua maior porção) até a ponta da glande, onde há uma abertura pela qual são eliminados o sêmen a a urina. Importante ressaltar
que urina e esperma nunca são eliminados ao mesmo tempo graças à musculatura da bexiga, na entrada da uretra, que impede que isso ocorra.

Para informações, acesse:  http://www.anatomiadocorpo.com/sistema-reprodutor-genital/uretra-masculina-e-feminina/
https://www.infoescola.com/anatomia-humana/uretra/', 'Uretra', '\OrgaosImagens\ReprMasc\uretra.png', 5)

insert into Orgao values(31, 'O canal deferente é um tubo fino e longo que sai de cada epidídimo. Passa pelas pregas ínguas (virilha) através dos 
canais inguinais, segue sua trajetória pela cavidade abdominal, circunda a base da bexiga, alarga-se formando uma ampola. Recebe o líquido seminal 
(proveniente da vesícula seminal), atravessa a próstata, que nele descarrega o líquido prostático, e vai desaguar na uretra. O conjunto dos espermatozoides, 
do líquido seminal e do líquido prostático, constitui o “esperma” ou “sêmen”.

Para informações, acesse: http://www.anatomiadocorpo.com/sistema-reprodutor-genital/masculino/
https://www.infoescola.com/biologia/aparelho-reprodutor-masculino/', 'Canal Deferente', '\OrgaosImagens\ReprMasc\deferente.png', 5)

insert into Orgao values(32, 'São duas pequenas glândulas (do tamanho de ervilhas) que se localizam abaixo da próstata. Secretam um muco claro e tem função lubrificante.
Para informações, acesse: https://www.infoescola.com/biologia/aparelho-reprodutor-masculino/', 'Glândulas Bulboretrais', '\OrgaosImagens\ReprMasc\bulboretrais.png', 5)

insert into Orgao values(33, 'A vesícula seminal é formada por duas pequenas bolsas localizadas atrás da bexiga. Tem como função produzir o "líquido seminal",
uma secreção espessa e leitosa, que neutraliza a ação da urina e protege os espermatozoides, além de ajudar seu movimento até a uretra. O líquido seminal 
também ajuda a neutralizar a acidez da vagina, evitando que os espermatozoides morram no caminho até os ovócitos.

Para informações, acesse:  http://www.anatomiadocorpo.com/sistema-reprodutor-genital/masculino/
https://www.infoescola.com/sistema-reprodutor/prostata/', 'Vesícula Seminal', '\OrgaosImagens\ReprMasc\seminal.png', 5)

insert into Orgao values(34, 'Os epidídimos são canais alongados,de aproximadamente 4 a 6 m de comprimento, que se enrolam e recobrem posteriormente a superfície de cada 
testículo. Corresponde ao local onde os espermatozoides, produzidos no testículo, são armazenados.
Para informações, acesse: https://www.infoescola.com/sistema-reprodutor/epididimo/
http://www.anatomiadocorpo.com/sistema-reprodutor-genital/masculino/epididimo-e-vias-espermaticas/', 'Epidídimo', '\OrgaosImagens\ReprMasc\epididimo.png', 5)





insert into Sistema values(6, 'Sistema Reprodutor Feminino', 'O Sistema Reprodutor feminino é responsável pela reprodução humana é formado pelos ovários que produzem 
os ovócitos(gametas femininos), as tubas uterinas, que transportam os óvulos até o útero e o protegem, o útero, onde o embrião se desenvolve, a vagina e a vulva. 
Para mais informações, acesse: https://www.todamateria.com.br/sistema-reprodutor-feminino/  
https://www.infoescola.com/biologia/aparelho-reprodutor-feminino/')

insert into Orgao values(35, 'A vagina é um órgão que se comunica com o útero. Possui paredes franjadas e glândulas secretras de muco. A região externa 
da vulva é chamada de vestíbulo da vagina, onde encontramos dois orifícos: o urinários (da uretra) e o genital (da vagina).A região entre a vagina e a vulva,
em mulheres que nunca tiveram uma relação sexual origina o hímen.

Para mais informações, acesse: https://www.infoescola.com/sistema-reprodutor/vagina/ ', 'Vagina', '\OrgaosImagens\ReprFem\vagina.png', 6)

insert into Orgao values(36, 'O útero é musculoso, oco e de grande elasticidade. Está ligado com as tubas uterina e com a vagina. É formado por 5 regiões: 
corpo, istmo, colo, óstio e fundo. Sua função é receber e implantar embriões, responsável pela expulsão do feto no momento do parto. Tem  uma parede espessa 
composta por três camadas: a serosa, o miométrio, parede mais espessa do útero e o endométrio, que é a camada de células que reveste a cavidade uterina. Todo mês ele se torna mais 
espesso para receber o ovócito fertilizado. Caso não ocorra a fertilização, o endométrio que se desenvolveu é eliminado através da menstruação.
Para mais informações, acesse: https://www.infoescola.com/sistema-reprodutor/utero/', 'Útero', '\OrgaosImagens\ReprFem\utero.png', 6)

insert into Orgao values(37, 'Os Ovários produzem os ovócitos e os hormônios sexuais estrógeno e progesterona através da ovocitogênese e a esteroidogênese. 
Durante a fase fértil da mulher um dos ovários lança  um ovócito na tuba uterina(ovulação). No início da vida ele é pequeno, mas vai aumentando de tamanho até a fase adulta. 

Para mais informações, acesse: https://brasilescola.uol.com.br/biologia/ovarios.htm', 'Ovário', '\OrgaosImagens\ReprFem\ovario.png', 6)

insert into Orgao values(38, 'As tubas uterinas são denominadas ovidutos, são tubos musculares e são responsáveis por transportar o ovócito em direção ao útero. 
Elas são dividas em 4 partes: infudíbulo, que se  abre em uma cavidade chamada óstio abdominal, ampola,região onde ela sofre uma curvatura para encontrar o ovário, o istmo, 
porção medial que se abre, e o intramural, que abre-se na cavidade peritoneal próximo ao ovário e possui prolongamentos no formato de franjas.
Para mais informações, acesse: https://www.infoescola.com/sistema-reprodutor/tubas-uterinas/', 'Tubas Uterinas', '\OrgaosImagens\ReprFem\tuba.png', 6)

insert into Sistema values(7, 'Sistema Muscular','O sistema muscular é composto  por aproximadamente 600 músculos, tecidos, cujas células ou fibras musculares
possuem a propriedade de contratilidade e de produção de movimentos. Tem como funções: estabilidade corporal, produção de movimentos, manutenção da temperatura 
corporal, sustentação, auxílio nos fluxos sanguíneos. Existem 3 tipos de músculos: 

Musculo Liso ou não estriado: músculos de contração involuntária, assegura a movimentação dos órgãos internos.

Músculo Estriado Cardíaco: músculos de contração involuntária, asseguram os vigorosos batimentos cardíacos.

Músculo Estriado Esquelético: músculos de contração voluntária, conectados com os ossos e cartilagens e, através das contrações, permitem os movimentos, 
as posições corporais, além de estabilizarem as articulações do organismo.

Para mais informações, acesse: http://www.anatomiadocorpo.com/sistema-muscular/
https://www.infoescola.com/anatomia-humana/sistema-muscular/')

insert into Orgao values(39, 'Os músculos da cabeça se dividem em mastigadores e os da mímica.
Músculos mastigadores — músculos elevadores e os abaixadores do maxilar. Os elevadores são o temporal, o masseter, o pterigóideo interno e o pterigóideo externo. 
Já o músculo abaixador do maxilar é o digástrico.

Músculos da mímica – São também chamados músculos cuticulares, por se acharem intimamente relacionados com a pele. Quase todos se dispõem em torno dos orifícios palpebrais, 
das narinas e da boca, concorrendo para as expressões fisionômicas. Sendo alguns deles: o frontal, os orbiculares dos olhos, o superciliar, os orbiculares dos lábios, o 
buzinador, entre outros.

Músculos do Pescoço: Os mais importantes são ocuticular, esterno-cleidomastdideo, escaleno e o digástrico.

Para mais informações, acesse:http://www.anatomiadocorpo.com/sistema-muscular/musculos-da-cabeca-pescoco/
https://www.infoescola.com/anatomia-humana/sistema-muscular/', 'Cabeça e pescoço', '\OrgaosImagens\Muscular\rosto.png', 7)

insert into Orgao values(40, '- Trapézio, superficialmente situado, triangular, estendendo-se desde o occipital até a parte inferior da coluna dorsal, atrai para a direção da linha mediana a espádua, ao mesmo tempo que a eleva.

- Grande dorsal, na parte posterior e inferior do tronco, largo e delgado, de forma triangular, leva o braço, ao contrair-se, para trás, para baixo e para dentro.

Para mais informações, acesse: http://www.anatomiadocorpo.com/sistema-muscular/musculos-tronco-trapezio-coluna-dorso/
http://www.anatomiadocorpo.com/sistema-muscular/musculos-do-ombro/
https://www.infoescola.com/anatomia-humana/sistema-muscular/', 'Região Posterior do Corpo', '\OrgaosImagens\Muscular\costas.png', 7)

insert into Orgao values(41, 'Com estes músculos é possível a respiração, além de impedir o corpo de se curvar e ceder ao próprio peso, entre outros movimentos.
Os músculos que se destacam são: 
- Grande peitoral, na região ântero-lateral, situado superficialmente, é triangular, e, pela função, adutor do braço

_ Pequeno peitoral, por baixo do precedente, também triangular, faz descer, quando se contrai, a articulação da espádua

- Grande denteado, largo, aplicado sobre á parede lateral do tórax, ora atua como inspirador, ora solicita para diante a articulação da espádua
 
Os músculos do abdômen (músculos abdominais) revestem as paredes laterais, anterior e posterior do abdome, funcionando como uma espécie de cinta que contém as vísceras. Alguns exemplos são: o 
grande reto do abdômen, o médio reto do abdômen, o pequeno reto do abdômen, o transverso do abdômen, o músculo quadrado lombar e o diafragma.

Para mais informações, acesse: http://www.anatomiadocorpo.com/sistema-muscular/musculos-tronco-trapezio-coluna-dorso/ http://www.anatomiadocorpo.com/sistema-muscular/musculos-do-ombro/
http://www.anatomiadocorpo.com/sistema-muscular/musculos-torax-peito/ https://www.infoescola.com/anatomia-humana/sistema-muscular/', 'Tórax e Abdomem', '\OrgaosImagens\Muscular\peito.png', 7)

insert into Orgao values(42, 'São músculos capazes de fazer a pressão exata e permitem flexibilidade e precisão para tarefas delicadas ou que exigem muita força. Exemplos:

- Bíceps, longo e fusiforme, situado na parte anterior do braço, em que faz, ao contrair-se, é flexor do antebraço sobre o braço

- Tríceps braquial, músculo longo situado na parte posterior do braço, é extensor do antebraço.

Para mais informações, acesse: http://www.anatomiadocorpo.com/sistema-muscular/musculos-do-braco-antebraco-e-mao/
https://www.infoescola.com/anatomia-humana/sistema-muscular/', 'Membros superiores', '\OrgaosImagens\Muscular\superior.png', 7)

insert into Orgao values(43, 'Esses são os músculos mais fortes do corpo, graças aos músculos das pernas podemos ficar de pé e manter o equilíbrio. Exemplos:
- Costureiro (ou sartório), é músculo mais longo do corpo, ao se contrair dobra a perna e gira o quadril, é o músculo das costureiras, por isso o nome.

- Os flexores dorsais do pé fazem os dedos levantarem. 

- Flexores plantares (sóleo, plantar delgado e gastrocnêmio) ligado ao tendão de Aquilesé responsável pelo movimento de ficar na ponta dos pés.

- os três glúteos (grande, pequeno e médio) responsáveis por firmar a bacia sobre o fêmur.

- Gêmeos da perna, em número de dois, o externo e o interno, formam a região da panturrilha, ou barriga da perna, e terminam em baixo no tendão de Aquiles

Para mais informações, acesse: http://www.anatomiadocorpo.com/sistema-muscular/musculos-da-coxa-perna-e-pe/
https://www.infoescola.com/anatomia-humana/sistema-muscular/', 'Membros inferiores', '\OrgaosImagens\Muscular\inferiores.png', 7)


insert into Sistema values(8, 'Sistema Nervoso','O sistema nervoso é responsável pelo controle de um organismo, regulando as atividades corporais tanto voluntárias quanto involuntárias.
O sistema nervoso é divido em Sistema Nervoso Central (SNC) e Sistema Nervoso  Periférico (SNP).O SNC é composto pela medula espinhal, cérebro, bulbo, cerebelo
e ponte. Já o SNP pode ser divido em voluntário e autonômo. Para mais informações, acesse: https://www.infoescola.com/biologia/sistema-nervoso/')

insert into Orgao values(44, 'A função do bulbo está relacionada com a respiração e tem contato direto com a medula espinhal. Também está relacionado com os reflexos 
cardiovasculares, transmissão de informações sensoriais e motoras, controle da deglutição, tosse e vômito.

Para mais informações, acesse: https://www.sobiologia.com.br/conteudos/FisiologiaAnimal/nervoso8.php', 'Bulbo', '\OrgaosImagens\Nervoso\bulbo.png', 8)

insert into Orgao values(45, 'O cerebelo é responsável pelas atividades dos músculos esqueléticos, pelo tato, visão e audição. Está relacionado com o 
equilíbrio e postura conecta o córtex cerebral e o tronco encefálico. A superfície é composta por fissuras transversas e curvas, com aspecto laminado. 
Pesquisas demonstraram que o cerebelo pode ter funções em atividades como mémoria, emoções, atenção e controle de atos impulsivos.

Para mais informações, acesse: https://www.infoescola.com/anatomia-humana/cerebelo/', 'Cerebelo', '\OrgaosImagens\Nervoso\cerebelo.png', 8)

insert into Orgao values(46, 'O cérebro é a parte mais desenvolvida do encéfalo, está relacionado com a maioria das funções do organismo.  Ele está dividido em aréas 
chamadas de lobos com funções diferentes e especializadas. Sua massa de tecido cinza-résea apresenta duas substâncias, uma branca e uma cinzenta. O cérebro é divido em 
hemisfério esquerdo e direito, o primeiro é responsável pelo pensamento lógico e competência comunicativa. Já o hemisfério direito é quem cuida do pensamento simbólico e
 da criatividade. Nos canhotos essas funções são trocadas.

Para mais informações, acesse: https://www.infoescola.com/anatomia-humana/cerebro/', 'Cérebro', '\OrgaosImagens\Nervoso\cerebro.png', 8)

insert into Orgao values(47, 'A medula espinhal é a porção alongada so SNC, se inicia abaixo do bulbo. É subordinada ao cérebro, mas pode agir independente dele.
Pode ser divida em 6 partes: cervical superior, dilatação cervical, cone terminal, lombar, dorsal e filamento terminal. As suas funções incluem conduzir impulsos nervosos,
produzir movimentos musculares e coordenar os reflexos.

Para mais informações, acesse: https://www.infoescola.com/anatomia-humana/medula-espinhal/', 'Medula', '\OrgaosImagens\Nervoso\medula.png', 8)

insert into Orgao values(48, 'Os neurônios são a unidade funcional do sistema nervoso e juntamente com as células neuróglias formam o tecido nervoso. Se comunicam através 
de sinapses e por eles se propagam os impulsos nervosos. Eles são formados por um dendrito, corpo celular e axônio. Podem ser classificados em motores, que transmitem o sinal 
vindo do SNC até os órgãos efetores, sensoriais que recebem os estímulos do meio-ambiente e interneurônios que constituem extensas redes de neurônios. 

Para mais informações, acesse: https://www.infoescola.com/sistema-nervoso/neuronios/', 'Neurônios', '\OrgaosImagens\Nervoso\neuronio.png', 8)

insert into Orgao values(49, 'A ponte é responsável pela postura corporal, por transmitir informações da medula e do bulbo até o cortéx 
cerebral e pelo equilíbrio do corpo.
Para mais informações, acesse: http://neuralsystem.blogspot.com/2008/11/ponte.html', 'Ponte', '\OrgaosImagens\Nervoso\ponte.png', 8)


insert into Sistema values(9, 'Sistema Urinário','O sistema urinário é responsável pela produção e eliminação de urina composta de aproximadamente 95% de água. 
Os principais excretas da urina humana são: a ureia, o cloreto de sódio e o ácido úrico., que filtram as  impurezas do sangue que circula no organismo. É composto pelos rins, 
ureteres, bexiga urinária e a uretra.
Para mais informações acesse: https://www.todamateria.com.br/sistema-urinario/')

insert into Orgao values(50, 'A principal função dos rins é filtrar dejetos presentes no sangue e excretá-los junto com a água. Existe um rim em cada lado da coluna, 
o direito localizado abaixo do fígado e o esquerdo abaixo do baço. Acima de cada um encontra-se a glândula supra-renal. Cada rim é formado por 1 a 4 milhões de néfrons, 
capazes de realizar todas as funções renais.

Para mais informações, acesse: https://www.infoescola.com/sistema-urinario/rim/', 'Rins', 'OrgaosImagens\Urinario\rins.png', 9)

insert into Orgao values(51, 'Os Ureteres são dois tubos que conduzem a urina dos rins para a bexiga. Eles são envolvidos por algumas camadas 
musculares, dessa maneira, facilita-se a prevenção contra o refluxo da urina.

Para mais informações, acesse: https://www.grupoescolar.com/pesquisa/ureter--corpo-humano.html', 'Ureteres', 'OrgaosImagens\Urinario\ureteres.png', 9)

insert into Orgao values(52, 'A bexiga urinária é um órgão oco, muscular e elástico, localizado na cavidade pélvica. Ela é responsável por armazenar a urina produzida pelos
rins até o momento da micção. Possui a capacidade de armazenar entre 650 a 800 ml de urina. Porém quando o volume chega a aproximadamente 300ml, os sensores nervosos
enviam mensagens para o sistema nervoso, fazendo com que a pessoa sinta vontade de urinar.

Para mais informações, acesse: https://www.todabiologia.com/anatomia/bexiga_urinaria.htm', 'Bexiga Urinária', 'OrgaosImagens\Urinario\bexiga.png', 9)

insert into Orgao values(53, 'A uretra é um tubo muscular que leva a urina da bexiga para o exterior. No sexo masculino ela dá passagem para o esperma durante a ejaculação e 
é formado pela porção prostática, uretra membrosa e a uretra esponjosa, já no sexo feminino é um órgao exclusivamente do aparelho urinário e é revestida pelo epitélio plano
estratificado. Para mais informações, acesse: https://www.infoescola.com/anatomia-humana/uretra/', 'Uretra', 'OrgaosImagens\Urinario\uretra.png', 9)


