window.onload = function()
{
    var ajax = iniciaAjax();

    var urlSite = new URL(this.location.href);
    var valor = urlSite.searchParams.get("usuario");

    var url = "http://localhost:3000/entrar/" + valor;
    ajax.onreadystatechange=function() {
        if (this.readyState == 4 && this.status == 200) {
            carregarInfo (this.responseText);
        }
    }

    ajax.open("GET", url, true);
    ajax.send();
}

function carregarInfo(responseText)
{
   var arr = JSON.parse(responseText);

   document.getElementById("nomeUsuario").innerHTML = arr[0].nome;
   document.getElementById("emailUsuario").innerHTML = arr[0].email;
   document.getElementById("imgPerfilUsuario").src = arr[0].imgPerfil;
   document.getElementById("imgFundoUsuario").src = arr[0].imgFundo;
   document.getElementById("quizBasico").href = "quiz.html?valor=basico?email="+  arr[0].email;
   document.getElementById("quizAvancado").href = "quiz.html?valor=avancado?email="+ arr[0].email;
}