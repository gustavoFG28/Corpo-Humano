window.onload = function()
{
    $('.modal').modal();
    document.getElementById("btnSubmitNome").onclick = function()
    {
        var obj = new Object();
        obj.novoNome = $("#txtNovoNome").val();
        $.ajax({
            url: "http://localhost:3000/alteraNome/" + window.sessionStorage.getItem("email"),
            type: 'patch',
            data: obj
        })
        location.href = "configuracoes.html";
        return false; 
    }
    document.getElementById("btnSubmitEmail").onclick = function()
    {
        var obj = new Object();
        obj.novoEmail = $("#txtNovoEmail").val();
        $.ajax({
            url: "http://localhost:3000/alteraEmail/" + window.sessionStorage.getItem("email"),
            type: 'patch',
            data: obj
        })
        location.href = "configuracoes.html";
        window.sessionStorage.setItem("email", obj.novoEmail);
        return false; 
    }
    document.getElementById("btnSubmitSenha").onclick = function()
    {
        var obj = new Object();
        obj.novaSenha = $("#txtNovaSenha").val();
        $.ajax({
            url: "http://localhost:3000/alteraSenha/" + window.sessionStorage.getItem("email"),
            type: 'patch',
            data: obj
        })
        location.href = "configuracoes.html";
        return false; 
    }
    /*document.getElementById("btnSubmitNome").onclick = function()
    {
        var obj = new Object();
        obj.novoNome = $("#txtNovoNome").val();
        $.ajax({
            url: "http://localhost:3000/alteraNome/" + window.sessionStorage.getItem("email"),
            type: 'patch',
            data: obj
        })
        location.href = "configuracoes.html";
        return false; 
    }
    document.getElementById("btnSubmitNome").onclick = function()
    {
        var obj = new Object();
        obj.novoNome = $("#txtNovoNome").val();
        $.ajax({
            url: "http://localhost:3000/alteraNome/" + window.sessionStorage.getItem("email"),
            type: 'patch',
            data: obj
        })
        location.href = "configuracoes.html";
        return false; 
    }*/

    document.getElementById("btnExcluir").onclick = function()
    {
        $.ajax({
            url: "http://localhost:3000/excluiConta/" + window.sessionStorage.getItem("email"),
            type: 'delete'
        })
        location.href = "configuracoes.html";
        return false; 
    }
}
