var BTNACTIVE = (function() {
    const CONFIG = {};

    function init(){
        CONFIG.input = document.getElementById("recordName");
        CONFIG.saveButton = document.getElementById("saveButton");
        
        if(!CONFIG.input || !CONFIG.saveButton){
            return;
        }

        CONFIG.input.addEventListener("input", btnActivation);
    }   

    function btnActivation(){
        if(!CONFIG.input.value.length){
            CONFIG.saveButton.disabled = true;            
        }else{
            CONFIG.saveButton.disabled = false;
        }       
    } 

    return {
        init: init,
    }
})();




