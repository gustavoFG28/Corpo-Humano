window.onload = function()
{
    document.getElementById("tituloMenu").onclick = aumentaMenu; 
    document.getElementById("txtCadastrar").onclick = menuCadastro;
    document.getElementById("btnCancelar").onclick = fechaCadastro;
    criarTabela();
    for(var i = 1; i <= 10; i++ )
        document.getElementById(i + "").onclick = exibeCorpo;
    
}

var estaAumentado = false;

function apertaQuiz()
{
    alert("oi");
}

function menuCadastro()
{
    document.getElementById("cadastro").style.display = "block";
    aumentaMenu();
    
}
// animação d3
function aumentaMenu()
{
    var t = d3.transition().duration(250).ease("elastic");
    var menu = document.getElementById("menu");
    var titulo = document.getElementById("tituloMenu");
    var login = document.getElementById("login");
    titulo.style.position = "relative";
    if(!estaAumentado)
    {
        d3.select("#menu").transition(t).style("width", "20%").style("height", "37%");
        //menu.style.width = "20%";
        //menu.style.height = "37%";
        
        titulo.style.left = "40%";
        
        login.style.display = "block";
        login.style.position = "absolute";
        login.style.top = "3%";
        
        estaAumentado = true;
    }
    else
    {
        d3.select("#menu").transition(t).style("width", "5%").style("height", "20%");
        //menu.style.width = "5%";
        //menu.style.height = "20%";
        titulo.style.left = "0%";
        login.style.display = "none";
        estaAumentado = false;  
    }
}

function fechaCadastro()
{
    document.getElementById("cadastro").style.display = "none";
}


function exibeCorpo()
{
    var area = document.getElementById("areaCorpo");
    document.getElementById("introducao").style.display = "none";
    var img = document.getElementById("imgBanner");
    var caminhoImg = "ImagensSistema/" + this.id + ".png";
    img.src = caminhoImg;
    img.style.height = "90%";
    img.style.top = "5%";
    if(document.getElementById("txtQuiz") == null)
        var quiz = document.createElement("a");
    else
        var quiz = document.getElementById("txtQuiz");
    
    quiz.innerHTML = "TESTE SEUS CONHECIMENTOS!";
    quiz.style.font = "Agency FB";
    quiz.style.position = "absolute";
    quiz.style.left = "20%";
    quiz.style.top = "100%";
    quiz.id = "txtQuiz";
    quiz.className = "textos";
    quiz.href = "quiz.html";
    area.appendChild(quiz);
    quiz.onclick = realizarQuiz;
    criarTabelaOrgao(this);
}

function criarTabela()
{
    var indice = 1;
    var tabela = document.createElement("table");
    for (var i=0; i<5; i++) 
    {
        var tr = document.createElement("tr");
        for(var j =0;j <2; j++)
        {
            var img = document.createElement("img"); 
            img.src = "Imagens/" + indice + ".png"; 
            img.id = indice;
            img.className = "icone";
            var td = document.createElement("td");
            td.appendChild(img);
            tr.appendChild(td);
            indice++;
        }
        tabela.appendChild(tr);
    } 
    document.getElementById("icones").appendChild(tabela);
}

function criarTabelaOrgao(qualIcone)
{
    if(document.getElementById("infoSistema") == null)
    {
        var tabela = document.createElement("table");
        tabela.id = "infoSistema";
        for(var linha = 0; linha < 2; linha++)
        {
            var tr = document.createElement("tr");
            for(var i = 0; i < 4; i++)
            {
                var td = document.createElement("td");
                var div = document.createElement("div");
                div.className = "plan";
                var titulo = document.createElement("h3");
                titulo.innerHTML = "oi";
                var span = document.createElement("span");
                span.id = "spanIcone"
                span.innerHTML = "<img class='iconeOrgao' src='coracao.png'>";
                span.onclick = abrirOrgao;
                titulo.appendChild(span);
                div.appendChild(titulo);
                td.appendChild(div);
                tr.appendChild(td);
                tabela.appendChild(tr);
            }
        }
        document.getElementById("areaCorpo").appendChild(tabela);
    
       
    }
    else
    {
        var tabela = $("#infoSistema");
        tabela.find("td").each(function()
        {
            $(this).find("h3").text(qualIcone.id);
            $("#spanIcone").text("oi");
        })  
    }
}
function abrirOrgao()
{
    var div = document.getElementById("orgao");
    div.style.display = "block";
    div.style.zIndex = "2";
    var fundo = document.createElement("div");
    fundo.id = "fundoPreto"
    fundo.style.height = "100%";
    fundo.style.width = "100%";
    fundo.style.backgroundColor = "black";    
    fundo.style.opacity = "0.8";
    document.getElementById("pagina").appendChild(fundo);
    document.getElementById("btnSair").onclick = fechaDivOrgao;

    var img = document.getElementById("imgOrgao");
    img.src = "intestinoDelgado.png";
}
function fechaDivOrgao()
{
    document.getElementById("orgao").style.display = "none";
    var fundo = document.getElementById("fundoPreto");
    document.getElementById("pagina").removeChild(fundo);
}
        


function realizarQuiz()
{
    
}