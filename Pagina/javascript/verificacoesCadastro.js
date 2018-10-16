window.onload = function()
{
    $("input#txtNome").characterCounter();
}
document.getElementById("btnSubmit").onclick = function()
{
    verificaNome();
}

function verificaNome()
{
    
    var regExNome = /[A-Z][a-z]n* [a-z]*n/;
    var nome = document.getElementById("txtNome").value;
    
    var res = regExNome.test(nome);
    try
    {
          if(!res)
              throw 'Nome inválido!'
    }
    catch(erro)
    {
        alert("Digite seu nome corretamente!");
    }
    
}