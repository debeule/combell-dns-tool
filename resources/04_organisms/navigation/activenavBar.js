var ACTIVENAVBAR = (function() {
    const CONFIG = {};

    function init(){
        CONFIG.navbar = document.getElementById("nav");

        if(!CONFIG.navbar){
            return;
        }

        document.addEventListener("DOMContentLoaded", function() {
            let url = window.location.href;
            let navLinks = document.querySelectorAll('#nav li a');
            
            for (let i = 0; i < navLinks.length; i++) {
                if (navLinks[i].href === url) {
                    navLinks[i].classList.add('active');
                    navLinks[i].classList.add('no-click');
                }
            }
        });
    }
    return {
        init: init,
    }
}());