var tbody;

function init() {
  var bars = document.getElementsByClassName('bar');
  for (var i = 0; i < bars.length; i++) {
    bars[i].addEventListener('click', data, false);
  }
  tbody = document.getElementById('tbody-QA7');
}
function data() {
  hide_last();
  tbody = document.getElementById('tbody-' + this.id);
  tbody.style.display = "table-row-group";
}
function hide_last() {
  tbody.style.display = "none";
}
window.onload = init;