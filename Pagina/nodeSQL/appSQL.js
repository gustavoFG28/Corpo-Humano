const express = require('express');		// variavel associada com o modulo do pacote express
const app = express();					// objeto do tipo express - acessar o banco
const bodyParser = require('body-parser');		// variavel associada com o modulo do pacote body-parser
const porta = 3000;						 //porta padrão - passar na url para acessar a aplicação
const sql = require('mssql');			// variavel que usa as funções do pacote mssql
const conexaoStr = "Server=regulus;Database=PR118194;User Id=PR118194;Password=guisa2018;";	// string necessária para conectar-se ao banco

//conexao com BD
sql.connect(conexaoStr)	// sql é instancia, connect conecta ao banco q tem como param a string
   .then(conexao => global.conexao = conexao)	//se conectar(then) retorna a conexao com o banco banco 
   .catch(erro => console.log(erro));		//se n conectar retorna o erro 

// configurando o body parser para pegar POSTS mais tarde
app.use(bodyParser.urlencoded({ extended: true}));	// pega as informações em formato json
app.use(bodyParser.json());
app.use(function(req, res, next) { 
res.header("Access-Control-Allow-Origin", "*"); 
res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept"); 
res.header("Access-Control-Allow-Methods", "GET, POST, HEAD, OPTIONS, PATCH, DELETE"); next(); 
});

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

rota.get("/orgao/:cod?", (requisicao, resposta) =>{
let filtro = ' ';
if (requisicao.params.cod)
filtro = ' where codigoSistema =' + parseInt(requisicao.params.cod);
execSQL('select nome from Orgao' + filtro, resposta);
})

rota.post('/usuario', (requisicao, resposta) =>
{
const cod = codUsuario();
const nome = requisicao.body.nome;
const email = String(requisicao.body.email);
const senha = String(requisicao.body.senha);
const imgPerfil = requisicao.body.imgPerfil.substring(0,50);
const imgFundo = requisicao.body.imgFundo.substring(0,50);
execSQL(`INSERT INTO Usuario(codigoUsuario, nome, senha, email, imagem, imgFundo) VALUES('${cod}','${nome}','${senha}','${email}','${imgPerfil}','${imgFundo}')`, resposta);
})

function codUsuario()
{
	var cod = execSQL("select count(*) from Usuario");
	if(cod == null)
		return 1;
	cod++;
	return cod;
}

rota.get("/sistema/:codigoSistema?", (requisicao, resposta) =>{
	let filtro = ' ';
	if (requisicao.params.codigoSistema)
	filtro = ' where codigoSistema =' + parseInt(requisicao.params.codigoSistema);
	execSQL('select descricao from Sistema' + filtro, resposta);
})

// rota.post("/loginUsuario", (requisicao, resposta) => {
// const email = requisicao.body.email;
// const senha = requisicao.body.senha;
// const registro = execSQL("select * from Usuario where email ='" + email + "'", resposta);
// })