var sistemas = ["S.Cardiovascular", "S.Digestorio", "S.Esqueletico", "S.Muscular", "S.Nervoso", "S.ReprFem", "S.ReprMasc", "S.Respiratorio", "S.Urinario"];

window.onload = function () {
    for (var i = 0; i < 9; i++) {
        var elemento = document.createElement("img");
        elemento.src = "\Imagens/" + sistemas[i] +".png";
        elemento.id = sistemas[i];
    }
}
