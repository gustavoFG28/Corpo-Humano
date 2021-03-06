var pagina;
var respostas = new Array;
var assinalado = new Array;
var acertos = 0;

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

window.onload = function()
{
   var url = new URL(this.location.href);
   var valor = url.searchParams.get("valor");
   gerarQuiz(valor); 
   $('.modal').modal();

   document.getElementById("btnSubmitRanking").onclick = function()
   {
      $.ajax({
          url: "http://localhost:3000/ranking/" + window.sessionStorage.getItem("email") + "/" + acertos,
          type: 'post'
      })

      window.location.href = 'indexLogado.html';
      return false;
   }
}

function gerarQuiz(valor)
{
    var ajax = iniciaAjax();

    var url = "http://localhost:3000/quiz/" + valor;

    ajax.onreadystatechange=function() {
        if (this.readyState == 4 && this.status == 200) {
            exibeQuiz(this.responseText);
        }
    }

    ajax.open("GET", url, true);
    ajax.send();
}


function exibeQuiz(response)
{
    var form = document.getElementById("frmQuiz");
    var arr = JSON.parse(response);

    for (var i=0; i<arr.length; i++) 
    {
        var pergunta = document.createElement("p");
        pergunta.className = 'perguntas';
        pergunta.innerHTML = arr[i].pergunta;   
        respostas[i] = i + arr[i].resposta;

        form.appendChild(pergunta);
        
        for(var j = 0; j < 5; j++)
        {
            if(j == 4 && arr[i].opcaoE == null)
                break;

            var p = document.createElement("p");
            var label = document.createElement("label");
            var resposta = document.createElement("input");
            resposta.type = "radio";
            resposta.name = "rb" + i;
            resposta.onchange = respostaUsuario;
            var respostaTexto = document.createElement("span");

            switch(j)
            {
                case 0: resposta.value = i + "a";  respostaTexto.innerHTML = arr[i].opcaoA; break;
                case 1: resposta.value = i + "b";  respostaTexto.innerHTML = arr[i].opcaoB; break;
                case 2: resposta.value = i + "c";  respostaTexto.innerHTML = arr[i].opcaoC; break;
                case 3: resposta.value = i + "d";  respostaTexto.innerHTML = arr[i].opcaoD; break;
                case 4: resposta.value = i + "e";  respostaTexto.innerHTML = arr[i].opcaoE; break;
                            
            }

            label.appendChild(resposta);
            label.appendChild(respostaTexto);
            p.appendChild(label);
            form.appendChild(p);
        }
        
    } 
    var btn = document.createElement("a");
    btn.className = "btn waves-effect waves-light  modal-trigger";
    btn.href="#enviarInformacoes";
    btn.innerHTML = "<i class='material-icons'>save</i>";
    btn.id = 'btnSubmit';
    btn.onclick =  function(){ corrigirResposta(); }
    form.appendChild(btn);
}

function respostaUsuario()
{
    assinalado[parseInt(this.value.substring(0,1))] = this.value;
}

function corrigirResposta()
{
    for(var i =0; i < 9; i++)
        if(respostas[i] == assinalado[i])
        acertos++;
    
    criaImgAlerta();
}

function criaImgAlerta()
{
    var div = document.getElementById("imgRanking");
    var texto = document.createElement("h1");
    texto.id = "pontuacao";
    texto.className = "titulo";
    texto.innerHTML = "Parabéns, a <br> sua pontuação <br> foi de "+ acertos+"/9";
    div.appendChild(texto);
}