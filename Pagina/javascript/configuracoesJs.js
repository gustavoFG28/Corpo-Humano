window.onload = function()
{
    $('.modal').modal();
    document.getElementById("btnSubmitNome").onclick = function()
    {
        var obj = new Object();
        obj.novoNome = $("#txtNovoNome").val();
        $.ajax({
            url: "http://localhost:3000/alteraNome/" + window.sessionStorage.getItem("email"),
            type: 'post',
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
        window.sessionStorage.setItem("email", obj.novoEmail)
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

    document.getElementById("btnSubmitPerfil").onclick = function()
    {
        var img = document.getElementById("txtNovoPerfil").files[0];
        var r = new FileReader();
        r.onload = function(e)
        {
            var obj = new Object(); 
            var perfil = e.target.result.split(',');
            obj.dataImagem = perfil[1];
            $.ajax({
                url: "http://localhost:3000/alterarPerfil/" + window.sessionStorage.getItem("email") +'/'+ $('#caminhoNovoPerfil').val(),
                type: 'post',
                data: obj
            }).done(function(){
                window.location.href = "configuracoes.html";
            })
            
        }
        r.readAsDataURL(img);
        
         return false; 
    }
    
    document.getElementById("btnSubmitFundo").onclick = function()
    {
        var img = document.getElementById("txtNovoFundo").files[0];

        var r = new FileReader();
        r.onload = function(e)
        {
            fundo = e.target.result.split(',');
            var obj = new Object();
            obj.dataImagem = fundo[1];
            $.ajax({
                url: "http://localhost:3000/alterarFundo/" + window.sessionStorage.getItem("email") + '/'+ $("#caminhoNovoFundo").val(),
                type: 'post',
                data: obj
            }).done(function(){
                window.location.href = "configuracoes.html";
            })
            
        }
        r.readAsDataURL(img);
        
        return false; 
    }

    document.getElementById("btnSubmitExcluir").onclick = function()
    {
        $.ajax({
            url: "http://localhost:3000/excluiConta/" + window.sessionStorage.getItem("email"),
            type: 'delete'
        })
        location.href = "index.html";
        return false; 
    }
}
