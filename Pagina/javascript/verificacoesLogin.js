window.onload = function(){
    document.getElementById("btnLogin").onclick = function()
    {
        var ajax = iniciaAjax();
       
        var url = "http://localhost:3000/entrar/" +  document.getElementById("txtEmail").value + "/" +  document.getElementById("txtSenha").value;
        ajax.onreadystatechange=function() {
            if (this.readyState == 4 && this.status == 200) {
                verificaUsuario(this.responseText);
            }
        }
    
        ajax.open("GET", url, true);
        ajax.send();

    }

}

$(document).keypress(function(e) {
    if(e.which == 13) $('#btnLogin').click();
});

function verificaUsuario(responseText)
{ 
    var arr = JSON.parse(responseText);

    if(arr[0] == null)
        alert("Senha ou email incorretos!");
    else  
    {
        login();
        window.sessionStorage.setItem("email", document.getElementById("txtEmail").value);
        location.href = "indexLogado.html";
    }
}

function login()
{
    var form = $("#frmLogin");
    $.post("http://localhost:3000/loginUsuario", form.serialize()).done(function(data){
        if(!data.erro)
        form.each(function(data){
            this.reset();
        });
    });
}