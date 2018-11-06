window.onload = function()
{
    $('.modal').modal();
    document.getElementById("btnSubmitNome").onclick = function()
    {
        enviarSubmitAlteracao(document.getElementById("frmAlteraNome"),"http://localhost:3000/alteraNome");
        location.href = "configuracoes.html";
    }
}


function enviarSubmitAlteracao(formulario, url)
{
    $.patch(url, formulario.serialize()).done(function(data){
        if(!data.erro)
        formulario.each(function(data){
            this.reset();
        });
    });
}