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

insert into Quiz values(1,'1 - Quais � o nome da principal Art�ria que leva o sangue arterial do cora��o para o restante do corpo?',
'd','a) Art�ria pulmonar','b) Art�ria Axilar','c) Art�ria Radial','d) Art�ria Aorta',null)

insert into Quiz values(2,'2 - Qual o nome das estruturas anexas a boca?','b','a) Es�fago e ves�cula biliar','b) Gl�ndulas salivares, dentes e l�ngua','
c) Dentes, es�fago e rins','d) Art�rias pulmonares, l�ngua e pulm�o',null)

insert into Quiz values(3,'3 - Quais s�o os 3 tipo de m�sculos existentes?','a','a) Estriado card�aco, estriado esquel�tico e liso',
'b) Estriado muscular, grosso e estriado esquel�tico','c) Estriado vascular, estriado muscular e liso','d) Estriado card�aco, estriado esquel�tico e grosso',null)

insert into Quiz values(4,'4 - Porque o pulm�o esquerdo � menor que o direito?','d','a) Porque o pulm�o esquerdo n�o fornece tanto oxig�nio quanto o direito.','
b) Porque o pulm�o esquerdo � timido.','c) Porque o pulm�o direito se desenvolveu mais, j� que usamos mais ele.','d) Porque no pulm�o esquerdo existe uma cavidade para o cora��o.',null)

insert into Quiz values(5,'5 - A quantidade de �gua presente na urina � de:','d','a) 80%','b) 30%','c) 75% ','d) 95% ',null)

insert into Quiz values(6,'6 - O corpo humano � formado por quantos osso?','c','a) 459','b) 300','c) 206','d) 2',null)

insert into Quiz values(7,'7 - O hemisf�rio esquerdo em pessoas destras � respons�vel por:','a','a) Pensamento l�gico e compet�ncia comunicativa.',
'b) Vis�o, audi��o, tato, gusta��o e olfato.','c) Sentimentos e emo��es.','d) Criatividade e pensamento simb�lico.',null)

insert into Quiz values(8,' 8 - Preencha as frases com as palavras corretas:
I) Em mulheres que nunca tiveram uma rela��o sexual, a regi�o entre a vagina
e a vulva origina o _______.
II) Caso n�o ocorra a fertiliza��o, o endom�trio que se desenvolveu no �tero  
� eliminado atrav�s da _______.
III) As tubas uterinas s�o tubos musculares respons�veis por _______ o �vulo em dire��o ao �tero.
As palavras que completam as senten�as s�o respectivamente:

','c','a) �tero, ovula��o, transportar.','b) tubas uterinas, ovula��o, empurrar.','c) h�men, menstrua��o, tranportar.','d) tubas uterinas, menstrua��o, transportar.',null)

insert into Quiz values(9,'9 - O p�nis elimina dois l�quidos que possuem fun��es, s�o eles:','a',' a) S�men, fun��o reprodutora e urina, fun��o excretora.',
'b) Saliva, fun��o excretora e s�men, fun��o ','c) �gua e suor, fun��o excretora.','d) S�men, fun��o excretora e urina, fun��o reprodutora.',null)


insert into Quiz values(10,'1 - (UEPB-2006) - Num inc�ndio � comum o indiv�duo morrer, antes por asfixia, do que por queimaduras. Tal situa��o ocorre, porque:','c',
'a) a fuma�a destr�i os leuc�citos. ','b) as plaquetas s�o destru�das na presen�a do mon�xido de carbono. ','c) a hemoglobina combina-se com o mon�xido de carbono, 
formando um composto est�vel, tornando-se irrecuper�vel. ','d) a hemoglobina combina-se com todo o oxig�nio dispon�vel.','e) a hemoglobina, nessa situa��o, s� transporta di�xido de carbono.')

insert into Quiz values(11,'2 -(MACK) - Assinale a alternativa correta a respeito do processo digestivo.','d',
'a) A digest�o enzim�tica de carboidratos s� se inicia no duodeno. ','b) O pH �cido do est�mago inativa todas as enzimas digestivas. ',
'c) A retirada da ves�cula biliar pode provocar dificuldade de digest�o de lip�dios, devido � falta de enzimas. ',
'd) A superf�cie interna do jejuno-�leo apresenta dobras para facilitar a absor��o de nutrientes. ','e) As bact�rias presentes no intestino grosso s�o parasitas, mas s� provocam sintomas quando seu n�mero se eleva muito.')

insert into Quiz values(12,'3 - (Faap-SP) - Em rela��o � circula��o humana, � incorreto afirmar: ','c','a) Todo vaso que sai do cora��o � art�ria. ',
'b) Todo vaso que chega ao cora��o � veia. ','c) Todo sangue que chega ao cora��o � sangue venoso. ','d) O sangue rico em oxig�nio � o arterial. ','e) O sangue venoso passa do �trio direito para o ventr�culo direito.')

insert into Quiz values(13,'4 - (Unicamp 2014 - 1� Fase) - O tecido muscular card�aco apresenta fibras','d','a) lisas, de contra��o volunt�ria e aer�bia.',
'b) lisas, de contra��o involunt�ria e anaer�bia.','c) estriadas, de contra��o volunt�ria e anaer�bia.','d) estriadas, de contra��o involunt�ria e aer�bia.',null)

insert into Quiz values(14,'5 - (Fgv) - Trata-se de um l�quido constituinte do esperma que apresenta aspecto leitoso e � alcalino, contribui para neutralizar a acidez das secre��es vaginais al�m de promover um aumento da motilidade dos
espermatozoides. Esse l�quido � produzido ','c','a) pelo epid�dimo. ','b) pelo test�culo. ','c) pela pr�stata. ','d) pela ves�cula seminal. ','
e) pelas gl�ndulas bulbouretrais.')

insert into Quiz values(15,'6 - (UFMG) - A ocorr�ncia de gravidez na adolesc�ncia tem aumentado consideravelmente. O conhecimento e o uso adequado de m�todos contraceptivos
podem reverter esse problema. Em rela��o a esses m�todos, � CORRETO afirmar-se que: ','c','a) o diafragma impede a nida��o da m�rula. ','b) o dispositivo intra-uterino, D.I.U, impede a chegada dos espermatozoides ao �tero. ','
c) o m�todo hormonal feminino, p�lula, impede a ovula��o. ','d) o m�todo de tabela � eficiente se forem evitadas rela��es sexuais entre o d�cimo segundo e o d�cimo quarto dia do ciclo. ','
e) o preservativo masculino, camisinha, tem a��o espermicida.')

insert into Quiz values(16,'7 - (UFSC) - Cada ureter conduz a urina:','a','a) do rim � bexiga. ','b) da bexiga ao meio externo. ',
'c) da bexiga ao rim. ','d) da pelve renal aos c�lices. ','e) dos c�lices �s pelves renais.')

insert into Quiz values(17,'8 -  (Fuvest-1998) Al�m da sustenta��o do corpo, s�o fun��es dos ossos:','a','
a) armazenar c�lcio e f�sforo; produzir hem�cias e leuc�citos.','b) armazenar c�lcio e f�sforo; produzir glicog�nio.','
c) armazenar glicog�nio; produzir hem�cias e leuc�citos.','
d) armazenar vitaminas; produzir hem�cias e leuc�citos.','
e) armazenar vitaminas; produzir prote�nas do plasma.')

insert into Quiz values(18,'9- (Fuvest-SP) - Qual dos seguintes comportamentos envolve maior n�mero de �rg�os do sistema nervoso? ','e','a) Salivar ao sentir o aroma de comida gostosa. ',
'b) Levantar a perna quando o m�dico toca com martelo no joelho do paciente. ','c) Piscar com a aproxima��o brusca de um objeto. ',
'd) Retirar bruscamente a m�o ao tocar um objeto muito quente. ','e) Preencher uma ficha de identifica��o.')

