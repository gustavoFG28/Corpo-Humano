-- Procedure para efetuar cadastro
create proc cadastrar_sp
@nome varchar(30) = null,
@senha varchar(30) = null,
@email varchar(40) = null,
@img varchar(50) = null,
@fundo varchar(50) = null
as
declare @cod int
select @cod = COUNT(*) + 1 from Usuario
begin transaction
	insert into Usuario values(@cod, @nome, @senha, @email,@img,@fundo)
	if((select count(*) from Usuario where email = @email)>1)
		rollback transaction
	else 
		begin 
			select * from Usuario where codigoUsuario = @cod
			commit transaction
		end

-- Procedure para efetuar login
create proc login_sp
@email varchar(40) = null,
@senha varchar(30) = null
as
declare @codigoUsuario int
if exists(select codigoUsuario from Usuario where email = @email and senha = @senha)
begin
	select  @codigoUsuario = codigoUsuario from Usuario where email = @email and senha = @senha
	declare @idAcesso int
	declare @data datetime
	set @data = GETDATE()
	select @idAcesso = count(*)+1 from Acesso
	insert into Acesso values(@idAcesso, @data, @codigoUsuario)
end
select codigoUsuario from Usuario where email = @email and senha = @senha




-- Inserindo valores no quiz

insert into Quiz values(1,'1 - Quais é o nome da principal Artéria que leva o sangue arterial do coração para o restante do corpo?',
'd','a) Artéria pulmonar','b) Artéria Axilar','c) Artéria Radial','d) Artéria Aorta',null)

insert into Quiz values(2,'2 - Qual o nome das estruturas anexas a boca?','b','a) Esôfago e vesícula biliar','b) Glândulas salivares, dentes e língua','
c) Dentes, esôfago e rins','d) Artérias pulmonares, língua e pulmão',null)

insert into Quiz values(3,'3 - Quais são os 3 tipo de músculos existentes?','a','a) Estriado cardíaco, estriado esquelético e liso',
'b) Estriado muscular, grosso e estriado esquelético','c) Estriado vascular, estriado muscular e liso','d) Estriado cardíaco, estriado esquelético e grosso',null)

insert into Quiz values(4,'4 - Porque o pulmão esquerdo é menor que o direito?','d','a) Porque o pulmão esquerdo não fornece tanto oxigênio quanto o direito.','
b) Porque o pulmão esquerdo é timido.','c) Porque o pulmão direito se desenvolveu mais, já que usamos mais ele.','d) Porque no pulmão esquerdo existe uma cavidade para o coração.',null)

insert into Quiz values(5,'5 - A quantidade de água presente na urina é de:','d','a) 80%','b) 30%','c) 75% ','d) 95% ',null)

insert into Quiz values(6,'6 - O corpo humano é formado por quantos osso?','c','a) 459','b) 300','c) 206','d) 2',null)

insert into Quiz values(7,'7 - O hemisfério esquerdo em pessoas destras é responsável por:','a','a) Pensamento lógico e competência comunicativa.',
'b) Visão, audição, tato, gustação e olfato.','c) Sentimentos e emoções.','d) Criatividade e pensamento simbólico.',null)

insert into Quiz values(8,' 8 - Preencha as frases com as palavras corretas:
I) Em mulheres que nunca tiveram uma relação sexual, a região entre a vagina
e a vulva origina o _______.
II) Caso não ocorra a fertilização, o endométrio que se desenvolveu no útero  
é eliminado através da _______.
III) As tubas uterinas são tubos musculares responsáveis por _______ o óvulo em direção ao útero.
As palavras que completam as sentenças são respectivamente:

','c','a) útero, ovulação, transportar.','b) tubas uterinas, ovulação, empurrar.','c) hímen, menstruação, tranportar.','d) tubas uterinas, menstruação, transportar.',null)

insert into Quiz values(9,'9 - O pênis elimina dois líquidos que possuem funções, são eles:','a',' a) Sêmen, função reprodutora e urina, função excretora.',
'b) Saliva, função excretora e sêmen, função ','c) Água e suor, função excretora.','d) Sêmen, função excretora e urina, função reprodutora.',null)


insert into Quiz values(10,'1 - (UEPB-2006) - Num incêndio é comum o indivíduo morrer, antes por asfixia, do que por queimaduras. Tal situação ocorre, porque:','c',
'a) a fumaça destrói os leucócitos. ','b) as plaquetas são destruídas na presença do monóxido de carbono. ','c) a hemoglobina combina-se com o monóxido de carbono, 
formando um composto estável, tornando-se irrecuperável. ','d) a hemoglobina combina-se com todo o oxigênio disponível.','e) a hemoglobina, nessa situação, só transporta dióxido de carbono.')

insert into Quiz values(11,'2 -(MACK) - Assinale a alternativa correta a respeito do processo digestivo.','d',
'a) A digestão enzimática de carboidratos só se inicia no duodeno. ','b) O pH ácido do estômago inativa todas as enzimas digestivas. ',
'c) A retirada da vesícula biliar pode provocar dificuldade de digestão de lipídios, devido à falta de enzimas. ',
'd) A superfície interna do jejuno-íleo apresenta dobras para facilitar a absorção de nutrientes. ','e) As bactérias presentes no intestino grosso são parasitas, mas só provocam sintomas quando seu número se eleva muito.')

insert into Quiz values(12,'3 - (Faap-SP) - Em relação à circulação humana, é incorreto afirmar: ','c','a) Todo vaso que sai do coração é artéria. ',
'b) Todo vaso que chega ao coração é veia. ','c) Todo sangue que chega ao coração é sangue venoso. ','d) O sangue rico em oxigênio é o arterial. ','e) O sangue venoso passa do átrio direito para o ventrículo direito.')

insert into Quiz values(13,'4 - (Unicamp 2014 - 1ª Fase) - O tecido muscular cardíaco apresenta fibras','d','a) lisas, de contração voluntária e aeróbia.',
'b) lisas, de contração involuntária e anaeróbia.','c) estriadas, de contração voluntária e anaeróbia.','d) estriadas, de contração involuntária e aeróbia.',null)

insert into Quiz values(14,'5 - (Fgv) - Trata-se de um líquido constituinte do esperma que apresenta aspecto leitoso e é alcalino, contribui para neutralizar a acidez das secreções vaginais além de promover um aumento da motilidade dos
espermatozoides. Esse líquido é produzido ','c','a) pelo epidídimo. ','b) pelo testículo. ','c) pela próstata. ','d) pela vesícula seminal. ','
e) pelas glândulas bulbouretrais.')

insert into Quiz values(15,'6 - (UFMG) - A ocorrência de gravidez na adolescência tem aumentado consideravelmente. O conhecimento e o uso adequado de métodos contraceptivos
podem reverter esse problema. Em relação a esses métodos, é CORRETO afirmar-se que: ','c','a) o diafragma impede a nidação da mórula. ','b) o dispositivo intra-uterino, D.I.U, impede a chegada dos espermatozoides ao útero. ','
c) o método hormonal feminino, pílula, impede a ovulação. ','d) o método de tabela é eficiente se forem evitadas relações sexuais entre o décimo segundo e o décimo quarto dia do ciclo. ','
e) o preservativo masculino, camisinha, tem ação espermicida.')

insert into Quiz values(16,'7 - (UFSC) - Cada ureter conduz a urina:','a','a) do rim à bexiga. ','b) da bexiga ao meio externo. ',
'c) da bexiga ao rim. ','d) da pelve renal aos cálices. ','e) dos cálices às pelves renais.')

insert into Quiz values(17,'8 -  (Fuvest-1998) Além da sustentação do corpo, são funções dos ossos:','a','
a) armazenar cálcio e fósforo; produzir hemácias e leucócitos.','b) armazenar cálcio e fósforo; produzir glicogênio.','
c) armazenar glicogênio; produzir hemácias e leucócitos.','
d) armazenar vitaminas; produzir hemácias e leucócitos.','
e) armazenar vitaminas; produzir proteínas do plasma.')

insert into Quiz values(18,'9- (Fuvest-SP) - Qual dos seguintes comportamentos envolve maior número de órgãos do sistema nervoso? ','e','a) Salivar ao sentir o aroma de comida gostosa. ',
'b) Levantar a perna quando o médico toca com martelo no joelho do paciente. ','c) Piscar com a aproximação brusca de um objeto. ',
'd) Retirar bruscamente a mão ao tocar um objeto muito quente. ','e) Preencher uma ficha de identificação.')

