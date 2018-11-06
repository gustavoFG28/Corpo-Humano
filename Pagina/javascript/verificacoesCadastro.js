var imgPerfil, imgFundo;
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
        location.href = 'indexLogado.html?usuario=' + document.getElementById("txtEmail").value;
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
//function verificaImgPerfil()
//{
    // var img = document.getElementById("inputImgPerfil").files[0];
    // var r = new FileReader();
    // r.onload = function(e)
    // {
    //     imgPerfil = e.target.result;
    // }
    // r.readAsDataURL(img);
//}


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
function cadastrar()
{
   if(verificacoesFinais())
   {
       var form = $("#frmCadastro");
       $.post("http://localhost:3000/cadastrarUsuario", form.serialize()).done(function(data){
           if(!data.erro)
            form.each(function(data){
                this.reset();
                
            });
        alert(data.mensagem);
        });
   }
}