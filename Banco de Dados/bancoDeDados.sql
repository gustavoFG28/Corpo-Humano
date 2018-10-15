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


insert into Sistema values(1, 'Sistema Digest�rio', 'O Sistema Digest�rio � formado por um conjunto de �rg�os cuja fun��o � transformar os alimentos,
por meio de processos mec�nicos e qu�micos. � const�tuido pela boca, faringe, es�fago, est�mago, intestino delgado e intestino grosso.
Al�m de �rg�os anexos como as gl�ndulas salivares, p�ncreas, f�gado, ves�cula biliar, dentes e l�ngua. 
Para mais informa��es, acesse: https://www.infoescola.com/anatomia-humana/sistema-digestorio/
http://www.anatomiadocorpo.com/sistema-digestorio-aparelho-digestivo/')

insert into Orgao values(1,'A boca, cavidade oval, � a porta de entrada dos alimentos. Quando ingeridos, s�o mastigados atrav�s da digest�o mec�nica.
Nela, acontece o �nicio da digest�o qu�mica dos carboidratos, onde o amido � decomposto em mol�culas de glicose e maltose, atrav�s da saliva.

Anexos envolvidos:

Gl�ndulas salivares: Produzem a saliva, que � const�tuida de �gua, mucina e amilase.

L�ngua: Sua mobilidade e sensibilidade aos sabores a torna um auxiliar preciso da mastiga��o.

Dentes: �rg�os esbranqui�ados, duros, de consist�cia p�trea, implantados nos alv�olos dos maxilares.

Para mais informa��es acesse:
http://www.anatomiadocorpo.com/sistema-digestorio-aparelho-digestivo/boca/
http://www.anatomiadocorpo.com/sistema-digestorio-aparelho-digestivo/boca/saliva-mastigacao-degluticao-ptialina-mucina-lisozima/', 'Boca', '\OrgaosImagens\Digestorio\boca.png', 1)

insert into Orgao values(2,'�rg�o tubular, com tamanho variado entre 12 � 15cm. � uma estrutura de grande resist�ncia, pois suporta correntes de ar cuja velocidade varia entre 
IS(respira��o normal) e 300km/h(tosse e espirro) sem lhe causar dano algum. Sua fun��o � circul��o de bolos alimentares e ar, pois esta comunica-se com a laringe levando o ar e 
com o es�fago levando alimento.

Para mais informa��es, acesse:
https://www.infoescola.com/anatomia-humana/faringe/
http://www.anatomiadocorpo.com/sistema-digestorio-aparelho-digestivo/faringe/', 'Faringe', '\OrgaosImagens\Digestorio\faringe.png', 1)


insert into Orgao values(3,'O es�fago � um conduto musculoso que liga a faringe ao est�mago, controlado pelo sistema nervoso aut�nomo. Assim, por meio de ondas de 
contra��es involunt�rias, conhecidas como peristaltismo ou movimentos perist�lticos, o conduto musculoso vai espremendo os alimentos e 
levando-os em dire��o ao est�mago. 

Para mais informa��es, acesse:
http://www.anatomiadocorpo.com/sistema-digestorio-aparelho-digestivo/esofago/
https://www.infoescola.com/sistema-digestivo/esofago/', 'Es�fago', '\OrgaosImagens\Digestorio\esofago.png' , 1)

insert into Orgao values(4,'O est�mago � um �rg�o do tubo digestivo que tem fun��es end�crinas e ex�crinas. Suas principais 
fun��es s�o adicionar um flu�do �cido ao alimento ingerido, transformando este bolo alimentar no chamado quimo, atrav�s da atividade muscular e da enzima pepsina, al�m de
iniciar a digest�o das prote�nas. Produz tamb�m uma lipase g�strica, que com o aux�lio da lipase lingual, digere os triglicer�deos. O epit�lio que reveste a mucosa
g�strica sofre invagina��o em dire��o � l�mina pr�pria, dando origem �s fossetas g�stricas, sendo que nestas, desembocam as gl�ndulas que secretam o suco g�strico. 
Para mais informa��es, acesse:
http://www.anatomiadocorpo.com/sistema-digestorio-aparelho-digestivo/estomago/
https://www.infoescola.com/sistema-digestivo/estomago/', 'Est�mago','\OrgaosImagens\Digestorio\estomago.png', 1)

insert into Orgao values(5,'O intestino delgado � revestido por uma mucosa enrugada que apresenta in�meras proje��es. Tem a fun��o de segregar as v�rias enzimas digestivas, dando 
origem a m�leculas pequenas e sol�veis como glicose, amino�cidos e glicerol. O intestino delgado est� dividido em tr�s por��es: o duodeno, o jejuno e o �leo. O duodeno diminui a acidez 
do quimo por meio do suco pancre�tico  que cont�m enzimas que o neutralizam. Logo, o quimo � banhado pela bile, armazenada na ves�cula biliar, emulsificando os lip�dios. O jejuno e �leo, 
levam a �pasta� at� o intestino grosso.

Anexos envolvidos:
P�ncreas: O p�ncreas tem fun��es end�crinas e ex�crinas. A parte end�crina � composta por grupos de c�lulas chamadas ilhotas pancre�ticas, formadas por tr�s grupos de c�lulas 
que produzem glucagon, insulina e somatostatina ambos lan�ados diretamente na corrente sangu�nea. J� a por��o ex�crina do p�ncreas participa na digest�o secretando enzimas digestivas
para o duodeno, atrav�s de estruturas chamas �cinos. 

F�gado:
O f�gado � a maior gl�ndula do corpo humano e pode executar mais de 500 fun��es, como: armazenamento e libera��o de glicose, metabolismo de lip�deos e prote�nas 
(convers�o de am�nia em ur�ia), s�ntese da maioria das prote�nas do plasma, processamento de drogas e horm�nios, destrui��o das c�lulas sangu�neas desgastadas e bact�rias,
emulsifica��o da gordura durante o processo de digest�o atrav�s da secre��o da bile, etc.

Para mais informa��es, acesse:
https://www.infoescola.com/anatomia-humana/intestino-delgado/
http://www.anatomiadocorpo.com/sistema-digestorio-aparelho-digestivo/intestino/
https://www.infoescola.com/anatomia-humana/pancreas/
http://www.anatomiadocorpo.com/sistema-endocrino/pancreas/
http://www.anatomiadocorpo.com/sistema-digestorio-aparelho-digestivo/figado/
https://www.infoescola.com/anatomia-humana/figado/','Intestino', 'Intestino Delgado','\OrgaosImagens\Digestorio\intestinoDelgado.png', 1)

insert into Orgao values(6, 'O intestino grosso � respons�vel por armazenar e eliminar os res�duos da digest�o e absorver os nutrientes que o intestino delgado n�o assimilou
e a �gua tanto a ingerida, quanto a das secre��es digestivas. � dividido em ceco, onde os res�duos alimentares, j� constituindo o bolo fecal, passam ao c�lon e reto. Quando o 
alimento chega ao c�lon descendente, o bolo fecal permanece estagnado por muitas horas. As fibras vegetais n�o digeridas nem absorvidas pelo sistema digestivo, passam por todo tubo
digestivo e formam uma porcentagem significativa da massa fecal. Gl�ndulas da mucosa do intestino grosso, secretam muco, que lubrifica o bolo fecal, facilitando seu tr�nsito e sua
elimina��o. O reto � a parte final do intestino grosso, e termina com o canal anal que se comunica com o exterior atrav�s do �nus, por onde s�o 
eliminados os res�duos fecais. O esf�ncter � um m�sculo localizado ao redor do �nus, que controla a passagem das fezes.
Para mais informa��es, acesse: https://www.infoescola.com/sistema-digestivo/intestino-grosso/
http://www.anatomiadocorpo.com/sistema-digestorio-aparelho-digestivo/intestino/', 'Intestino Grosso', '\OrgaosImagens\Digestorio\intestinoGrosso.png', 1)






insert into Sistema values(2, 'Sistema Esquel�tico', 'O sistema esquel�tico � formado por 206 ossos al�m de cartilagens, ligamentos e tend�es, � respons�vel por
sustentar, proteger nossos �rg�os e dar forma ao corpo. Atua em conjunto com o sistema articular e muscular para permitir o movimento. Outras fun��es s�o a produ��o de 
c�lulas sangu�neas na medula �ssea e armazenamento de sais minerais, como o c�lcio. O osso � uma estrutura viva, muito resistente e din�mica. 
Para mais informa��es, acesse: https://www.todamateria.com.br/sistema-esqueletico/')

insert into Orgao values(7,'A face � constitu�da por quatorze ossos: um �nico m�vel que � o maxilar inferior e treze fixos, que em  conjunto, formam o maxilar superior.
Dos trezes ossos fixos da face 12 formam seis pares, e um, o v�mer, � �mpar. Os pares restantes s�o: os maxilares superiores, os malares, os nasais, os �nguis, os ossos 
palatinos e os cartuchos inferiores.

Para mais informa��es, acesse: https://www.anatomiaonline.com/face/
http://www.anatomiadocorpo.com/esqueleto-humano-sistema-esqueletico-ossos/', 'Ossos da Face','\OrgaosImagens\Esqueleto\face.png' ,2)

insert into Orgao values(8,'O cr�nio � uma estrutura r�gida(dura), cartilagionasa ou �ssea. Ele protege e armazena o enc�falo. 
O cr�nio humano � composto de oito ossos: Parietal (dois), Temporal (dois), Frontal, Occipital, Esfen�ide, Etm�ide', 'Ossos da Face.
Para mais informa��es acesse: https://www.todabiologia.com/dicionario/cranio.htm 
http://www.anatomiadocorpo.com/esqueleto-humano-sistema-esqueletico-ossos/' ,'\OrgaosImagens\Esqueleto\face.png', 2)


insert into Orgao values(9,
'Bigorna: Localizada no ouvido m�dio, tem formato de bigorna e um corpo que se articula com o martelo.

Martelo: Presente no ouvido m�dio � formado por uma longa proje��o, o man�brio queest� inserido na membrana timp�nica.

Estribo: Forma a cadeia auditiva e � o menor ossso do corpo humano. Articula-se com a bigorna.

Para mais informa��es, acesse: 
http://www.biologia.seed.pr.gov.br/modules/galeria/detalhe.php?foto=298&evento=3
http://www.biologia.seed.pr.gov.br/modules/galeria/detalhe.php?foto=452&evento=3
http://www.biologia.seed.pr.gov.br/modules/galeria/detalhe.php?foto=563&evento=3
https://www.hear-it.org/pt/O-ouvido-medio', 'Ossos do Ouvido','\OrgaosImagens\Esqueleto\ouvido.png',2)

insert into Orgao values(10, 'O osso hi�ide � um osso com forma de U superior � laringe, os dois bra�os projetam-se posteriormente a partir das extremidades laterais do corpo. O osso hi�ide 
� altamente m�vel para muitos m�sculos e estruturas de partes moles na cabe�a e pesco�o e n�o articula com outro elemento esquel�tico nem na cabe�a e nem no pesco�o.

Para mais informa��es, acesse: https://www.portaleducacao.com.br/conteudo/artigos/fonoaudiologia/osso-hioide/37126', 'Pesco�o', '\OrgaosImagens\Esqueleto\pescoco.png',2)

insert into Orgao values(11, 'Clav�cula: forma a por��o ventral do ombto, � um osso curvado como um "S" it�lico,
situado acima da primeira costela. Articula-se com o man�brio do esterno e com o  acr�mio da esc�pula.

Esc�pula: � um osso chato bem fino, com uma forma triangular podendo ser transl�cido 
em certos pontos. Forma a parte dorsal da cintura escapular.
Para mais informa��es, acesse: https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/membro-superior/escapula/ 
https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/membro-superior/clavicula/', 'Cintura escapular', '\OrgaosImagens\Esqueleto\escapula.png',2)

insert into Orgao values(12,'�mero - � o maior e mais longo osso superior e se articula com a esc�pula, com o radio e com a ulna.

Ulna - � um osso longo localizado no meio do antebra�o. Articula-se com o �mero e com o r�dio.

R�dio - � um osso curto localizado na lateral do antebra�o. Articula-se com o �mero, com a ulna e com os ossos do carpo.

Para mais informa��es, acesse: https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/membro-superior/umero/
https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/membro-superior/ulna/
https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/membro-superior/radio/
 ', 'Ossos do Bra�o', '\OrgaosImagens\Esqueleto\braco.png', 2)

insert into Orgao values(13, 'A m�o tem no total 27 ossos trabalhando em conjunto. Junto com os m�sculos e 
articula��es permitem o manuseio de objetos. Ela � divida em 3 regi�es diferentes: 

O carpo - composto pelos ossos: escafoide, semilunar, piramidal , pisiforme,  trap�zio, 
trapezoide, capitato e hamato.

O metacarpo  - composta por 5 ossos metacarpianos.

A falange - composta por 18 ossos.

Para mais informa��es, acesse: https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/membro-superior/ossos-da-mao/
https://www.todamateria.com.br/ossos-da-mao/
http://www.anatomiadocorpo.com/esqueleto-humano-sistema-esqueletico-ossos/mao-carpo-metacarpo-falanges/', 'Ossos da M�o', '\OrgaosImagens\Esqueleto\mao.png',2)

insert into Orgao values(14,'Costela: s�o formadas por 12 pares, alongadas, em forma de semi-arcos e ligam as 
v�rtebras tor�cicas ao esterno e s�o classificadas em:
* 7 Pares Verdadeiras: articulam se diretamente ao esterno
* 3 Pares Falsas Propriamente Ditas: articulam-se indiretamente (cartilagens)
* 2 Pares Falsas Flutuantes: s�o livres

Esterno: � um osso chato, plano e �mpar. Apresenta 3 partes:
* Man�brio
* Corpo
* Processo Xifoide

Para mais informa��es, acesse: https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/torax/esterno/
https://www.auladeanatomia.com/novosite/sistemas/sistema-esqueletico/torax/costelas/', 'T�rax', '\OrgaosImagens\Esqueleto\torax.png', 2)

insert into Orgao values(15,'
V�rtebras Cervicais: possui um corpo pequeno, exceto a primeira v�rtebra.

V�rtebras Tor�cicas: n�o � bifurcado e se apresenta descendente e pontiagudo. Elas se articulam com as costelas e a sua superf�cie articular � chamada de f�vea e hemi-f�vea.
 
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

insert into Orgao values(17,'F�mur �  � o mais longo osso do corpo que se articula com o ossos do quadril, 
com a patela e com a t�bia.

Patela � � um osso pequeno e triangular, tamb�m chamado de r�tula localizado 
na articula��o do joelho.

T�bia �  depois do f�mur o osso que suporta mais o peso. Articula-se com o f�mur
 e com a f�bula.

F�bula � localizada lateralmente a t�bia, serve para a fixa��o dos m�sculos e n�o 
possui fun��o de sustenta��o de peso.

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

insert into Sistema values(3, 'Sistema Respirat�rio', 'O Sistema Respirat�rio fornece oxig�nio e remove g�s carb�nico do organismo, auxilia as c�lulas no metabolismo e
atua em conjunto com o sistema circulat�rio. � formado pelo nariz, cavidade do nariz, faringe, laringe, traqu�ia, br�nquios e pulm�es.
Para mais informa��es, acesse: https://www.infoescola.com/biologia/sistema-respiratorio/')

insert into Orgao values(19,'  O ar entra no sistema respirat�rio por meio das fossas nasais que s�o separadas por uma cartilagem chamada de septo. No interior do nariz
s�o encontrados pelos que ret�m part�culas que entram junto com o ar, o nariz � respons�vel por esquentar, filtrar e umedecer o ar para os pulm�es. 

Para mais informa��es, acesse: https://www.infoescola.com/biologia/sistema-respiratorio/ 
https://www.todamateria.com.br/sistema-respiratorio/', 'Nariz', '\OrgaosImagens\Respiratorio\nariz.png', 2)

insert into Orgao values(20,' A faringe � um �rg�o tubular que inicia-se nas coanas(abertura nasal posterior) 
com prolonga��o para baixo no pesco�o com a forma de um funil. Se comunica com o 
es�fago, fossas nasais e ouvidos mantendo-se ligada � laringe e ao es�fago.
Ela � respons�vel pela circula��o de ar e alimentos. Quando respriramos o ar 
entra nas fossas nasais e passa pela faringe encaminhando-se para traqueia e
pelos br�nquios at� chegar aos pulm�es.


Para mais informa��es,acesse: https://www.infoescola.com/anatomia-humana/faringe/','Faringe','\OrgaosImagens\Respiratorio\faringe.png', 2)
insert into Orgao values(21,'','Laringe','\OrgaosImagens\Respiratorio\laringe.png', 2)
insert into Orgao values(22,'','Traqueia','\OrgaosImagens\Respiratorio\traqueia.png', 2)
insert into Orgao values(23,'','Br�nquios','\OrgaosImagens\Respiratorio\bronquio.png', 2)
insert into Orgao values(24,'','Pulm�es','\OrgaosImagens\Respiratorio\pulmao.png', 2)

insert into Sistema values(4, 'Sistema Circulat�rio', 'O Sistema Circulat�rio � divido em sistema cardiovascular e linf�tico. O sistema cardiovascular � formado pelo cora��o e 
vasos sangu�neos(veias, art�rias e capilares). O cora��o bombeiao sangue e os vasos sangu�neos o transporta junto com  elementos essenciais para o funcionamento dos tecidos, 
como g�s oxig�nio e g�s carb�nico, horm�nios, excretas metab�licas, c�lulas de defesa. O sistema linf�tico protege o organismo das doen�as.
Para mais informa��es, acesse: https://www.infoescola.com/biologia/sistema-circulatorio/')


insert into Sistema values(5, 'Sistema Reprodutor Masculino', 'O Sistema Reprodutor Masculino � formado por �rg�os internos e externos, que passam por um lento amadurecimento concluindo-se na puberdade, ou 
seja, quando as c�lulas sexuais ficam dispon�veis para originar outro ser. � const�tuido pelos test�culos, epid�dimos, canais deferentes, ves�culas seminais, pr�stata, uretra e p�nis. 
Para informa��es, acesse: https://www.infoescola.com/biologia/aparelho-reprodutor-masculino/ http://www.anatomiadocorpo.com/sistema-reprodutor-genital/masculino/')

insert into Sistema values(6, 'Sistema Reprodutor Feminino', 'O Sistema Reprodutor femino � respons�vel pela reprodu��o humana � formado pelos ov�rios que produzem 
os �vulos(gametas femininos), as tubas uterinas, que transportam os �vulos at� o �tero e o protegem, o �tero, onde o embri�o se desenvolve, a vagina e a vulva. 
Para mais informa��es, acesse: https://www.todamateria.com.br/sistema-reprodutor-feminino/  
https://www.infoescola.com/biologia/aparelho-reprodutor-feminino/')

insert into Sistema values(7, 'Sistema Muscular','O sistema muscular � composto  por aproximadamente 600 m�sculos, tecidos, cujas c�lulas ou fibras musculares possuem a propriedade de contratilidade e de produ��o de movimentos.  
Tem como fun��es: estabilidade corporal, produ��o de movimentos, manuten��o da temperatura corporal, sustenta��o, aux�lio nos fluxos sangu�neos.

Existem 3 tipos de m�sculos: 

Musculo Liso ou n�o estriado: m�sculos de contra��o involunt�ria, assegura a movimenta��o dos �rg�os internos.

M�sculo Estriado Card�aco: m�sculos de contra��o involunt�ria, asseguram os vigorosos batimentos card�acos.

M�sculo Estriado Esquel�tico: m�sculos de contra��o volunt�ria, conectados com os ossos e cartilagens e, atrav�s das 
contra��es, permitem os movimentos, as posi��es corporais, al�m de estabilizarem as articula��es do organismo.

Para mais informa��es, acesse:
http://www.anatomiadocorpo.com/sistema-muscular/
https://www.infoescola.com/anatomia-humana/sistema-muscular/')

insert into Sistema values(8, 'Sistema Nervoso','O sistema nervoso � respons�vel pelo controle de um organismo, regulando as atividades corporais tanto volunt�rias quanto involunt�rias.
O sistema nervoso � divido em Sistema Nervoso Central (SNC) e Sistema Nervoso  Perif�rico (SNP).O SNC � composto pela medula espinhal, c�rebro, bulbo, cerebelo
e ponte. J� o SNP pode ser divido em volunt�rio e auton�mo. Para mais informa��es, acesse: https://www.infoescola.com/biologia/sistema-nervoso/')

insert into Sistema values(9, 'Sistema Urin�rio','O sistema urin�rio � respons�vel pela produ��o e elimina��o de urina composta de aproximadamente 95% de �gua. 
Os principais excretas da urina humana s�o: a ureia, o cloreto de s�dio e o �cido �rico., que filtram as  impurezas do sangue que circula no organismo. � composto pelos rins, 
ureteres, bexiga urin�ria e a uretra.
Para mais informa��es acesse: https://www.todamateria.com.br/sistema-urinario/')

insert into Orgao values( , 'A uretra � um tubo muscular que leva a urina da bexiga para o exterior. No sexo masculino ela d� passagem para o esperma durante a ejacula��o e 
� formado pela por��o prost�tica, uretra membrosa e a uretra esponjosa, j� no sexo feminino � um �rgao exclusivamente do aparelho urin�rio e � revestida pelo epit�lio plano
estratificado. Para mais informa��es, acesse: https://www.infoescola.com/anatomia-humana/uretra/', 'Uretra', 'OrgaosImagens\Urinario\uretra.png', 9)


