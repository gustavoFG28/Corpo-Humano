window.onload = function(){
    document.getElementById("btnSubmit").onclick = fazerLogin;
}

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

function fazerLogin()
{
    var ajax = iniciaAjax();
    var url = "http://localhost:3000/loginUsuario/";
    ajax.onreadystatechange=function() {
        if (this.readyState == 4 && this.status == 200) {
            verificaEntradaLogin(this.responseText);
        }
    }

    ajax.open("post", url, true);
    ajax.send();
}

function verificaEntradaLogin(responseText)
{
    var pessoa = JSON.parse(responseText);
    if(pessoa.length != 0)
    {
        window.location = "indexLogado.html";
    }
    else
        alert(pessoa);

}