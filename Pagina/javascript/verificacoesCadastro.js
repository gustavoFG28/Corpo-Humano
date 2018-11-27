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
          verificaSenha(this);
    }
    document.getElementById("txtSenha").onchange = function(){
        verificaSenha(this);
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

    if(!nomeEstaCerto)
        $("#nomeErro").html("Escreva seu nome corretamente incluindo letras maiúsculas!");
    else
        $("#nomeErro").html("");
    

    return atualizaCampo(nomeEstaCerto, nome);
}

function verificaEmail()
{
    var email = document.getElementById("txtEmail");
    var regExEmail = /[A-Z|a-z]*\@[A-Z|a-z]*\.[a-z]*/;
    var emailEstaCerto = regExEmail.test(email.value);

    if(!emailEstaCerto)
        $("#emailErro").html("Escreva seu email corretamente! EX: nome@dominio.com");
    else
        $("#emailErro").html("");

    return atualizaCampo(emailEstaCerto, email);
}

function verificaSenha(obj)
{
    if(obj.value == "" || obj.value.length < 8)
    {
        $("#senhaErro").html("8 caracteres requeridos!");
        return atualizaCampo(false,obj);
    }
        
    
    if($("#txtConfirmaSenha").val() == "")
    {
        $("#senhaErro").html("");
        return atualizaCampo(true,obj);
    }
    else
        if($("#txtSenha").val() != $("#txtConfirmaSenha").val())
        {
            $("#senhaErro").html("Os campos referentes as senhas estão diferentes!");
            atualizaCampo(false, document.getElementById("txtSenha"));
            return atualizaCampo(false, document.getElementById("txtConfirmaSenha"));
        }
        
    $("#senhaErro").html("");
    atualizaCampo(true, document.getElementById("txtSenha"));
    return atualizaCampo(true, document.getElementById("txtConfirmaSenha"));
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

        window.sessionStorage.setItem("email", document.getElementById("txtEmail").value);
        location.href = 'indexLogado.html';
   }
}