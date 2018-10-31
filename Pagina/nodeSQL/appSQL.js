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

rota.get("/orgao/:cod?/:nome?", (requisicao, resposta) =>{
let filtro = ' ';
if (requisicao.params.cod)
filtro = ' where codigoSistema =' + parseInt(requisicao.params.cod);
if(requisicao.params.nome)
   filtro+= "and nome ='"+ requisicao.params.nome+"'";
execSQL('select * from Orgao' + filtro, resposta);
})


rota.post('/usuario', (requisicao, resposta) =>{
const nome = requisicao.body.nome.substring(0,30);
const email = requisicao.body.email.substring(0,40);
const senha = requisicao.body.senha.substring(0,30);
const imgPerfil = (requisicao.body.imgPerfil == "")? null: "'" + requisicao.body.imgPerfil.substring(0,50) + "'";
const imgFundo = (requisicao.body.imgFundo == "")?null: "'" + requisicao.body.imgFundo.substring(0,50) + "'";

execSQL(`cadastrar_sp '${nome}','${senha}','${email}',${imgPerfil},${imgFundo}`, resposta);
})


rota.get("/sistema/:codigoSistema?", (requisicao, resposta) =>{
	let filtro = ' ';
	if (requisicao.params.codigoSistema)
	filtro = ' where codigoSistema =' + parseInt(requisicao.params.codigoSistema);
	execSQL('select * from Sistema' + filtro, resposta);
})

rota.get("/usuario/:codigoUsuario?", (requisicao, resposta) =>{
	let filtro = ' ';
	if(requisicao.params.codigoUsuario)
	filtro = 'where codigoUsuario = ' + parseInt(requisicao.params.codigoUsuario);
	execSQL('select * from Usuario' + filtro, resposta);
})


rota.post("/loginUsuario", (requisicao, resposta) => {
const email = requisicao.body.email;
const senha = requisicao.body.senha;
execSQL(`login_sp '${email}','${senha}'`, resposta);
})


rota.get("/ranking/:nome", (requisicao, resposta) =>{
execSQL("select * from Ranking where nome like '" + requisicao.params.nome + "%'", resposta);	
}) 

rota.post("/alteraNome", (requisicao, resposta) =>{
const email = requisicao.body.nomeAntigo;
const novoNome = requisicao.body.novoNome;
execSQL("update Usuario set nome = '"+ novoNome + "' where email = '"+ email +"'", resposta);
})