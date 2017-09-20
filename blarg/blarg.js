document.getElementById("click").onmouseover = function() {mouseOver()};
document.getElementById("press").onmouseout = function() {mouseOut()};
document.getElementById("press").onmousedown = function() {mouseDown()};
document.getElementById("press").onmouseup = function() {mouseUp()};

function mouseOver() {
    document.getElementById("click").style.display = "none";
    document.getElementById("press").style.display = "inline";
}

function mouseOut() {
    document.getElementById("press").style.display = "none";
    document.getElementById("click").style.display = "inline";
}
function mouseDown() {
    document.getElementById("press").style.opacity = "0.5";
}

function mouseUp() {
    document.getElementById("press").style.opacity = "1";
    document.getElementById("click").style.display = "none";
    document.getElementById("press").style.display = "none";
    document.getElementById("point").style.display = "inline";
}
