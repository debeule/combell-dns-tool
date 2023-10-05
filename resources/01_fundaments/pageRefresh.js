var PAGEREFRESH = (function() {
    const CONFIG = {};

    function init(){
        CONFIG.buttons = document.querySelectorAll("[data-refresh-page]");
        
        if(CONFIG.buttons.length === 0){
            return;
        }

        refreshPageOnClick();
    }   

    function refreshPageOnClick() {
        for (var i = 0; i < CONFIG.buttons.length; i++) {
            CONFIG.buttons[i].addEventListener("click", function(){
                location.reload();
            });
        }
    } 

    return {
        init: init,
    }
})();