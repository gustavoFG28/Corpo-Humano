window.onload = function()
{
    $('.modal').modal();
    document.getElementById("btnSubmitNome").onclick = function()
    {
        var obj = new Object();
        obj.novoNome = $("#txtNovoNome").val();
        obj.email = window.sessionStorage.getItem("email");
        $.ajax({
            url: "http://localhost:3000/alteraNome/" + obj.email,
            type: 'patch',
            data: obj
        })
        location.href = "configuracoes.html";
        return false; 
    }
}
