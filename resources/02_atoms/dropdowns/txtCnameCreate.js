var FORMTXTCNAME = (function() {
    const CONFIG = {};

    function init(){
        CONFIG.selectedValue = document.getElementById("dropdown");
        
        if(!CONFIG.selectedValue){
            return;
        }
        
        updateTextField(CONFIG.selectedValue);
        
        document.getElementById("dropdown").addEventListener("change", function(){
            updateTextField(this.value);
        });
    }
    function updateTextField(selectedValue) {
        if (selectedValue == "TXT" || selectedValue == "CNAME") {
            document.getElementById("textField").style.display = "inline-grid";
            document.getElementById("labelTextField").style.display = "block";
        } 
        else {
            document.getElementById("textField").style.display = "none";
            document.getElementById("labelTextField").style.display = "none";
        }
    }
    return {
        init: init,
    }
}());