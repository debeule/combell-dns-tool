var LABELTEXT = (function() {
    const CONFIG = {};

    function init(){
        CONFIG.dropdown = document.getElementById("dropdown");
        CONFIG.label = document.getElementById("labelTextField");
        
        if(!CONFIG.dropdown){
            return;
        }

        document.addEventListener("DOMContentLoaded", function(){
            handleDropdownChange();
        });
    }

    function handleDropdownChange() {
        var dropdown = CONFIG.dropdown;
        var label = CONFIG.label;
        
        dropdown.addEventListener("change", function() {
            if (dropdown.value == "TXT") {
                label.innerText = "Value";
            }
            if (dropdown.value == "CNAME") {
                label.innerText = "Destination";
            }
        });
    }

    return {
        init: init,
    }
}());