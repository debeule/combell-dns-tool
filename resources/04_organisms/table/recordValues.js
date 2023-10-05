
var RECORDVALUES = (function() {
    const CONFIG = {};

    function init(){
        CONFIG.images = document.querySelectorAll(".editPen");
        
        if(!CONFIG.images){
            return;
        }
        

        CONFIG.images.forEach(function(image) {
            image.addEventListener("click", function() {
                var response = this.dataset.response;
                
                setRecordId(response);
            });
        });
    }
    
    function setRecordId(response) {
        document.getElementById("idrecord").value = JSON.parse(response)["record_id"];
        document.getElementById("editName").value = JSON.parse(response)["record_name"];
        document.getElementById("recordType").value = JSON.parse(response)["type"];
        document.getElementById("edittextField").value = JSON.parse(response)["content"];
    
        return response;
    }

    return {
        init: init,
    }
}());