 window.onload = function()
{
    document.getElementById("txtNome").onchange = function(){
        verificaNome();
    }
    document.getElementById("txtEmail").onchange = function(){
        verificaEmail();
    }
    document.getElementById("txtConfirmaSenha").onchange = function(){
          verificaSenha();
    }
    document.getElementById("txtSenha").onchange = function(){
        verificaSenha();
  }
    document.getElementById("btnSubmit").onclick = function(){
        cadastrar();
    }
}

function verificacoesFinais()
{
    if(!verificaNome())
        return false;

    if(!verificaEmail())
       return false;

    if(!verificaSenha())
        return false;

    return true;
}

function verificaNome()
{
    var nome = document.getElementById("txtNome");
    var regExNome = /[A-Z][a-z]*( [a-z|A-Z][a-z]*)*/;
    var nomeEstaCerto = regExNome.test(nome.value);

    return atualizaCampo(nomeEstaCerto, nome);
}

function verificaEmail()
{
    var email = document.getElementById("txtEmail");
    var regExEmail = /[A-Z|a-z]*\@[A-Z|a-z]*\.[a-z]*/;
    var emailEstaCerto = regExEmail.test(email.value);

    return atualizaCampo(emailEstaCerto, email);
}
function verificaSenha()
{
    if(document.getElementById("txtConfirmaSenha").value !=  document.getElementById("txtSenha").value){
        atualizaCampo(false,document.getElementById("txtSenha"));
        return atualizaCampo(false, document.getElementById("txtConfirmaSenha"));
    }
     else{
        atualizaCampo(true, document.getElementById("txtConfirmaSenha"));
        return atualizaCampo(true,document.getElementById("txtSenha"));
     }  
      
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
    return estaCorreto;
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

function cadastrar()
{
   if(verificacoesFinais())
   {
        document.getElementById("frmCadastro").submit();  
        window.location.href='indexLogado.html'
   }
    else
       return;
}