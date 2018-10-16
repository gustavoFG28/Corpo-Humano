const express = require('express');		// variavel associada com o modulo do pacote express
const app = express();					// objeto do tipo express - acessar o banco
const bodyParser = require('body-parser');		// variavel associada com o modulo do pacote body-parser
const porta = 3000;						 //porta padrão - passar na url para acessar a aplicação
const sql = require('mssql');			// variavel que usa as funções do pacote mssql
const conexaoStr = "Server=regulus.cotuca.unicamp.br;Database=BD18194;User Id=BD18194;Password=604020gu;";	// string necessária para conectar-se ao banco

//conexao com BD
sql.connect(conexaoStr)	// sql é instancia, connect conecta ao banco q tem como param a string
   .then(conexao => global.conexao = conexao)	//se conectar(then) retorna a conexao com o banco banco 
   .catch(erro => console.log(erro));		//se n conectar retorna o erro 

// configurando o body parser para pegar POSTS mais tarde
app.use(bodyParser.urlencoded({ extended: true}));	// pega as informações em formato json
app.use(bodyParser.json());

//definindo as rotas
const rota = express.Router();	// rotas é o q digitamos na url 
rota.get('/', (requisicao, resposta) => resposta.json({ mensagem: 'Funcionando!'}));	//quando a rota for /,vem como param por padrao uma requisao e uma resposta, devolve uma resposta em json 
app.use('/', rota);

//inicia servidor
app.listen(porta);
console.log('API Funcionando!');

function execSQL(sql, resposta) {
	global.conexao.request()
		.query(sql)
		.then(resultado => resposta.json(resultado.recordset))
		.catch(erro => resposta.json(erro));
}

rota.post("/usuario",(requisicao, resposta) =>{
const cod = getCodUsario();
const nome = requisicao.body.nome;
const email = 
})

function getCodUsuario();
{
	var cod = execSQL("select count(*) from Usuario");
	if(cod == null)
		return 1;

	return ++cod;
}