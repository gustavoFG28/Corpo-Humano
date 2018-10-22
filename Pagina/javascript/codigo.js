var pagina;
function iniciaAjax()
{
    var objetoAjax;
    if(window.XMLHttpRequest)
        objetoAjax = new XMLHttpRequest();
    else if(window.ActiveXObject)
    {
        objetoAjax = new ActiveXObject("Msxml2.XMLHTTP");
        if(!objetoAjax)
            objetoAjax = new ActiveXObject("Microsoft.XMLHTTP");
    }
    else
        alert("Seu navegado não suporta esta aplicação!");

    return objetoAjax;
}

$("document").ready(function(){
    pagina = 0;
    $(".sidenav").sidenav();
    $(".materialboxed").materialbox();
    $('.dropdown-trigger').dropdown();
    gerarSistemas();
})  



function gerarSistemas()
{
    var campo = document.getElementById("areaSistemas");
    var indice = 1;
    var div1 = document.createElement("div");
    div1.className = "col s12 m6";
    for(var i = 1; i <= 5; i++)
    {
        var icone = document.createElement("img");
        icone.className = "icone";
        icone.src = "estilo/Imagens/" + indice + ".png";
        icone.onclick = atualizaPrincipal;
        icone.id = indice;
        div1.appendChild(icone);
        indice++
    }
    var div2 = document.createElement("div");
    div2.className = "col s12 m6";
    for(var i = 1; i <= 5; i++)
    {
        var icone = document.createElement("img");
        icone.className = "icone";
        icone.src = "estilo/Imagens/" + indice + ".png";
        icone.onclick = atualizaPrincipal;
        icone.id = indice;
        div2.appendChild(icone);
        indice++;
    }
    campo.appendChild(div1);
    campo.appendChild(div2);
}

function atualizaPrincipal()
{
    if(this.id != 10)
    {
        var out = "<div class='col s4' id='divImg'><img id='imgPrincipal' src='estilo/ImagensSistema/" + this.id + ".png'></div>";
        document.getElementById("areaOrgaos").innerHTML = out;
        criarTabelaDosOrgaos(this.id);
    }
    else
        criarRelatorio();
   
}
function criarDivOrgao(onde)
{
    var fundoPreto = document.createElement("div");
    fundoPreto.id = "fundoPreto";

    document.getElementById("pagina").appendChild(fundoPreto);

    var ajax = iniciaAjax();
 
    var url = "http://localhost:3000/orgao/" + onde;
    ajax.onreadystatechange=function() {
        if (this.readyState == 4 && this.status == 200) {
            exibeInfoOrgao(this.responseText);
        }
    }

    ajax.open("GET", url, true);
    ajax.send();

    
}


function exibeInfoOrgao(response) {
    var arr = JSON.parse(response);

    var div = document.createElement("div");
    div.className = "row";
    div.id = "divOrgao";

    var titulo = arr[0].nome;
    var img = arr[0].imagem;
    var texto = arr[0].descricao;
  
    var out = "<div class='col m5'><img  src='" + img + "'></div><div class='col m7'><h1>"+titulo+"</h1><p class='txtDescOrgao'>"+texto.substring(0, texto.indexOf("http"));

    var sub = texto.split("http");
    for(var i = 1 ; i < sub.length;i++)
       out+= "<a class='linkTextoOrgao' target='_blank' href='http"+sub[i]+"'> http"+sub[i]+"</a>";
    
     out+="</p></div><button id='btnSair' class='btn-floating waves-effect'><i class='material-icons'>close</i></button>" ;

    div.innerHTML = out;

    document.getElementById("pagina").appendChild(div);
    document.getElementById("btnSair").onclick = function()
    {
        document.getElementById("pagina").removeChild(fundoPreto);
        document.getElementById("pagina").removeChild(div);
    }
   
   
}

function criarTabelaDosOrgaos(indice)
{
    var nomes;
    var ajax = iniciaAjax();
    var url = "http://localhost:3000/orgao/" + indice;
    ajax.onreadystatechange=function() {
        if (this.readyState == 4 && this.status == 200) {
            exibeDados(this.responseText, indice);
        }
    }

    ajax.open("GET", url, true);
    ajax.send();

   
}

function exibeDados(response, indice) {
    var arr = JSON.parse(response);
    var out = "<div class='col s8' id='areaSistema'><table class='responsive-table centered' id='tabelaNomeOrgaos'>";

    for(var i = 0; i < arr.length; i++) {
        var nome = indice + "/" + arr[i].nome;
        out += "<tr value='" + i +"'><td class='txtNomeOrgao' onclick=\"criarDivOrgao('"+nome +"'"+");\">" + arr[i].nome + "</td>"+ (((i+1) != arr.length)?"<td class='txtNomeOrgao' onclick=\"criarDivOrgao('"+ indice+"/"+arr[++i].nome+"'"+");\">" + arr[i].nome + "</td>":"") + "</tr>";
    }
    out += "</table></div>";
    document.getElementById("areaOrgaos").innerHTML += out;

    var ajaxDescricao = iniciaAjax();
    var url = "http://localhost:3000/sistema/" + indice;

    ajaxDescricao.onreadystatechange=function() {
        if (this.readyState == 4 && this.status == 200) {
            exibeDescricaoSistema(this.responseText);
        }
    }
    
    ajaxDescricao.open("GET", url, true);
    ajaxDescricao.send();
}
function exibeDescricaoSistema(response)
{
    var objDesc = JSON.parse(response);
    var texto = objDesc[0].descricao;
    var out = "<p class='descricaoSistema'>" + texto.substring(0, texto.indexOf("http")) + "<ul>";
    var sub = texto.split("http");
    for(var i = 1 ; i < sub.length;i++)
        out+= "<li><a class='linkTextoSistema' target='_blank' href='http"+sub[i]+"'> http"+sub[i]+"</a></li>";
    
    out+="</u></p>" 
    document.getElementById("areaSistema").innerHTML += out;
}

function criarRelatorio()
{
    var out = "<table id='tabelaPontuacao' class='highlight '><th>Usuário</th><th>Pontuação</th>";
    for(var i = 1; i <= 5;i++)
        out += "<tr><td>" + (i + (pagina * 5)) + "</td><td>" + (i+1) + "</td></tr>";
    out += "</table>";
    out += "<p><div class='row'><div class='col s2'><button id='btnRetroceder' class='btn-floating waves-effect waves-light" + ((pagina == 0)?" disabled":"") +"'><i class='material-icons'>arrow_back</i></button></div>";
    out += "<div class='input-field col s8'><form id='frmBusca' action='http://localhost:3000/loginUsuario/'><i class='material-icons prefix'>search</i><input type='text' id='txtBuscaNome'><label for='txtBuscaNome'>Buscar</label></div>";
    out += "<div class='col s2'><button id='btnAvancar' class='btn-floating waves-effect waves-light'><i class='material-icons'>arrow_forward</i></button></div></div></p>";
    
    document.getElementById("areaOrgaos").innerHTML = out;
    document.getElementById("btnRetroceder").onclick = clickBtnRetroceder;
    document.getElementById("btnAvancar").onclick = clickBtnAvancar;
}

function clickBtnRetroceder()
{
    pagina--;
    criarRelatorio();
}

function clickBtnAvancar()
{
    pagina++;
    criarRelatorio();
}


