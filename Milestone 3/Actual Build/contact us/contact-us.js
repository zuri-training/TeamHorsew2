var menu = document.getElementById('menu');
var links = document.getElementById('links');
var closeBtn = document.getElementById('close');



var x = window.matchMedia("(max-width: 980px)");

 if (x.matches) {
        menu.addEventListener('click', function(){
            links.style.display = 'block';
            menu.style.display = 'none';
            closeBtn.style.display = 'block';
        })

        closeBtn.addEventListener('click', function(){
            links.style.display = 'none';
            menu.style.display = 'block';
            closeBtn.style.display = 'none';
        })
    }

