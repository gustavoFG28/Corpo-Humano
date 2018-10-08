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
        tabela.style.position = "absolute";
        tabela.style.top = "10%";
        tabela.style.left = "50%";

        var thOrgao = document.createElement("th");
        thOrgao.innerHTML = "Órgão";
       
        var thDescricao = document.createElement("th");
        thDescricao.innerHTML = "Descrição";

        tabela.appendChild(thOrgao);
        tabela.appendChild(thDescricao);

        for (var i=0; i<5; i++) 
        {
            var tr = document.createElement("tr");
            for(var j =0;j <2; j++)
            {
                var td = document.createElement("td");
                td.innerHTML = "indice" + qualIcone.id;
                td.onmouseover = 
                tr.appendChild(td);
            }
            tabela.appendChild(tr);
        } 
        
        document.getElementById("areaCorpo").appendChild(tabela);
    }
    else
    {
        var i = 0;
        var tabela = $("#infoSistema");
        tabela.find("td").each(function()
    {
        $(this).text(qualIcone.id + " e " + ((i % 2 == 0)?i++: i)) ;
    })
    }
}
    function abrirOrgao()
    {

    }
        


function realizarQuiz()
{
    
}