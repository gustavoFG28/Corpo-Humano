window.onload = function()
{
    document.getElementById("btnAlteraNome").onclick = aparecer;
}

function aparecer()
{
    document.getElementById(this.value + "").style.display = "block";
    document.getElementById("areaDeAlteracao").style.display = "block";
}