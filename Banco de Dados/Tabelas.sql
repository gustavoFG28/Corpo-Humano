-- Cria��o das tabelas

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


-- Inser��o de Valores

insert into Sistema values(1, 'Sistema Digest�rio', 'O Sistema Digest�rio � formado por um conjunto de �rg�os cuja fun��o � transformar os alimentos,
por meio de processos mec�nicos e qu�micos. � const�tuido pela boca, faringe, es�fago, est�mago, intestino delgado e intestino grosso. Al�m de �rg�os
anexos como as gl�ndulas salivares, p�ncreas, f�gado, ves�cula biliar, dentes e l�ngua. 
Para mais informa��es, acesse: https://www.infoescola.com/anatomia-humana/sistema-digestorio/
http://www.anatomiadocorpo.com/sistema-digestorio-aparelho-digestivo/')

insert into Orgao values(1,'A boca, cavidade oval, � a porta de entrada dos alimentos, que s�o mastigados atrav�s da digest�o mec�nica. Nela, acontece
o �nicio da digest�o qu�mica dos carboidratos, onde o amido � decomposto em mol�culas de glicose e maltose, atrav�s da saliva. Anexos envolvidos:

Gl�ndulas salivares: Produzem a saliva, que � const�tuida de �gua, mucina e amilase.

L�ngua: Sua mobilidade e sensibilidade aos sabores a torna um auxiliar preciso da mastiga��o.

Dentes: �rg�os esbranqui�ados, duros, de consist�cia p�trea, implantados nos alv�olos dos maxilares.

Para mais informa��es acesse:  http://www.anatomiadocorpo.com/sistema-digestorio-aparelho-digestivo/boca/
http://www.anatomiadocorpo.com/sistema-digestorio-aparelho-digestivo/boca/saliva-mastigacao-degluticao-ptialina-mucina-lisozima/', 'Boca', '\OrgaosImagens\Digestorio\boca.png', 1)

insert into Orgao values(2,'�rg�o tubular, com tamanho variado entre 12 � 15cm. � uma estrutura de grande resist�ncia, pois suporta correntes de ar 
cuja velocidade varia entre IS(respira��o normal) e 300km/h(tosse e espirro) sem lhe causar dano algum. Sua fun��o � circul��o de bolos alimentares 
e ar, pois ela comunica-se com a laringe e com o es�fago.

Para mais informa��es, acesse: https://www.infoescola.com/anatomia-humana/faringe/
http://www.anatomiadocorpo.com/sistema-digestorio-aparelho-digestivo/faringe/', 'Faringe', '\OrgaosImagens\Digestorio\faringe.png', 1)


insert into Orgao values(3,'O es�fago � um conduto musculoso que liga a faringe ao est�mago, controlado pelo SNC(Sistema Nervoso Central). Assim, por 
meio de ondas de  contra��es involunt�rias, conhecidas como movimentos perist�lticos, o conduto musculoso vai espremendo os alimentos levando-os em 
dire��o ao est�mago. 

Para mais informa��es, acesse: http://www.anatomiadocorpo.com/sistema-digestorio-aparelho-digestivo/esofago/
https://www.infoescola.com/sistema-digestivo/esofago/', 'Es�fago', '\OrgaosImagens\Digestorio\esofago.png' , 1)

insert into Orgao values(4,'O est�mago � um �rg�o do tubo digestivo que tem fun��es end�crinas e ex�crinas. Suas principais fun��es s�o adicionar um 
flu�do �cido atrav�s da atividade muscular e da enzima pepsina ao alimento ingerido, tranformando-o no chamado quimo  e  iniciar a digest�o das prote�nas.
Produz tamb�m uma lipase g�strica, que com o aux�lio da lipase lingual, digere os triglicer�deos. 

Para mais informa��es, acesse: http://www.anatomiadocorpo.com/sistema-digestorio-aparelho-digestivo/estomago/
https://www.infoescola.com/sistema-digestivo/estomago/', 'Est�mago','\OrgaosImagens\Digestorio\estomago.png', 1)

insert into Orgao values(5,'O intestino delgado � revestido por uma mucosa enrugada que apresenta in�meras proje��es. Tem a fun��o de segregar as v�rias
enzimas digestivas, dando origem a m�leculas pequenas e sol�veis como glicose, amino�cidos e glicerol. O intestino delgado est� dividido em tr�s por��es: 
o duodeno, o jejuno e o �leo. O duodeno diminui a acidez do quimo por meio do suco pancre�tico que cont�m enzimas que o neutralizam. Logo, o quimo � banhado
la bile, armazenada na ves�cula biliar, emulsificando os lip�dios. O jejuno e �leo, levam a �pasta� at� o intestino grosso.

Anexos envolvidos:
P�ncreas: O p�ncreas tem fun��es end�crinas e ex�crinas.A por��o ex�crina do p�ncreas participa na digest�o secretando enzimas digestivas para o duodeno, 
atrav�s de estruturas chamas �cinos. 

F�gado:
O f�gado � a maior gl�ndula do corpo humano e pode executar mais de 500 fun��es, como: armazenamento e libera��o de glicose, metabolismo de lip�deos e 
prote�nas (convers�o de am�nia em ur�ia), processamento de drogas e horm�nios, etc.

Para mais informa��es, acesse: https://www.infoescola.com/anatomia-humana/intestino-delgado/ http://www.anatomiadocorpo.com/sistema-digestorio-aparelho-digestivo/intestino/
https://www.infoescola.com/anatomia-humana/pancreas/  http://www.anatomiadocorpo.com/sistema-endocrino/pancreas/
http://www.anatomiadocorpo.com/sistema-digestorio-aparelho-digestivo/figado/ https://www.infoescola.com/anatomia-humana/figado/', 'Intestino Delgado','\OrgaosImagens\Digestorio\intestinoDelgado.png', 1)

insert into Orgao values(6, 'O intestino grosso � respons�vel por armazenar e eliminar os res�duos da digest�o e por absorver os nutrientes que o intestino 
delgado n�o assimilou assim como a �gua. � dividido em ceco, onde os res�duos alimentares, j� constituindo o bolo fecal, passam ao c�lon e reto. Quando o 
alimento chega ao c�lon descendente, o bolo fecal permanece estagnado por muitas horas. Gl�ndulas da mucosa do intestino grosso, secretam muco,
que lubrifica o bolo fecal, facilitando seu tr�nsito e sua elimina��o. O reto � a parte final do intestino grosso, e termina com o canal anal que se
comunica com o exterior atrav�s do �nus, por onde s�o eliminados os res�duos fecais.
Para mais informa��es, acesse: https://www.infoescola.com/sistema-digestivo/intestino-grosso/
http://www.anatomiadocorpo.com/sistema-digestorio-aparelho-digestivo/intestino/', 'Intestino Grosso', '\OrgaosImagens\Digestorio\intestinoGrosso.png', 1)






insert into Sistema values(2, 'Sistema Esquel�tico', 'O sistema esquel�tico � formado por 206 ossos al�m de cartilagens, ligamentos e tend�es � respons�vel por
sustentar, proteger nossos �rg�os e dar forma ao corpo. Atua em conjunto com o sistema articular e muscular para permitir o movimento. Outras fun��es s�o a 
produ��o de c�lulas sangu�neas na medula �ssea e armazenamento de sais minerais. O osso � uma estrutura viva, muito resistente e din�mica. 
Para mais informa��es, acesse: https://www.todamateria.com.br/sistema-esqueletico/')

insert into Orgao values(7,'A face � constitu�da por quatorze ossos: um �nico m�vel que � o maxilar inferior e treze fixos, que em  conjunto, formam o maxilar superior.
Dos trezes ossos fixos da face 12 formam seis pares, e um, o v�mer, � �mpar. Os pares restantes s�o: os maxilares superiores, os malares, os nasais, os �nguis, os ossos 
palatinos e os cartuchos inferiores.

Para mais informa��es, acesse: https://www.anatomiaonline.com/face/
http://www.anatomiadocorpo.com/esqueleto-humano-sistema-esqueletico-ossos/', 'Ossos da Face','\OrgaosImagens\Esqueleto\face.png' ,2)

insert into Orgao values(8,'O cr�nio � uma estrutura r�gida, cartilagionasa e �ssea. Ele protege e armazena o enc�falo. O cr�nio humano � composto de oito
ossos: Parietal (dois), Temporal (dois), Frontal, Occipital, Esfen�ide, Etm�ide
Para mais informa��es acesse: https://www.todabiologia.com/dicionario/cranio.htm 
http://www.anatomiadocorpo.com/esqueleto-humano-sistema-esqueletico-ossos/' , 'Cr�nio','\OrgaosImagens\Esqueleto\cranio.png', 2)


insert into Orgao values(9,
'Bigorna: Localizada no ouvido m�dio, tem formato de bigorna e um corpo que se articula com o martelo.

Martelo: Presente no ouvido m�dio � formado por uma longa proje��o, o man�brio que est� inserido na membrana timp�nica.

Estribo: Forma a cadeia auditiva e � o menor ossso do corpo humano. Articula-se com a bigorna.

Para mais informa��es, acesse: 
http://www.biologia.seed.pr.gov.br/modules/galeria/detalhe.php?foto=298&evento=3
http://www.biologia.seed.pr.gov.br/modules/galeria/detalhe.php?foto=452&evento=3
http://www.biologia.seed.pr.gov.br/modules/galeria/detalhe.php?foto=563&evento=3
https://www.hear-it.org/pt/O-ouvido-medio', 'Oss�culos do Ouvido','\OrgaosImagens\Esqueleto\ouvido.png',2)

insert into Orgao values(10, 'O osso hi�ide � um osso com forma de U superior � laringe, os dois bra�os projetam-se posteriormente a partir das extremidades 
laterais do corpo. O osso hi�ide � altamente m�vel para muitos m�sculos e estruturas de partes moles na cabe�a e pesco�o, por�m n�o se articula com outro 
elemento esquel�tico nem na cabe�a e nem no pesco�o.

Para mais informa��es, acesse: https://www.portaleducacao.com.br/conteudo/artigos/fonoaudiologia/osso-hioide/37126', 'Hi�ide', '\OrgaosImagens\Esqueleto\pescoco.png',2)

insert into Orgao values(11, 'Clav�cula: forma a por��o ventral do ombro, � um osso curvado como um "S" it�lico, situado acima da primeira costela.
Articula-se com o man�brio do esterno e com o acr�mio da esc�pula.

Esc�pula: � um osso chato bem fino, com uma forma triangular podendo ser transl�cido em certos pontos. Forma a parte dorsal da cintura escapular.

Para mais informa��es, acesse: https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/membro-superior/escapula/ 
https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/membro-superior/clavicula/', 'Cintura escapular', '\OrgaosImagens\Esqueleto\escapula.png',2)

insert into Orgao values(12,'�mero - � o maior e mais longo osso superior e se articula com a esc�pula, com o radio e com a ulna.

Ulna - � um osso longo localizado no meio do antebra�o. Articula-se com o �mero e com o r�dio.

R�dio - � um osso curto localizado na lateral do antebra�o. Articula-se com o �mero, com a ulna e com os ossos do carpo.

Para mais informa��es, acesse: https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/membro-superior/umero/
https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/membro-superior/ulna/
https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/membro-superior/radio/
 ', 'Membros Superiores', '\OrgaosImagens\Esqueleto\braco.png', 2)

insert into Orgao values(13, 'A m�o tem no total 27 ossos trabalhando em conjunto. Junto com os m�sculos e articula��es permitem o manuseio 
de objetos. Ela � divida em 3 regi�es diferentes: 

O carpo - composto pelos ossos: escafoide, semilunar, piramidal , pisiforme, trap�zio, trapezoide, capitato e hamato.

O metacarpo  - composta por 5 ossos metacarpianos.

A falange - composta por 18 ossos.

Para mais informa��es, acesse: https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/membro-superior/ossos-da-mao/
https://www.todamateria.com.br/ossos-da-mao/
http://www.anatomiadocorpo.com/esqueleto-humano-sistema-esqueletico-ossos/mao-carpo-metacarpo-falanges/', 'Ossos da M�o', '\OrgaosImagens\Esqueleto\mao.png',2)

insert into Orgao values(14,'Costela: s�o formadas por 12 pares, alongadas, em forma de semi-arcos e ligam as v�rtebras tor�cicas ao 
esterno e s�o classificadas em 7 Pares Verdadeiras que articulam se diretamente ao esterno, 3 Pares Falsas Propriamente Ditas que articulam-se 
indiretamente (cartilagens) e 2 Pares Falsas Flutuantes que s�o livres.

Esterno: � um osso chato, plano e �mpar, apresenta tr�s partes: man�brio, corpo processo e xifoide.

Para mais informa��es, acesse: https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/torax/esterno/
https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/torax/costelas/', 'T�rax', '\OrgaosImagens\Esqueleto\torax.png', 2)

insert into Orgao values(15,'
V�rtebras Cervicais: possui um corpo pequeno, exceto a primeira v�rtebra.

V�rtebras Tor�cicas: n�o � bifurcado e se apresenta descendente e pontiagudo. Elas se articulam com as costelas e a sua superf�cie articular
� chamada de f�vea e hemi-f�vea.
 
V�rtebras Lombares: s�o maiores. O processo espinhal n�o � bifurcado, al�m de estar disposto em posi��o horizontal. 

Para mais informa��es, acesse: https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/coluna-vertebral/caracteristicas-regionais/', 'Coluna Vertebral','\OrgaosImagens\Esqueleto\coluna.png', 2)

insert into Orgao values(16,'�liaco �  o membro inferior � respons�vel por sustentar o peso do corpo e pela capacidade de manter o equil�brio. 
O Il�aco � um osso plano, chato, irregular, par e constitu�do pela fus�o de tr�s ossos: �lio, �squio e o p�bis.

Sacro � conecta o tronco aos membros inferiores . Tem a forma de uma pir�mide quadrangular com a base voltada para cima e o �pice para baixo. Articula-se com a 
5� V�rtebra Lombar e com o C�ccix.

C�ccix - Fus�o de 3 a 5 v�rtebras, apresenta a base voltada para cima e o �pice para baixo.

Para mais informa��es, acesse:    
https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/coluna-vertebral/sacro/
https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/coluna-vertebral/coccix/
https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/membro-inferior/iliaco/', 'Ossos da Cintura P�lvica', '\OrgaosImagens\Esqueleto\pelvica.png', 2)

insert into Orgao values(17,'F�mur �  � o mais longo osso do corpo que se articula com o ossos do quadril, com a patela e com a t�bia.

Patela � � um osso pequeno e triangular, tamb�m chamado de r�tula localizado na articula��o do joelho.

T�bia �  depois do f�mur o osso que suporta mais o peso. Articula-se com o f�mur e com a f�bula.

F�bula � localizada lateralmente a t�bia, serve para a fixa��o dos m�sculos e n�o possui fun��o de sustenta��o de peso.

Para mais informa��es, acesse: https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/membro-inferior/femur/
https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/membro-inferior/patela/
https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/membro-inferior/tibia/
https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/membro-inferior/fibula/', 'Ossos da Perna','\OrgaosImagens\Esqueleto\perna.png', 2)

insert into Orgao values(18,'O p� � dividido em 3 partes: 
Tarso � s�o 7 ossos dispostos em duas filas. Uma � formada pelo calc�neo e o astr�galo, que formam o calcanhar. A outra fila �  formada pelo osso 
cuboide e o osso escafoide e por tr�s ossos chamados cuneiformes.

Metatarso �  5 ossos metatarsianos numerados no sentido lateral I, II, III, IV e V.

Dedos � s�o formados pela falange, falanginha e falangeta.

Para mais informa��es, acesse: https://planetabiologia.com/sistema-esqueletico-ossos-do-pe/
https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/membro-inferior/ossos-do-pe/', 'Ossos do P�','\OrgaosImagens\Esqueleto\pe.png', 2)






insert into Sistema values(3, 'Sistema Respirat�rio', 'O Sistema Respirat�rio fornece oxig�nio e remove g�s carb�nico do organismo, auxilia as c�lulas no
metabolismo e atua em conjunto com o sistema circulat�rio. � formado pelo nariz, cavidade do nariz, faringe, laringe, traqu�ia, br�nquios e pulm�es.
Para mais informa��es, acesse: https://www.infoescola.com/biologia/sistema-respiratorio/')

insert into Orgao values(19,'O ar entra no sistema respirat�rio por meio das fossas nasais que s�o separadas por uma cartilagem chamada de septo. No 
interior do nariz s�o encontrados pelos que ret�m part�culas que entram junto com o ar, o nariz � respons�vel por esquentar, filtrar e umedecer o
ar para os pulm�es. 

Para mais informa��es, acesse: https://www.infoescola.com/biologia/sistema-respiratorio/ 
https://www.todamateria.com.br/sistema-respiratorio/', 'Nariz', '\OrgaosImagens\Respiratorio\nariz.png', 3)

insert into Orgao values(20,'A faringe � um �rg�o tubular que inicia-se nas coanas(abertura nasal posterior) com prolonga��o para baixo no pesco�o com
a forma de um funil. Se comunica com o es�fago, fossas nasais e ouvidos mantendo-se ligada � laringe e ao es�fago. Ela � respons�vel pela circula��o de 
ar e alimentos. Quando respriramos o ar entra nas fossas nasais e passa pela faringe encaminhando-se para traqueia e br�nquios at� chegar aos pulm�es.

Para mais informa��es,acesse: https://www.infoescola.com/anatomia-humana/faringe/', 'Faringe','\OrgaosImagens\Respiratorio\faringe.png', 3)

insert into Orgao values(21,'A laringe � um tubo de formato irregular, sustentado por pe�as cartilaginosas irregulares articuladas que une a faringe 
� traqueia. Este �rg�o � formado por uma s�rie de cartilagens. A sua entrada � chamada de glote. Acima dela existe uma estrutura chama epiglote que 
funciona como uma v�lvula que fecha quando o alimento entra, impedindoa entrada de alimento nas vias �reas.

Para mais informa��es, acesse: https://www.infoescola.com/sistema-respiratorio/laringe/', 'Laringe','\OrgaosImagens\Respiratorio\laringe.png', 3)

insert into Orgao values(22,'A traqueia � um tubo vertical cil�ndrico, cartilaginoso e membranoso, localizado entre a laringe e os br�nquios, fortalecido
por an�is de cartilagem, que levam o ar inspirado at� os br�nquios. Possui um revestimento interno que produzem um muco que umedece e aquece o ar que 
respiramos. Quando inalamos poeira, bact�rias e part�culas elas aderem-se ao muco e depois s�o conduzidas para a garganta pelos c�lios e eliminadas pela tosse.

Para mais informa��es, acesse: https://www.infoescola.com/anatomia-humana/traqueia/', 'Traqueia','\OrgaosImagens\Respiratorio\traqueia.png', 3)

insert into Orgao values(23,'Os br�nquios s�o estruturas tubulares que levam o ar aos pulm�es. A traqueia ramifica-se em dois
br�nquios: o direito e o esquerdo. Apesar das caracter�sticas anat�micas iguais �s da traqueia, tem um di�metro menor.

Para mais informa��es, acesse: https://www.infoescola.com/sistema-respiratorio/bronquios/', 'Br�nquios','\OrgaosImagens\Respiratorio\bronquio.png', 3)

insert into Orgao values(24,' O pulm�o � formado por milh�es de alv�olos que se enchem de ar. O pulm�o direitor � maior que o esquerdo e possui tr�s l�bulos, enquanto o 
esquerdo possui dois, pois no pulm�o esquerdo existe uma cavidade para o cora��o. A principal fun��o dos pulm�es � fornecer oxig�nio para o sangue.

Para mais informa��es, acesse: https://www.infoescola.com/anatomia-humana/pulmoes/', 'Pulm�es','\OrgaosImagens\Respiratorio\pulmao.png', 3)






insert into Sistema values(4, 'Sistema Circulat�rio', 'O Sistema Circulat�rio � divido em sistema cardiovascular e linf�tico. O sistema cardiovascular
� formado pelo cora��o e  vasos sangu�neos(veias, art�rias e capilares). O cora��o bombeia o sangue e os vasos sangu�neos o transporta junto com  
elementos essenciais para o funcionamento dos tecidos, como g�s oxig�nio, g�s carb�nico, horm�nios, excretas metab�licas e c�lulas de defesa. 
O sistema linf�tico protege o organismo de doen�as.

Para mais informa��es, acesse: https://www.infoescola.com/biologia/sistema-circulatorio/')

insert into Orgao values(25, 'O cora��o � um org�o muscular localizado em uma regi�o chamada mediastino na cavidade tor�cica. Ele � auto-excit�vel e contr�til.
Seus movimentos de contra��o (s�stole) e distens�o (di�stole) s�o respons�veis por bombear o sangue pelo sistema circulat�rio. Nos humanos ele apresenta quatro 
cavidades: duas superiores, chamadas �trios, e duas inferiores, chamadas ventr�culos. O trajeto percorrido pelo sangue entre o cora��o e os pulm�es � chamada de 
pequena circula��o e carrega o sangue venoso (sem oxig�nio) para ser oxigenado. A grande circula��o � o trajeto percorrido entre o cora��o e o corpo, leva o 
sangue que foi oxigenado pelos pulm�es  para todas as c�lulas do corpo.

Para mais infoma��es, acesse: https://www.infoescola.com/anatomia-humana/coracao/ ', 'Cora��o', '\OrgaosImagens\Circulatorio\coracao.png', 4)

insert into Orgao values(26, 'Veias surgem da fus�o dos capilares e s�o respons�veis por transportar o sangue do corpo at� o cora��o. Sua capacidade de contrair e expandir 
permite que as veias armazenem pequenas ou grandes quantidades de sangue. Por sofrerem uma press�o menor do que a sofrida pelas art�rias, as veias possuem as paredes mais delgadas.
Elas possuem v�lvulas que agem unidirecionalmente para evitar o contrafluxo causado pela gravidade.

Para mais informa��es, acesse: https://www.infoescola.com/sistema-circulatorio/veia/', 'Veias', '\OrgaosImagens\Circulatorio\veias.png', 4)

insert into Orgao values(27, ' As art�rias s�o respons�veis por transportar o sangue do cora��o para o corpo. Existem diversas art�rias no nosso copo, as principais s�o
as art�rias Pulmonares que carregam o sangue venoso do cora��o para os pulm�es e a art�ria Aorta que carrega o sangue arterial(com oxig�nio) do ventriculo esquerdo do
cora��o para o restante do corpo. Ela se divide em art�rias menores que distribuem esse sangue para as c�lulas.
Para mais informa��es, acesse: https://www.infoescola.com/sistema-circulatorio/arteria/', 'Art�rias', '\OrgaosImagens\Circulatorio\arteria.png', 4)






insert into Sistema values(5, 'Sistema Reprodutor Masculino', 'O Sistema Reprodutor Masculino � formado por �rg�os internos e externos, que passam por um lento
amadurecimento concluindo-se na puberdade, ou seja, quando as c�lulas sexuais ficam dispon�veis para originar outro ser. � const�tuido pelos test�culos, 
epid�dimos, canais deferentes, ves�culas seminais, pr�stata, uretra e p�nis. 
Para informa��es, acesse: https://www.infoescola.com/biologia/aparelho-reprodutor-masculino/ http://www.anatomiadocorpo.com/sistema-reprodutor-genital/masculino/')

insert into Orgao values(28, 'O p�nis � um �rg�o cil�ndrico externo, que possui dois tipos de tecidos: cavernoso e esponjoso. Atrav�s do p�nis s�o eliminados a 
urina (fun��o excretora) e o s�men (fun��o reprodutora). O tecido esponjoso envolve a uretra e a protege, enquanto o tecido cavernoso se enche de sangue, fazendo 
com que o p�nis fique maior e duro (ere��o), pronto para o ato sexual, geralmente levando � ejacula��o (processo de expuls�o do s�men). A ere��o, no entanto, n�o 
ocorre apenas como prepara��o para uma atividade sexual, pode acontecer por diversos est�mulos fisiol�gicos, por exemplo, quando a bexiga est� cheia ou quando o homem 
tem um sonho � noite.
Para informa��es, acesse: http://www.anatomiadocorpo.com/penis/
https://www.infoescola.com/sistema-reprodutor/penis/', 'P�nis', '\OrgaosImagens\ReprMasc\penis.png', 5)

insert into Orgao values(29, 'Os test�culos s�o duas gl�ndulas de forma oval, que est�o situadas na bolsa escrotal. Na estrutura de cada test�culo encontram-se 
tubos finos e enovelados chamados "tubos semin�feros". Nos test�culos s�o produzidos os espermatozoides, c�lulas reprodutoras (gametas) masculinas, 
durante a chamada espermatog�nese e tamb�m de diversos horm�nios. O principal horm�nio � a testosterona, respons�vel pelo aparecimento das caracter�sticas 
sexuais secund�rias masculinas, como os pelos, modifica��es da voz, etc.

Para informa��es, acesse: https://www.infoescola.com/sistema-reprodutor/testiculos/', 'Test�culos', '\OrgaosImagens\ReprMasc\testiculos.png', 5)

insert into Orgao values(30, 'A uretra � um canal que, nos homens, serve ao sistema urin�rio e ao sistema reprodutor. Come�a na bexiga, atravessa a 
pr�stata e o p�nis (sua maior por��o) at� a ponta da glande, onde h� uma abertura pela qual s�o eliminados o s�men a a urina. Importante ressaltar
que urina e esperma nunca s�o eliminados ao mesmo tempo gra�as � musculatura da bexiga, na entrada da uretra, que impede que isso ocorra.

Para informa��es, acesse:  http://www.anatomiadocorpo.com/sistema-reprodutor-genital/uretra-masculina-e-feminina/
https://www.infoescola.com/anatomia-humana/uretra/', 'Uretra', '\OrgaosImagens\ReprMasc\uretra.png', 5)

insert into Orgao values(31, 'O canal deferente � um tubo fino e longo que sai de cada epid�dimo. Passa pelas pregas �nguas (virilha) atrav�s dos 
canais inguinais, segue sua trajet�ria pela cavidade abdominal, circunda a base da bexiga, alarga-se formando uma ampola. Recebe o l�quido seminal 
(proveniente da ves�cula seminal), atravessa a pr�stata, que nele descarrega o l�quido prost�tico, e vai desaguar na uretra. O conjunto dos espermatozoides, 
do l�quido seminal e do l�quido prost�tico, constitui o �esperma� ou �s�men�.

Para informa��es, acesse: http://www.anatomiadocorpo.com/sistema-reprodutor-genital/masculino/
https://www.infoescola.com/biologia/aparelho-reprodutor-masculino/', 'Canal Deferente', '\OrgaosImagens\ReprMasc\deferente.png', 5)

insert into Orgao values(32, 'S�o duas pequenas gl�ndulas (do tamanho de ervilhas) que se localizam abaixo da pr�stata. Secretam um muco claro e tem fun��o lubrificante.
Para informa��es, acesse: https://www.infoescola.com/biologia/aparelho-reprodutor-masculino/', 'Gl�ndulas Bulboretrais', '\OrgaosImagens\ReprMasc\bulboretrais.png', 5)

insert into Orgao values(33, 'A ves�cula seminal � formada por duas pequenas bolsas localizadas atr�s da bexiga. Tem como fun��o produzir o "l�quido seminal",
uma secre��o espessa e leitosa, que neutraliza a a��o da urina e protege os espermatozoides, al�m de ajudar seu movimento at� a uretra. O l�quido seminal 
tamb�m ajuda a neutralizar a acidez da vagina, evitando que os espermatozoides morram no caminho at� os ov�citos.

Para informa��es, acesse:  http://www.anatomiadocorpo.com/sistema-reprodutor-genital/masculino/
https://www.infoescola.com/sistema-reprodutor/prostata/', 'Ves�cula Seminal', '\OrgaosImagens\ReprMasc\seminal.png', 5)

insert into Orgao values(34, 'Os epid�dimos s�o canais alongados,de aproximadamente 4 a 6 m de comprimento, que se enrolam e recobrem posteriormente a superf�cie de cada 
test�culo. Corresponde ao local onde os espermatozoides, produzidos no test�culo, s�o armazenados.
Para informa��es, acesse: https://www.infoescola.com/sistema-reprodutor/epididimo/
http://www.anatomiadocorpo.com/sistema-reprodutor-genital/masculino/epididimo-e-vias-espermaticas/', 'Epid�dimo', '\OrgaosImagens\ReprMasc\epididimo.png', 5)





insert into Sistema values(6, 'Sistema Reprodutor Feminino', 'O Sistema Reprodutor feminino � respons�vel pela reprodu��o humana � formado pelos ov�rios que produzem 
os ov�citos(gametas femininos), as tubas uterinas, que transportam os �vulos at� o �tero e o protegem, o �tero, onde o embri�o se desenvolve, a vagina e a vulva. 
Para mais informa��es, acesse: https://www.todamateria.com.br/sistema-reprodutor-feminino/  
https://www.infoescola.com/biologia/aparelho-reprodutor-feminino/')

insert into Orgao values(35, 'A vagina � um �rg�o que se comunica com o �tero. Possui paredes franjadas e gl�ndulas secretras de muco. A regi�o externa 
da vulva � chamada de vest�bulo da vagina, onde encontramos dois orif�cos: o urin�rios (da uretra) e o genital (da vagina).A regi�o entre a vagina e a vulva,
em mulheres que nunca tiveram uma rela��o sexual origina o h�men.

Para mais informa��es, acesse: https://www.infoescola.com/sistema-reprodutor/vagina/ ', 'Vagina', '\OrgaosImagens\ReprFem\vagina.png', 6)

insert into Orgao values(36, 'O �tero � musculoso, oco e de grande elasticidade. Est� ligado com as tubas uterina e com a vagina. � formado por 5 regi�es: 
corpo, istmo, colo, �stio e fundo. Sua fun��o � receber e implantar embri�es, respons�vel pela expuls�o do feto no momento do parto. Tem  uma parede espessa 
composta por tr�s camadas: a serosa, o miom�trio, parede mais espessa do �tero e o endom�trio, que � a camada de c�lulas que reveste a cavidade uterina. Todo m�s ele se torna mais 
espesso para receber o ov�cito fertilizado. Caso n�o ocorra a fertiliza��o, o endom�trio que se desenvolveu � eliminado atrav�s da menstrua��o.
Para mais informa��es, acesse: https://www.infoescola.com/sistema-reprodutor/utero/', '�tero', '\OrgaosImagens\ReprFem\utero.png', 6)

insert into Orgao values(37, 'Os Ov�rios produzem os ov�citos e os horm�nios sexuais estr�geno e progesterona atrav�s da ovocitog�nese e a esteroidog�nese. 
Durante a fase f�rtil da mulher um dos ov�rios lan�a  um ov�cito na tuba uterina(ovula��o). No in�cio da vida ele � pequeno, mas vai aumentando de tamanho at� a fase adulta. 

Para mais informa��es, acesse: https://brasilescola.uol.com.br/biologia/ovarios.htm', 'Ov�rio', '\OrgaosImagens\ReprFem\ovario.png', 6)

insert into Orgao values(38, 'As tubas uterinas s�o denominadas ovidutos, s�o tubos musculares e s�o respons�veis por transportar o ov�cito em dire��o ao �tero. 
Elas s�o dividas em 4 partes: infud�bulo, que se  abre em uma cavidade chamada �stio abdominal, ampola,regi�o onde ela sofre uma curvatura para encontrar o ov�rio, o istmo, 
por��o medial que se abre, e o intramural, que abre-se na cavidade peritoneal pr�ximo ao ov�rio e possui prolongamentos no formato de franjas.
Para mais informa��es, acesse: https://www.infoescola.com/sistema-reprodutor/tubas-uterinas/', 'Tubas Uterinas', '\OrgaosImagens\ReprFem\tuba.png', 6)

insert into Sistema values(7, 'Sistema Muscular','O sistema muscular � composto  por aproximadamente 600 m�sculos, tecidos, cujas c�lulas ou fibras musculares
possuem a propriedade de contratilidade e de produ��o de movimentos. Tem como fun��es: estabilidade corporal, produ��o de movimentos, manuten��o da temperatura 
corporal, sustenta��o, aux�lio nos fluxos sangu�neos. Existem 3 tipos de m�sculos: 

Musculo Liso ou n�o estriado: m�sculos de contra��o involunt�ria, assegura a movimenta��o dos �rg�os internos.

M�sculo Estriado Card�aco: m�sculos de contra��o involunt�ria, asseguram os vigorosos batimentos card�acos.

M�sculo Estriado Esquel�tico: m�sculos de contra��o volunt�ria, conectados com os ossos e cartilagens e, atrav�s das contra��es, permitem os movimentos, 
as posi��es corporais, al�m de estabilizarem as articula��es do organismo.

Para mais informa��es, acesse: http://www.anatomiadocorpo.com/sistema-muscular/
https://www.infoescola.com/anatomia-humana/sistema-muscular/')

insert into Orgao values(39, 'Os m�sculos da cabe�a se dividem em mastigadores e os da m�mica.
M�sculos mastigadores � m�sculos elevadores e os abaixadores do maxilar. Os elevadores s�o o temporal, o masseter, o pterig�ideo interno e o pterig�ideo externo. 
J� o m�sculo abaixador do maxilar � o dig�strico.

M�sculos da m�mica � S�o tamb�m chamados m�sculos cuticulares, por se acharem intimamente relacionados com a pele. Quase todos se disp�em em torno dos orif�cios palpebrais, 
das narinas e da boca, concorrendo para as express�es fision�micas. Sendo alguns deles: o frontal, os orbiculares dos olhos, o superciliar, os orbiculares dos l�bios, o 
buzinador, entre outros.

M�sculos do Pesco�o: Os mais importantes s�o ocuticular, esterno-cleidomastdideo, escaleno e o dig�strico.

Para mais informa��es, acesse:http://www.anatomiadocorpo.com/sistema-muscular/musculos-da-cabeca-pescoco/
https://www.infoescola.com/anatomia-humana/sistema-muscular/', 'Cabe�a e pesco�o', '\OrgaosImagens\Muscular\rosto.png', 7)

insert into Orgao values(40, '- Trap�zio, superficialmente situado, triangular, estendendo-se desde o occipital at� a parte inferior da coluna dorsal, atrai para a dire��o da linha mediana a esp�dua, ao mesmo tempo que a eleva.

- Grande dorsal, na parte posterior e inferior do tronco, largo e delgado, de forma triangular, leva o bra�o, ao contrair-se, para tr�s, para baixo e para dentro.

Para mais informa��es, acesse: http://www.anatomiadocorpo.com/sistema-muscular/musculos-tronco-trapezio-coluna-dorso/
http://www.anatomiadocorpo.com/sistema-muscular/musculos-do-ombro/
https://www.infoescola.com/anatomia-humana/sistema-muscular/', 'Regi�o Posterior do Corpo', '\OrgaosImagens\Muscular\costas.png', 7)

insert into Orgao values(41, 'Com estes m�sculos � poss�vel a respira��o, al�m de impedir o corpo de se curvar e ceder ao pr�prio peso, entre outros movimentos.
Os m�sculos que se destacam s�o: 
- Grande peitoral, na regi�o �ntero-lateral, situado superficialmente, � triangular, e, pela fun��o, adutor do bra�o

_ Pequeno peitoral, por baixo do precedente, tamb�m triangular, faz descer, quando se contrai, a articula��o da esp�dua

- Grande denteado, largo, aplicado sobre � parede lateral do t�rax, ora atua como inspirador, ora solicita para diante a articula��o da esp�dua
 
Os m�sculos do abd�men (m�sculos abdominais) revestem as paredes laterais, anterior e posterior do abdome, funcionando como uma esp�cie de cinta que cont�m as v�sceras. Alguns exemplos s�o: o 
grande reto do abd�men, o m�dio reto do abd�men, o pequeno reto do abd�men, o transverso do abd�men, o m�sculo quadrado lombar e o diafragma.

Para mais informa��es, acesse: http://www.anatomiadocorpo.com/sistema-muscular/musculos-tronco-trapezio-coluna-dorso/ http://www.anatomiadocorpo.com/sistema-muscular/musculos-do-ombro/
http://www.anatomiadocorpo.com/sistema-muscular/musculos-torax-peito/ https://www.infoescola.com/anatomia-humana/sistema-muscular/', 'T�rax e Abdomem', '\OrgaosImagens\Muscular\peito.png', 7)

insert into Orgao values(42, 'S�o m�sculos capazes de fazer a press�o exata e permitem flexibilidade e precis�o para tarefas delicadas ou que exigem muita for�a. Exemplos:

- B�ceps, longo e fusiforme, situado na parte anterior do bra�o, em que faz, ao contrair-se, � flexor do antebra�o sobre o bra�o

- Tr�ceps braquial, m�sculo longo situado na parte posterior do bra�o, � extensor do antebra�o.

Para mais informa��es, acesse: http://www.anatomiadocorpo.com/sistema-muscular/musculos-do-braco-antebraco-e-mao/
https://www.infoescola.com/anatomia-humana/sistema-muscular/', 'Membros superiores', '\OrgaosImagens\Muscular\superior.png', 7)

insert into Orgao values(43, 'Esses s�o os m�sculos mais fortes do corpo, gra�as aos m�sculos das pernas podemos ficar de p� e manter o equil�brio. Exemplos:
- Costureiro (ou sart�rio), � m�sculo mais longo do corpo, ao se contrair dobra a perna e gira o quadril, � o m�sculo das costureiras, por isso o nome.

- Os flexores dorsais do p� fazem os dedos levantarem. 

- Flexores plantares (s�leo, plantar delgado e gastrocn�mio) ligado ao tend�o de Aquiles� respons�vel pelo movimento de ficar na ponta dos p�s.

- os tr�s gl�teos (grande, pequeno e m�dio) respons�veis por firmar a bacia sobre o f�mur.

- G�meos da perna, em n�mero de dois, o externo e o interno, formam a regi�o da panturrilha, ou barriga da perna, e terminam em baixo no tend�o de Aquiles

Para mais informa��es, acesse: http://www.anatomiadocorpo.com/sistema-muscular/musculos-da-coxa-perna-e-pe/
https://www.infoescola.com/anatomia-humana/sistema-muscular/', 'Membros inferiores', '\OrgaosImagens\Muscular\inferiores.png', 7)


insert into Sistema values(8, 'Sistema Nervoso','O sistema nervoso � respons�vel pelo controle de um organismo, regulando as atividades corporais tanto volunt�rias quanto involunt�rias.
O sistema nervoso � divido em Sistema Nervoso Central (SNC) e Sistema Nervoso  Perif�rico (SNP).O SNC � composto pela medula espinhal, c�rebro, bulbo, cerebelo
e ponte. J� o SNP pode ser divido em volunt�rio e auton�mo. Para mais informa��es, acesse: https://www.infoescola.com/biologia/sistema-nervoso/')

insert into Orgao values(44, 'A fun��o do bulbo est� relacionada com a respira��o e tem contato direto com a medula espinhal. Tamb�m est� relacionado com os reflexos 
cardiovasculares, transmiss�o de informa��es sensoriais e motoras, controle da degluti��o, tosse e v�mito.

Para mais informa��es, acesse: https://www.sobiologia.com.br/conteudos/FisiologiaAnimal/nervoso8.php', 'Bulbo', '\OrgaosImagens\Nervoso\bulbo.png', 8)

insert into Orgao values(45, 'O cerebelo � respons�vel pelas atividades dos m�sculos esquel�ticos, pelo tato, vis�o e audi��o. Est� relacionado com o 
equil�brio e postura conecta o c�rtex cerebral e o tronco encef�lico. A superf�cie � composta por fissuras transversas e curvas, com aspecto laminado. 
Pesquisas demonstraram que o cerebelo pode ter fun��es em atividades como m�moria, emo��es, aten��o e controle de atos impulsivos.

Para mais informa��es, acesse: https://www.infoescola.com/anatomia-humana/cerebelo/', 'Cerebelo', '\OrgaosImagens\Nervoso\cerebelo.png', 8)

insert into Orgao values(46, 'O c�rebro � a parte mais desenvolvida do enc�falo, est� relacionado com a maioria das fun��es do organismo.  Ele est� dividido em ar�as 
chamadas de lobos com fun��es diferentes e especializadas. Sua massa de tecido cinza-r�sea apresenta duas subst�ncias, uma branca e uma cinzenta. O c�rebro � divido em 
hemisf�rio esquerdo e direito, o primeiro � respons�vel pelo pensamento l�gico e compet�ncia comunicativa. J� o hemisf�rio direito � quem cuida do pensamento simb�lico e
 da criatividade. Nos canhotos essas fun��es s�o trocadas.

Para mais informa��es, acesse: https://www.infoescola.com/anatomia-humana/cerebro/', 'C�rebro', '\OrgaosImagens\Nervoso\cerebro.png', 8)

insert into Orgao values(47, 'A medula espinhal � a por��o alongada so SNC, se inicia abaixo do bulbo. � subordinada ao c�rebro, mas pode agir independente dele.
Pode ser divida em 6 partes: cervical superior, dilata��o cervical, cone terminal, lombar, dorsal e filamento terminal. As suas fun��es incluem conduzir impulsos nervosos,
produzir movimentos musculares e coordenar os reflexos.

Para mais informa��es, acesse: https://www.infoescola.com/anatomia-humana/medula-espinhal/', 'Medula', '\OrgaosImagens\Nervoso\medula.png', 8)

insert into Orgao values(48, 'Os neur�nios s�o a unidade funcional do sistema nervoso e juntamente com as c�lulas neur�glias formam o tecido nervoso. Se comunicam atrav�s 
de sinapses e por eles se propagam os impulsos nervosos. Eles s�o formados por um dendrito, corpo celular e ax�nio. Podem ser classificados em motores, que transmitem o sinal 
vindo do SNC at� os �rg�os efetores, sensoriais que recebem os est�mulos do meio-ambiente e interneur�nios que constituem extensas redes de neur�nios. 

Para mais informa��es, acesse: https://www.infoescola.com/sistema-nervoso/neuronios/', 'Neur�nios', '\OrgaosImagens\Nervoso\neuronio.png', 8)

insert into Orgao values(49, 'A ponte � respons�vel pela postura corporal, por transmitir informa��es da medula e do bulbo at� o cort�x 
cerebral e pelo equil�brio do corpo.
Para mais informa��es, acesse: http://neuralsystem.blogspot.com/2008/11/ponte.html', 'Ponte', '\OrgaosImagens\Nervoso\ponte.png', 8)


insert into Sistema values(9, 'Sistema Urin�rio','O sistema urin�rio � respons�vel pela produ��o e elimina��o de urina composta de aproximadamente 95% de �gua. 
Os principais excretas da urina humana s�o: a ureia, o cloreto de s�dio e o �cido �rico., que filtram as  impurezas do sangue que circula no organismo. � composto pelos rins, 
ureteres, bexiga urin�ria e a uretra.
Para mais informa��es acesse: https://www.todamateria.com.br/sistema-urinario/')

insert into Orgao values(50, 'A principal fun��o dos rins � filtrar dejetos presentes no sangue e excret�-los junto com a �gua. Existe um rim em cada lado da coluna, 
o direito localizado abaixo do f�gado e o esquerdo abaixo do ba�o. Acima de cada um encontra-se a gl�ndula supra-renal. Cada rim � formado por 1 a 4 milh�es de n�frons, 
capazes de realizar todas as fun��es renais.

Para mais informa��es, acesse: https://www.infoescola.com/sistema-urinario/rim/', 'Rins', 'OrgaosImagens\Urinario\rins.png', 9)

insert into Orgao values(51, 'Os Ureteres s�o dois tubos que conduzem a urina dos rins para a bexiga. Eles s�o envolvidos por algumas camadas 
musculares, dessa maneira, facilita-se a preven��o contra o refluxo da urina.

Para mais informa��es, acesse: https://www.grupoescolar.com/pesquisa/ureter--corpo-humano.html', 'Ureteres', 'OrgaosImagens\Urinario\ureteres.png', 9)

insert into Orgao values(52, 'A bexiga urin�ria � um �rg�o oco, muscular e el�stico, localizado na cavidade p�lvica. Ela � respons�vel por armazenar a urina produzida pelos
rins at� o momento da mic��o. Possui a capacidade de armazenar entre 650 a 800 ml de urina. Por�m quando o volume chega a aproximadamente 300ml, os sensores nervosos
enviam mensagens para o sistema nervoso, fazendo com que a pessoa sinta vontade de urinar.

Para mais informa��es, acesse: https://www.todabiologia.com/anatomia/bexiga_urinaria.htm', 'Bexiga Urin�ria', 'OrgaosImagens\Urinario\bexiga.png', 9)

insert into Orgao values(53, 'A uretra � um tubo muscular que leva a urina da bexiga para o exterior. No sexo masculino ela d� passagem para o esperma durante a ejacula��o e 
� formado pela por��o prost�tica, uretra membrosa e a uretra esponjosa, j� no sexo feminino � um �rgao exclusivamente do aparelho urin�rio e � revestida pelo epit�lio plano
estratificado. Para mais informa��es, acesse: https://www.infoescola.com/anatomia-humana/uretra/', 'Uretra', 'OrgaosImagens\Urinario\uretra.png', 9)


