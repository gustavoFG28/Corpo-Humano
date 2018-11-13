window.onload = function()
{
    var ajax = iniciaAjax();

    var url = "http://localhost:3000/entrar/" + window.sessionStorage.getItem("email");
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
   
   document.getElementById("imgPerfilUsuario").onerror = deuErroNaImagem;
   document.getElementById("imgFundoUsuario").onerror = deuErroNaImagem;

   document.getElementById("imgPerfilUsuario").src = arr[0].imgPerfil;
   document.getElementById("imgFundoUsuario").style.backgroundImage = `url('${arr[0].imgFundo}')`;
   document.getElementById("quizBasico").href = "quiz.html?valor=basico";
   document.getElementById("quizAvancado").href = "quiz.html?valor=avancado";
}

function deuErroNaImagem()
{
    this.style.backgroundImage = "url('estilo/Imagens/fundo.png')";
}