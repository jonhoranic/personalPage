document.getElementById("svg1").onmouseover = function() {mouseOver1()};
        document.getElementById("svg1").onmouseout = function() {mouseOut1()};
        document.getElementById("svg1").onmousedown = function() {mouseDown1()};
        document.getElementById("svg1").onmouseup = function() {mouseUp1()};
        
        function mouseOver1() {
        document.getElementById("svg1").style.opacity="1";
        document.getElementById("circle1").style.fill="red";
        }
        
        function mouseOut1() {
        document.getElementById("circle1").style.fill = "white";
        }
        
        function mouseDown1() {
        document.getElementById("circle1").setAttribute("opacity","0.5");
        document.getElementById("lock1").style.display = "none";
        document.getElementById("lock2").style.display = "none";
        document.getElementById("title").style.display = "inline";
        document.getElementById("links").style.display = "inline";
        document.getElementById("bio").style.display = "inline";
        document.getElementById("build").style.display = "inline";
        document.getElementById("blog").style.display = "inline";
        document.getElementById("HLD").style.display = "inline";
        }
        
        function mouseUp1() {
        document.getElementById("circle1").setAttribute("opacity","1");
        document.getElementById("yay").style.display = "inline";
        document.getElementById("click").style.display = "none";
        document.getElementById("point").style.display = "none";
        }