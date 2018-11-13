const express = require('express');
const fs = require('fs');
const app = express();         
const bodyParser = require('body-parser');
const porta = 3000; //porta padrão
const sql = require('mssql');
const conexaoStr = "Server=regulus;Database=PR118194;User Id=PR118194;Password=guisa2018;";

//conexao com BD
sql.connect(conexaoStr)
   .then(conexao => global.conexao = conexao)
   .catch(erro => console.log(erro));

// configurando o body parser para pegar POSTS mais tarde   
app.use(bodyParser.urlencoded({ limit: '500gb', extended: true}));
app.use(bodyParser.json({ limit: '500gb', extended: true}));
//acrescentando informacoes de cabecalho para suportar o CORS
app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  res.header("Access-Control-Allow-Methods", "GET, POST, HEAD, OPTIONS, PATCH, DELETE");
  next();
});
//definindo as rotas
const rota = express.Router();
rota.get('/', (requisicao, resposta) => resposta.json({ mensagem: 'Funcionando!'}));
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


rota.post('/cadastrarUsuario', (requisicao, resposta) =>{
const nome = requisicao.body.nome;
const senha = requisicao.body.senha;
const email = requisicao.body.email;
execSQL(`cadastrar_sp '${nome}','${senha}','${email}'`, resposta);
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


rota.get("/ranking/:nome?", (requisicao, resposta) =>{
let filtro = ' ';
if(requisicao.params.nome)
	filtro = " where nome like '"+ requisicao.params.nome + "%'";
execSQL("select * from Ranking" + filtro + " order by pontos desc", resposta);	
}) 

rota.post("/ranking/:email/:pontos", (requisicao, resposta)=>{
	execSQL("insereRanking_sp '"+ requisicao.params.email +"',"+ requisicao.params.pontos, resposta)
})

rota.get("/quiz/:dif?", (requisicao, resposta) =>{
	let filtro = ' ';
	if(requisicao.params.dif)
	filtro = "where dificuldade = '" + requisicao.params.dif + "'";
	execSQL('select * from Quiz ' + filtro, resposta);
})

rota.post("/alteraNome/:email", (requisicao, resposta) =>{
	const email = requisicao.params.email;
	const novoNome = requisicao.body.novoNome;
    execSQL(`AlteraNome_sp '${email}', '${novoNome}'`, resposta);
})
rota.patch("/alteraEmail/:email", (requisicao, resposta) =>{
	const email = requisicao.params.email;
	const novoEmail = requisicao.body.novoEmail;
    execSQL(`update Usuario set email='${novoEmail}' where email='${email}'`, resposta);
})
rota.patch("/alteraSenha/:email", (requisicao, resposta) =>{
	const email = requisicao.params.email;
	const novaSenha = requisicao.body.novaSenha;
    execSQL(`update Usuario set senha='${novaSenha}' where email='${email}'`, resposta);
})
rota.post("/alteraImgPerfil/:email/:nomeImg", (requisicao, resposta) =>{
	const email = requisicao.params.email;
	const perfil = requisicao.body.novaImg;
	const caminho = 'estilo/uploadsPerfil/' + requisicao.params.nomeImg;
	fs.writeFile(caminho, perfil, 'base64', function(err){
		console.log(err);
	});
	execSQL("update Usuario set imgPerfil ='"+ 'nodeSql/' + caminho + `' where email='${email}'`);
})

rota.post("/alteraImgFundo/:email/:nomeImg", (requisicao, resposta) =>{
	const email = requisicao.params.email;
	const novaImg = requisicao.body.novaImg;
    const caminho = 'estilo/uploadsFundo/' + requisicao.params.nomeImg;
	fs.writeFile(caminho, novaImg, 'base64', function(err){
		console.log(err);
	});
	execSQL("update Usuario set imgFundo ='"+ 'nodeSql/' + caminho + `' where email='${email}'`);
})


rota.delete("/excluiConta/:email", (requisicao, resposta)=>{
	const email = requisicao.params.email;
	execSQL(`delete from Usuario where email='${email}'`, resposta);
})

rota.get("/entrar/:email/:senha?", (requisicao, resposta) =>{
	let filtro = '';
	if(requisicao.params.senha)
	filtro = " and senha = '"+ requisicao.params.senha+"'";
	execSQL("select * from Usuario where email='" + requisicao.params.email + "'" + filtro, resposta);
})

