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
}


$("document").ready(function(){
    $(".sidenav").sidenav();
    $(".materialboxed").materialbox();
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
        icone.src = "Imagens/" + indice + ".png";
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
        icone.src = "Imagens/" + indice + ".png";
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
        var out = "<div class='col s4' id='divImg'><img id='imgPrincipal' class='materialboxed' src='ImagensSistema/" + this.id + ".png'></div>";
        out += criarTabelaDosOrgaos(this.id);
        document.getElementById("areaOrgaos").innerHTML = out;
        var divs = document.getElementsByClassName("divTextoOrgaos")
        for(x in divs) 
            divs[x].onclick = criarDivOrgao;
    }
    else
        criarRelatorio();
   
}
function criarDivOrgao()
{
    var fundoPreto = document.createElement("div");
    fundoPreto.id = "fundoPreto";
    document.getElementById("pagina").appendChild(fundoPreto);
    

    var div = document.createElement("div");
    div.className = "row";
    div.id = "divOrgao";
    var img = "estomago.png";
    var texto = "EU bombeio o sangue para voce poder viver e isso é bem legal pois eu gosto de voce entao n brigue comigo tá bom?";
    var out = "<div class='col m6'><img  src='" + img+ "'></div><div class='col m6'><p class='txtIntroducao'>"+texto +"</p></div><button id='btnSair' class='btn-floating waves-effect'><i class='material-icons'>close</i></button>"
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
    var out = "<div class='row'>";
    for(var i = 0; i < 10; i++)
        out += "<div class='col s3 txtIntroducao divTextoOrgaos' value='" + i +"'>"+i+"</div>";
    out += "</div>";
    return out;
}

function criarRelatorio()
{
    var out = "<table class='highlight'><th>Usuário</th><th>Pontuação</th>";
    for(var i = 1; i < 10;i++)
        out += "<tr><td>" + (i + 1) + "</td><td>" + i + "</td></tr>";
    out += "</table>";
    document.getElementById("areaOrgaos").innerHTML = out;
}
