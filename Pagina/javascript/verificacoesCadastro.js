 window.onload = function()
{
    document.getElementById("txtNome").onchange = function(){
        verificaNome();
    }
    document.getElementById("txtEmail").onchange = function(){
        verificaEmail();
    }
}

function verificacoesFinais()
{
    verificaNome();
    verificaEmail();
}

function verificaNome()
{
    var nome = document.getElementById("txtNome");
    var regExNome = /[A-Z][a-z]*( [a-z|A-Z][a-z]*)*/;
    var nomeEstaCerto = regExNome.test(nome.value);

    atualizaCampo(nomeEstaCerto, nome);
}

function verificaEmail()
{
    var email = document.getElementById("txtEmail");
    var regExEmail = /[A-Z|a-z]*@[A-Z|a-z]\.[a-z]*/;
    var emailEstaCerto = regExEmail.test(email.value);

    atualizaCampo(emailEstaCerto, email);
}
function verificaSenha()
{
    var senha = document.getElementById("txtSenha").value;
    var confirmaSenha = document.getElementById("txtConfirmaSenha").value;


}
function verificaImgPerfil()
{
    var img = document.getElementById("inputImgPerfil").value;

    alert(img);
}

function verificaImgFundo()
{
    var img = document.getElementById("inputFundoImg").value;
    document.getElementById("imgLa").src= img;
    alert(img);
}

function atualizaCampo(estaCorreto, campo)
{
    if(estaCorreto)
    {
        campo.style.borderBottom = "1px solid lightgreen";
        campo.style.boxShadow = "0 1px 0 0 lightgreen";
    }
    else
    {
        if(campo.value == "")
        {
            campo.style.borderBottom = "1px solid #9e9e9e";
            campo.style.boxShadow = "none";
        }
        else
        {
            campo.style.borderBottom = "1px solid red";
            campo.style.boxShadow = "0 1px 0 0 red";
        }
    }
}