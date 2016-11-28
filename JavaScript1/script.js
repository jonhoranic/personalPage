window.addEventListener('DOMContentLoaded',init,false);
function init() {
var buttons = document.getElementsByTagName("button");
buttons[0].addEventListener('click', toggleTable,false)
buttons[1].addEventListener('click', toggleTable2, false)
}

function toggleTable() {
    var table1 = document.getElementById("ECCO")
        if(table1.style.display=='none') {
            table1.style.display='block';
        }
        else {
        table1.style.display='none';
        }
}

function toggleTable2() {
    var table2 = document.getElementById("NCCO")
        if(table2.style.display=='none') {
            table2.style.display='block';
        }
        else {
        table2.style.display='none';
        }
}
