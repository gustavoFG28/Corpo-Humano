window.onload = function(){
    document.getElementById("btnSubmit").onclick = fazerLogin;
}
function fazerLogin()
{
    document.getElementById("frmLogin").submit()
    window.location.href = "indexLogado.html";
    alert("oi");
    var ajax = iniciaAjax();
    var url = "http://localhost:3000/loginUsuario";

    ajax.onreadystatechange=function() {
        if (this.readyState == 4 && this.status == 200) {
            atualizaPaginaLogado(this.responseText);
        }
    }

    ajax.open("post", url, true);
    ajax.send();
}

atualizaPaginaLogado(response)
{
    var arr = JSON.parse(response);
    alert(arr[0]);

}
