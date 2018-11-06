window.onload = function(){
    document.getElementById("btnLogin").onclick = function()
    {
        login();
        location.href = "indexLogado.html?usuario=" + document.getElementById("txtEmail").value;
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