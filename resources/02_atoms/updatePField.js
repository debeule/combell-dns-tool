var UPDATEPFIELD = (function() {
    const CONFIG = {};

    function init(){
        CONFIG.input = document.getElementById("recordName");
        CONFIG.text = document.getElementById("recordExample");
        

        if(!CONFIG.input){
            return;
        }
        CONFIG.firstName = CONFIG.text.getAttribute("data-Name");
        CONFIG.lastName = CONFIG.text.getAttribute("data-LastName");
        
        CONFIG.input.addEventListener("input", updateText);
    }

    function updateText(e) {
        if (e.inputType !== "deleteContentBackward") {
            CONFIG.text.innerHTML = CONFIG.input.value + '.' + CONFIG.firstName + '.' + CONFIG.lastName + '.nxtmediatech.eu';
        }else{
            CONFIG.text.innerHTML = '';
        }
    }

    return {
        init: init,
    }
}());



